unit uPedidoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, data.db, System.Rtti, FireDAC.Comp.Client,
  uInterfaceCadastroController, uPedidoCadastro, uPedidoCadastroRegra,
  uPedidoCadastroModel, uPedidoDTO, uProdutoListaHash, uProdutoListagemModel,
  uProdutoDTO, uEstadoDTO, uEstadoListaHash, uEstadoListagemModel,
  uMunicipioDTO, uMunicipioListagemModel, uMunicipioListaHash, uBairroDTO,
  uBairroListagemModel, uBairroListaHash, uClienteListaHash,
  uClienteListagemModel, uClienteDTO, uSaborListaHash, uSaborDTO,
  uSaborListagemModel, uIntensPedidoDTO;

type
  TMontarGrid = procedure of object;

  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
    oItensPedidoDTO: TItensPedidoDTO;
    iIdEstado, iIDProduto: Integer;
    dEditarValorTotal: Double;
    oMontarGrid: TMontarGrid;
    procedure SalvarItens(Sender: TObject);
    procedure ExcluirItens(Sender: TObject);
    procedure EditarItens(Sender: TObject);
    procedure NovoItens(Sender: TObject);
    procedure OnActivateForm(Sender: TObject);
    procedure ComboBoxProduto(Sender: TObject);
    procedure ComboBoxMunicipio(Sender: TObject);
    procedure ComboBoxBairro(Sender: TObject);
    procedure ComboBoxCliente(Sender: TObject);
    procedure CheckSabor(Sender: TObject);
    procedure ValidarCamposItensPedido(Sender: TObject);
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure RetornarValorEdit(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create(const AProcedimentoMontarGrid: TMontarGrid);
    destructor Destroy; override;
  end;

var
  oPedidoCadastroController: IInterfaceCadastroController;

implementation

{ TPedidoCadastroController }

procedure TPedidoCadastroController.CheckSabor(Sender: TObject);
var
  oSaborLista: TSaborListaHash;
  oSaborModel: TSaborListagemModel;
  oSaborDTO: TSaborDTO;
  iCount, I, J, iValor, iValorArray: Integer;
  aSabor: array of Integer;
begin
  if (frmPedidoCadastro.GroupSabores.Enabled = True) then
  begin
    SetLength(aSabor, 0);
    for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
    begin
      if (frmPedidoCadastro.clkSabores.Checked[I]) then
      begin
        iCount := Length(aSabor);
        SetLength(aSabor, iCount + 1);
        aSabor[iCount] :=
          Integer(frmPedidoCadastro.clkSabores.Items.Objects[I]);
      end;
    end;
  end;

  frmPedidoCadastro.clkSabores.Clear;
  try
    oSaborLista := TSaborListaHash.Create([doOwnsValues]);
    oSaborModel := TSaborListagemModel.Create;

    if (oPedidoRegra.CheckSabor(oSaborLista, oSaborModel)) then
    begin
      for oSaborDTO in oSaborLista.Values do
      begin
        frmPedidoCadastro.clkSabores.Items.AddObject(oSaborDTO.descricao,
          TObject(oSaborDTO.idsabores));
      end;
    end;

    if (Length(aSabor) > 0) then
    begin
      for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
      begin
        iCount := Length(aSabor);
        for J := 0 to iCount do
        begin
          iValor := Integer(frmPedidoCadastro.clkSabores.Items.Objects[I]);
          iValorArray := aSabor[iCount];
          if (iValorArray = iValor) then
          begin
            frmPedidoCadastro.clkSabores.Checked[I] := True;
          end;
          iCount := iCount - 1;
        end;
      end;
    end;

  finally
    if (Assigned(oSaborModel)) then
      FreeAndNil(oSaborModel);

    if (Assigned(oSaborLista)) then
      FreeAndNil(oSaborLista);
  end;
end;

procedure TPedidoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmPedidoCadastro))) then
    exit;
  frmPedidoCadastro.Close;
  FreeAndNil(frmPedidoCadastro);
end;

procedure TPedidoCadastroController.ComboBoxBairro(Sender: TObject);
var
  oBairroLista: TBairroListaHash;
  oBairroDTO: TBairroDTO;
  oBairroModel: TBairroListagemModel;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbMunicipio.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  try
    frmPedidoCadastro.cbBairro.Items.Clear;
    frmPedidoCadastro.cbBairro.Clear;

    oBairroLista := TBairroListaHash.Create([doOwnsValues]);
    oBairroModel := TBairroListagemModel.Create;
    iId := Integer(frmPedidoCadastro.cbMunicipio.Items.Objects
      [frmPedidoCadastro.cbMunicipio.ItemIndex]);

    if (oPedidoRegra.ComboBoxBairro(oBairroLista, iId, oBairroModel)) then
    begin
      for oBairroDTO in oBairroLista.Values do
      begin
        frmPedidoCadastro.cbBairro.Items.AddObject(oBairroDTO.descricao,
          TObject(oBairroDTO.idBairro));
      end;
    end;

  finally
    if (Assigned(oBairroLista)) then
      FreeAndNil(oBairroLista);

    if (Assigned(oBairroModel)) then
      FreeAndNil(oBairroModel);
  end;
end;

procedure TPedidoCadastroController.ComboBoxCliente(Sender: TObject);
var
  oClienteDTO: TClienteDTO;
  oListacliente: TClienteListaHash;
  oClienteListagem: TClienteListagemModel;
  iId: Integer;
begin
  try
    if (frmPedidoCadastro.cbCliente.ItemIndex <> -1) then
    begin
      iId := Integer(frmPedidoCadastro.cbCliente.Items.Objects
        [frmPedidoCadastro.cbCliente.ItemIndex]);
    end
    else
      iId := -1;

    frmPedidoCadastro.cbCliente.Items.Clear;
    oClienteListagem := TClienteListagemModel.Create;
    oListacliente := TClienteListaHash.Create([doOwnsValues]);

    if oPedidoRegra.ComboBoxCliente(oListacliente, oClienteListagem) then
    begin
      for oClienteDTO in oListacliente.Values do
        frmPedidoCadastro.cbCliente.Items.AddObject(oClienteDTO.Nome,
          TObject(oClienteDTO.IdCliente));
    end;

    if (iId <> -1) then
      frmPedidoCadastro.cbCliente.ItemIndex :=
        frmPedidoCadastro.cbCliente.Items.IndexOfObject(TObject(iId));

  finally
    if (Assigned(oListacliente)) then
      FreeAndNil(oListacliente);

    if (Assigned(oClienteListagem)) then
      FreeAndNil(oClienteListagem);
  end;
end;

procedure TPedidoCadastroController.ComboBoxMunicipio(Sender: TObject);
var
  oMunicipioDTO: TMunicipioDTO;
  oListaMunicipio: TMunicipioListaHash;
  oMunicipioModel: TMunicipioListagemModel;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbEstado.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  try
    if (frmPedidoCadastro.cbMunicipio.ItemIndex <> -1) then
    begin
      frmPedidoCadastro.cbBairro.Items.Clear;
      frmPedidoCadastro.cbBairro.Clear;
    end;
    frmPedidoCadastro.cbMunicipio.Items.Clear;
    frmPedidoCadastro.cbMunicipio.Clear;
    iId := Integer(frmPedidoCadastro.cbEstado.Items.Objects
      [frmPedidoCadastro.cbEstado.ItemIndex]);
    oListaMunicipio := TMunicipioListaHash.Create([doOwnsValues]);
    oMunicipioModel := TMunicipioListagemModel.Create;

    if (oPedidoRegra.ComboBoxMunicipio(oListaMunicipio, iId, oMunicipioModel))
    then
    begin
      iIdEstado := iId;
      for oMunicipioDTO in oListaMunicipio.Values do
      begin
        frmPedidoCadastro.cbMunicipio.Items.AddObject(oMunicipioDTO.descricao,
          TObject(oMunicipioDTO.IdMunicipio));
      end;
    end;
  finally
    if (Assigned(oMunicipioModel)) then
      FreeAndNil(oMunicipioModel);

    if (Assigned(oListaMunicipio)) then
      FreeAndNil(oListaMunicipio);
  end;
end;

procedure TPedidoCadastroController.ComboBoxProduto(Sender: TObject);
var
  oProdutoDTO: TProdutoDTO;
  oProdutoModel: TProdutoListagemModel;
  oProdutoLista: TProdutoListaHash;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    iId := Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
  end
  else
    iId := -1;

  frmPedidoCadastro.cbProduto.Items.Clear;
  try
    oProdutoLista := TProdutoListaHash.Create([doOwnsValues]);
    oProdutoModel := TProdutoListagemModel.Create;

    if oPedidoRegra.ComboBoxProduto(oProdutoLista, oProdutoModel) then
    begin
      for oProdutoDTO in oProdutoLista.Values do
      begin
        frmPedidoCadastro.cbProduto.Items.AddObject(oProdutoDTO.descricao,
          TObject(oProdutoDTO.idProduto));
      end;
    end;

    if (iId <> -1) then
    begin
      frmPedidoCadastro.cbProduto.ItemIndex :=
        frmPedidoCadastro.cbProduto.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oProdutoLista)) then
      FreeAndNil(oProdutoLista);

    if (Assigned(oProdutoModel)) then
      FreeAndNil(oProdutoModel);
  end;
end;

constructor TPedidoCadastroController.Create(const AProcedimentoMontarGrid
  : TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
  oPedidoDTO := TPedidoDTO.Create;
  oPedidoRegra := TPedidoCadastroRegra.Create;
  oPedidoModel := TPedidoCadastroModel.Create;
  oItensPedidoDTO := TItensPedidoDTO.Create;
end;

procedure TPedidoCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmPedidoCadastro))) then
  begin
    frmPedidoCadastro := TfrmPedidoCadastro.Create(AOwner);
    frmPedidoCadastro.fdMemTable.CreateDataSet;
  end;

  frmPedidoCadastro.oInterfaceCadastroController := oPedidoCadastroController;
  frmPedidoCadastro.Show;

  frmPedidoCadastro.btnSalvar.Enabled := True;
  frmPedidoCadastro.btnNovo.Enabled := False;

  frmPedidoCadastro.btnSalvarItens.OnClick := SalvarItens;
  frmPedidoCadastro.btnExcluiItens.OnClick := ExcluirItens;
  frmPedidoCadastro.btnEditarItens.OnClick := EditarItens;
  frmPedidoCadastro.btnNovoItens.OnClick := NovoItens;
  frmPedidoCadastro.OnActivate := OnActivateForm;
  frmPedidoCadastro.OnActivate(nil);
  frmPedidoCadastro.cbMunicipio.OnEnter := ComboBoxMunicipio;
  frmPedidoCadastro.cbBairro.OnEnter := ComboBoxBairro;
  frmPedidoCadastro.cbProduto.OnSelect := ValidarCamposItensPedido;

  if (iId > 0) then
  begin
    oPedidoDTO.idPedido := iId;
    RetornarValorEdit(Sender);
    frmPedidoCadastro.cbCliente.SetFocus;
  end;
end;

destructor TPedidoCadastroController.Destroy;
begin
  if (Assigned(oPedidoDTO)) then
    FreeAndNil(oPedidoDTO);

  if (Assigned(oPedidoRegra)) then
    FreeAndNil(oPedidoRegra);

  if (Assigned(oPedidoModel)) then
    FreeAndNil(oPedidoModel);

//  if (Assigned(oItensPedidoDTO)) then
//    oItensPedidoDTO.Free;

  if assigned(oPedidoCadastroController) then
    FreeAndNil(oPedidoCadastroController);

  inherited;
end;

procedure TPedidoCadastroController.EditarItens(Sender: TObject);
var
  iId: Integer;
begin
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;
    frmPedidoCadastro.cbProduto.SetFocus;

    iId := frmPedidoCadastro.fdMemTable.FieldByName('idproduto').AsInteger;
    // Valor unitario
    frmPedidoCadastro.edtValorUnitario.Text :=
      CurrToStr(frmPedidoCadastro.fdMemTable.FieldByName('valor').AsCurrency);
    frmPedidoCadastro.cbProduto.ItemIndex :=
      frmPedidoCadastro.cbProduto.Items.IndexOfObject(TObject(iId));
    dEditarValorTotal := frmPedidoCadastro.fdMemTable.FieldByName('valorTotal')
      .AsCurrency;
    frmPedidoCadastro.edtValor.Text := FloatToStr(dEditarValorTotal);
    frmPedidoCadastro.edtQuantidade.Text :=
      FloatToStr(frmPedidoCadastro.fdMemTable.FieldByName('quantidade')
      .AsFloat);
    frmPedidoCadastro.mObservacaoItensPedido.Text :=
      frmPedidoCadastro.fdMemTable.FieldByName('observacao').AsString;

    frmPedidoCadastro.fdMemTable.Post;
    iIDProduto := iId;
  end;
  frmPedidoCadastro.btnNovoItens.Enabled := False;
  frmPedidoCadastro.btnSalvarItens.Enabled := True;
end;

procedure TPedidoCadastroController.ExcluirItens(Sender: TObject);
var
  iId: Integer;
begin
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
  begin
    if (MessageDlg('Deseja relmente excluir este registro', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
    begin
      iId := frmPedidoCadastro.fdMemTable.FieldByName('idproduto').AsInteger;
      frmPedidoCadastro.fdMemTable.Locate('idproduto', iId);
      frmPedidoCadastro.fdMemTable.Delete;
    end
  end;
end;

procedure TPedidoCadastroController.Novo(Sender: TObject);
begin
  oPedidoRegra.LimparDTO(oPedidoDTO);
  frmPedidoCadastro.btnSalvar.Enabled := True;
  frmPedidoCadastro.btnNovo.Enabled := False;
end;

procedure TPedidoCadastroController.NovoItens(Sender: TObject);
var
  I: Integer;
begin
  frmPedidoCadastro.btnNovoItens.Enabled := False;
  frmPedidoCadastro.btnSalvarItens.Enabled := True;

  frmPedidoCadastro.cbProduto.ItemIndex := -1;
  frmPedidoCadastro.mObservacaoItensPedido.Clear;
  frmPedidoCadastro.edtQuantidade.Clear;
  frmPedidoCadastro.edtValor.Clear;
  frmPedidoCadastro.edtValorUnitario.Clear;
  for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
  begin
    frmPedidoCadastro.clkSabores.Checked[I] := False;
  end;
  frmPedidoCadastro.cbProduto.SetFocus;
end;

procedure TPedidoCadastroController.OnActivateForm(Sender: TObject);
begin
  // comboBox do Produto
  ComboBoxProduto(Sender);
  // ComboBox do Estado
  Pesquisar(Sender);
  // comboBox Cliente
  ComboBoxCliente(Sender);
  // Mostrar da data e horas atualizadas
  frmPedidoCadastro.dtDataEntrega.Date := now;
  frmPedidoCadastro.dtDataPedido.Date := now;
  frmPedidoCadastro.dtHoraEntrega.Time := now;
  // montar o checkBoxlist
  CheckSabor(Sender);
end;

procedure TPedidoCadastroController.Pesquisar(Sender: TObject);
var
  oEstadoDTO: TEstadoDTO;
  oListaEstados: TEstadoListaHash;
  oEstadoListagem: TEstadoListagemModel;
  iId: Integer;
begin
  try

    if (frmPedidoCadastro.cbEstado.ItemIndex <> -1) then
    begin
      iId := Integer(frmPedidoCadastro.cbEstado.Items.Objects
        [frmPedidoCadastro.cbEstado.ItemIndex]);
    end
    else
      iId := -1;

    frmPedidoCadastro.cbEstado.Items.Clear;
    oEstadoListagem := TEstadoListagemModel.Create;
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);
    if oPedidoRegra.ComboBoxEstado(oListaEstados, oEstadoListagem) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        frmPedidoCadastro.cbEstado.Items.AddObject(oEstadoDTO.descricao,
          TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
    begin
      frmPedidoCadastro.cbEstado.ItemIndex :=
        frmPedidoCadastro.cbEstado.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);

    if (Assigned(oEstadoListagem)) then
      FreeAndNil(oEstadoListagem);
  end;
end;

procedure TPedidoCadastroController.RetornarValorEdit(Sender: TObject);
var
  iEstado, iMunicipio, iId: Integer;
  sNome: String;
  oItensDTO: TItensPedidoDTO;
begin
  iId := oPedidoDTO.idPedido;
  if (oPedidoRegra.BuscarUpdate(oPedidoDTO, iId, oPedidoModel)) then
  begin
    with frmPedidoCadastro do
    begin
      cbCliente.ItemIndex := cbCliente.Items.IndexOfObject(TObject(oPedidoDTO.idCliente));
      edtResponsavelPedido.Text := oPedidoDTO.responsavelPedido;
      edtEnderecoEntrega.Text := oPedidoDTO.entregaEndereco;
      edtNumeroEntrega.Text := oPedidoDTO.entregaNumero;
      edtComplemento.Text := oPedidoDTO.entregaComplemento;
      dtDataEntrega.DateTime := oPedidoDTO.dataEntrega;
      dtDataPedido.DateTime := oPedidoDTO.dataPedido;
      dtHoraEntrega.DateTime := oPedidoDTO.horaEntrega;
    end;
  end;

  if (oPedidoRegra.BuscarEstadoMunicipio(oPedidoDTO.idBairro,
    iEstado, iMunicipio, oPedidoModel )) then
  begin
    frmPedidoCadastro.cbEstado.ItemIndex :=
    frmPedidoCadastro.cbEstado.Items.IndexOfObject(TObject(iEstado));
    ComboBoxMunicipio(Sender);
    frmPedidoCadastro.cbMunicipio.ItemIndex :=
      frmPedidoCadastro.cbMunicipio.Items.IndexOfObject(TObject(iMunicipio));
    ComboBoxBairro(Sender);
    frmPedidoCadastro.cbBairro.ItemIndex :=
      frmPedidoCadastro.cbBairro.Items.IndexOfObject(TObject(oPedidoDTO.idBairro));
  end;

  if (oPedidoRegra.BuscarItensPedido(oPedidoDTO.idPedido, oPedidoDTO,
    oPedidoModel)) then
  begin
    with frmPedidoCadastro do
    begin
      for oItensDTO in oPedidoDTO.ItensPedido.Values do
      begin
        fdMemTableidproduto.AsInteger := oItensDTO.idProduto;
        fdMemTablequantidade.AsFloat := oItensDTO.quantidade;
        fdMemTableobservacao.AsString := oItensDTO.observacao;
        oPedidoRegra.buscarNomeProduto(oItensDTO.idProduto, sNome, oPedidoModel);
        fdMemTableproduto.AsString := sNome;
        fdMemTablevalorTotal.AsFloat := oItensDTO.valorTotal;
      end;
    end;
  end;
end;

procedure TPedidoCadastroController.Salvar(Sender: TObject);
var
  iIdEstadoValidar, iValidar, iSalvar: Integer;
begin
  iIdEstadoValidar := 0;
  // Responsavel pedido
  oPedidoDTO.responsavelPedido := frmPedidoCadastro.edtResponsavelPedido.Text;
  // validação se ele informou certo o o bairro
  if (frmPedidoCadastro.cbEstado.ItemIndex <> -1) then
    iIdEstadoValidar := Integer(frmPedidoCadastro.cbEstado.Items.Objects
      [frmPedidoCadastro.cbEstado.ItemIndex]);
  if (iIdEstado <> iIdEstadoValidar) then
  begin
    frmPedidoCadastro.cbMunicipio.Items.Clear;
    frmPedidoCadastro.cbMunicipio.Clear;
    frmPedidoCadastro.cbBairro.Items.Clear;
    frmPedidoCadastro.cbBairro.Clear;
  end;

  if (frmPedidoCadastro.cbBairro.ItemIndex <> -1) then
  begin
    oPedidoDTO.idBairro := Integer(frmPedidoCadastro.cbBairro.Items.Objects
      [frmPedidoCadastro.cbBairro.ItemIndex]);
  end
  else
    oPedidoDTO.idBairro := -1;
  // data do pedido
  if (frmPedidoCadastro.dtDataPedido.Date > 0) then
    oPedidoDTO.dataPedido := frmPedidoCadastro.dtDataPedido.Date;
  // data de entrega
  if (frmPedidoCadastro.dtDataEntrega.Date > 0) then
    oPedidoDTO.dataEntrega := frmPedidoCadastro.dtDataEntrega.Date
  else
  begin
    MessageDlg('Informe data de entrega corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  // hora da entrega
  if (frmPedidoCadastro.dtHoraEntrega.Time > 0) then
    oPedidoDTO.horaEntrega := frmPedidoCadastro.dtHoraEntrega.Time
  else
  begin
    MessageDlg('Informe data de entrega corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  // observações do pedido
  oPedidoDTO.observacao := frmPedidoCadastro.mObservacao.Text;
  // id usuario
  oPedidoDTO.idUsuario := 1;
  // Endereço de entrega
  oPedidoDTO.entregaEndereco := frmPedidoCadastro.edtEnderecoEntrega.Text;
  // número da casa
  oPedidoDTO.entregaNumero := frmPedidoCadastro.edtNumeroEntrega.Text;
  // complemento da entrega
  oPedidoDTO.entregaComplemento := frmPedidoCadastro.edtComplemento.Text;
  // nome do cliente
  if (frmPedidoCadastro.cbCliente.ItemIndex <> -1) then
  begin
    oPedidoDTO.IdCliente := Integer(frmPedidoCadastro.cbCliente.Items.Objects
      [frmPedidoCadastro.cbCliente.ItemIndex]);
  end
  else
    oPedidoDTO.IdCliente := -1;

  // validar os campos antes de salvar
  iValidar := oPedidoRegra.ValidarSalvar(oPedidoDTO);
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo Nome corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo Responsavel pelo Pedido corretamente!',
      mtWarning, [mbOK], 0);
    exit;
  end;
  if (iValidar = 3) then
  begin
    MessageDlg('Preencha o campo Bairro corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  if (iValidar = 4) then
  begin
    MessageDlg('Preencha o campo Rua corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  if (iValidar = 5) then
  begin
    MessageDlg('Preencha o campo Número de entrega corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  oPedidoDTO.ItensPedido.Clear;
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
  begin
    with frmPedidoCadastro.fdMemTable do
    begin
      First;
      while (not(Eof)) do
      begin
        oItensPedidoDTO.idProduto := FieldByName('idproduto').AsInteger;
        oItensPedidoDTO.quantidade := FieldByName('quantidade').AsFloat;
        oItensPedidoDTO.observacao := FieldByName('observacao').AsString;
        oItensPedidoDTO.valorTotal := FieldByName('valorTotal').AsFloat;
        oPedidoDTO.ItensPedido.Add(oItensPedidoDTO.valorTotal, oItensPedidoDTO);
       Next;
      end;
    end;
  end;

  iSalvar := oPedidoRegra.SalvarPedido(oPedidoDTO, oPedidoModel);

  if (iSalvar = 1) then
  begin
    MessageDlg('Erro ao Inserir o Itens Pedido!', mtWarning,
      [mbOK], 0);
    exit;
  end;
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao Fazer Update do Itens Pedido!', mtWarning,
      [mbOK], 0);
    exit;
  end;
   if (iSalvar = 3) then
  begin
    MessageDlg('Erro ao Inserir o Pedido!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  if (iSalvar = 0) then
  begin
    frmPedidoCadastro.btnSalvar.Enabled := False;
    frmPedidoCadastro.btnNovo.Enabled := True;;
  end;
end;

procedure TPedidoCadastroController.SalvarItens(Sender: TObject);
var
  I, iCont: Integer;
  vSabores: TSaboresItens;
begin
  // adiciona valor no memTable e irá mostrar na grid
  if (iIDProduto > 0) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;
    oPedidoDTO.totalPedido := oPedidoDTO.totalPedido - dEditarValorTotal;
    frmPedidoCadastro.edtTotalPedido.Text := FloatToStr(oPedidoDTO.totalPedido);
  end
  else
  begin
    frmPedidoCadastro.fdMemTable.insert;
  end;
  iIDProduto := 0;

  // Validação se o usuário preencheu o campo produto
  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    oItensPedidoDTO.idProduto :=
      Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
  end
  else
  begin
    MessageDlg('Preencha o campo PRODUTO!', mtWarning, [mbOK], 0);
    frmPedidoCadastro.cbProduto.SetFocus;
    exit;
  end;

  frmPedidoCadastro.fdMemTableidproduto.AsInteger := oItensPedidoDTO.idProduto;
  // Valor unitario
  frmPedidoCadastro.fdMemTablevalor.AsCurrency :=
    StrToCurrDef(frmPedidoCadastro.edtValorUnitario.Text, 0);

  // nome do produto para mostrar no Memtable
  frmPedidoCadastro.fdMemTableproduto.AsString :=
    frmPedidoCadastro.cbProduto.Items.Strings
    [frmPedidoCadastro.cbProduto.ItemIndex];
  // calculo de valor do produto
  oItensPedidoDTO.quantidade :=
    StrToFloatDef(frmPedidoCadastro.edtQuantidade.Text, 0);
  oItensPedidoDTO.valorTotal := oItensPedidoDTO.quantidade *
    StrToFloatDef(frmPedidoCadastro.edtValorUnitario.Text, 0);
  frmPedidoCadastro.edtValor.Text := FloatToStr(oItensPedidoDTO.valorTotal);
  frmPedidoCadastro.fdMemTablequantidade.AsFloat := oItensPedidoDTO.quantidade;
  frmPedidoCadastro.fdMemTablevalorTotal.AsCurrency :=
    oItensPedidoDTO.valorTotal;

  // faz a soma dos valos para ser inserido no ValorTotal do pedido
  oPedidoDTO.totalPedido := oPedidoDTO.totalPedido + oItensPedidoDTO.valorTotal;
  frmPedidoCadastro.edtTotalPedido.Text := FloatToStrF((oPedidoDTO.totalPedido),
    ffCurrency, 15, 2);

  // observação do itens pedido
  oItensPedidoDTO.observacao := frmPedidoCadastro.mObservacaoItensPedido.Text;
  frmPedidoCadastro.fdMemTableobservacao.AsString := oItensPedidoDTO.observacao;

  // inserção dos sabores num array
   if (frmPedidoCadastro.GroupSabores.Enabled = True) then
   begin
     SetLength(vSabores, 0);
     for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
     begin
       if (frmPedidoCadastro.clkSabores.Checked[I]) then
       begin
         iCont := Length(vSabores);
         SetLength(vSabores, iCont + 1);
         vSabores[iCont] := Integer(frmPedidoCadastro.clkSabores.Items.Objects[I]);
       end;
     end;
     oItensPedidoDTO.sabores := vSabores;
   end;


  // oPedidoDTO.ItensPedido.Add(oItensPedidoDTO.idProduto, oItensPedidoDTO);

  // salva no MemTable
  frmPedidoCadastro.fdMemTable.Post;
  frmPedidoCadastro.btnNovoItens.Enabled := True;
  frmPedidoCadastro.btnSalvarItens.Enabled := False;
end;

procedure TPedidoCadastroController.ValidarCamposItensPedido(Sender: TObject);
var
  iId, I: Integer;
  bValor: Double;
begin
  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    iId := Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
    if (not(oPedidoRegra.ValidarCamposItensPedido(iId, bValor, oPedidoModel)))
    then
    begin
      frmPedidoCadastro.GroupSabores.Enabled := True;
    end
    else
    begin
      frmPedidoCadastro.GroupSabores.Enabled := False;
      for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
      begin
        frmPedidoCadastro.clkSabores.Checked[I] := False;
      end;
    end;

    frmPedidoCadastro.edtValorUnitario.Text := FloatToStr(bValor);
  end;
end;

end.
