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
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
    oItensPedidoDTO: TItensPedidoDTO;
    iIdEstado, iIDProduto: Integer;
    dEditarValorTotal: Double;
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

    constructor Create;
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

constructor TPedidoCadastroController.Create;
begin
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

  if (Assigned(oItensPedidoDTO)) then
    FreeAndNil(oItensPedidoDTO);
  inherited;
end;

procedure TPedidoCadastroController.EditarItens(Sender: TObject);
var
  iId: Integer;
begin
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;

    iId := frmPedidoCadastro.fdMemTable.FieldByName('idproduto').AsInteger;
    frmPedidoCadastro.cbProduto.ItemIndex :=
      frmPedidoCadastro.cbProduto.Items.IndexOfObject(TObject(iId));
    frmPedidoCadastro.edtValor.Text :=
      CurrToStr(frmPedidoCadastro.fdMemTable.FieldByName('valorTotal')
      .AsCurrency);
    dEditarValorTotal := frmPedidoCadastro.fdMemTable.FieldByName
      ('quantidade').AsFloat;
    frmPedidoCadastro.edtQuantidade.Text := FloatToStr(dEditarValorTotal);
    frmPedidoCadastro.mObservacaoItensPedido.Text :=
      frmPedidoCadastro.fdMemTable.FieldByName('observacao').AsString;

    frmPedidoCadastro.fdMemTable.Post;
    iIDProduto := iId;
  end;
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

end;

procedure TPedidoCadastroController.NovoItens(Sender: TObject);
var
  I: Integer;
begin
  frmPedidoCadastro.cbProduto.ItemIndex := -1;
  frmPedidoCadastro.mObservacaoItensPedido.Clear;
  frmPedidoCadastro.edtQuantidade.Clear;
  frmPedidoCadastro.edtValor.Clear;
  for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
  begin
    frmPedidoCadastro.clkSabores.Checked[I] := False;
  end;
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
      if (frmPedidoCadastro.PageControlPedido.ActivePageIndex = 0) then
        frmPedidoCadastro.cbEstado.SetFocus;
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
begin

end;

procedure TPedidoCadastroController.Salvar(Sender: TObject);
var
  iIdEstadoValidar, iValidar, iSalvar: Integer;
begin
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
  // Valor total do pedido
  oPedidoDTO.totalPedido :=
    StrToCurrDef(frmPedidoCadastro.edtTotalPedido.Text, 0);
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
  if (iValidar = 6) then
  begin
    MessageDlg('Erro ao Valor do Pedido!', mtError, [mbOK], 0);
    exit;
  end;
  iSalvar := oPedidoRegra.SalvarPedido(oPedidoDTO, oPedidoModel);

end;

procedure TPedidoCadastroController.SalvarItens(Sender: TObject);
var
  dValorUnitario, dValorTotal, dEditarValor: Double;
  I, iCont: Integer;
  aCheck: array of Integer;
begin
  // adiciona valor no memTable e irá mostrar na grid
  if (iIDProduto > 0) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;
    dEditarValor := StrToFloatDef(frmPedidoCadastro.edtTotalPedido.Text, 0);
    dEditarValor := dEditarValor - dEditarValorTotal;
    frmPedidoCadastro.edtTotalPedido.Text := FloatToStr(dEditarValor);
  end
  else
  begin
    frmPedidoCadastro.fdMemTable.insert;
  end;

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

  // nome do produto para mostrar no Memtable
  frmPedidoCadastro.fdMemTableproduto.AsString :=
    frmPedidoCadastro.cbProduto.Items.Strings
    [frmPedidoCadastro.cbProduto.ItemIndex];
  // calculo de valor do produto
  dValorUnitario := StrToFloatDef(frmPedidoCadastro.edtValorUnitario.Text, 0);
  oItensPedidoDTO.quantidade :=
    StrToFloatDef(frmPedidoCadastro.edtQuantidade.Text, 0);
  oItensPedidoDTO.valorTotal := dValorUnitario * oItensPedidoDTO.quantidade;
  frmPedidoCadastro.edtValor.Text := FloatToStr(oItensPedidoDTO.valorTotal);
  frmPedidoCadastro.fdMemTablequantidade.AsFloat := oItensPedidoDTO.quantidade;
  frmPedidoCadastro.fdMemTablevalorTotal.AsCurrency :=
    StrToCurr(frmPedidoCadastro.edtValor.Text);
  // faz a soma dos valos para ser inserido no ValorTotal do pedido
  dValorTotal := StrToFloatDef(frmPedidoCadastro.edtTotalPedido.Text, 0);
  frmPedidoCadastro.edtTotalPedido.Text :=
    FloatToStr(oItensPedidoDTO.valorTotal + dValorTotal);
  // observação do itens pedido
  oItensPedidoDTO.observacao := frmPedidoCadastro.mObservacaoItensPedido.Text;
  frmPedidoCadastro.fdMemTableobservacao.AsString := oItensPedidoDTO.observacao;

  // inserção dos sabores num array
  if (frmPedidoCadastro.GroupSabores.Enabled = True) then
  begin
    SetLength(aCheck, 0);
    for I := 0 to frmPedidoCadastro.clkSabores.Items.Count - 1 do
    begin
      if (frmPedidoCadastro.clkSabores.Checked[I]) then
      begin
        iCont := Length(aCheck);
        SetLength(aCheck, iCont + 1);
        aCheck[iCont] := Integer(frmPedidoCadastro.clkSabores.Items.Objects[I]);
      end;
    end;
  end;
  // else
  // begin
  // for I := 0 to frmProdutoCadastro.clkSabores.Items.Count - 1 do
  // begin
  // frmProdutoCadastro.clkSabores.Checked[I] := False;
  // end;
  // if (oProdutoDTO.idProduto > 0) then
  // begin
  // oProdutoRegra.ExcluirSabores(oProdutoDTO.idProduto, oProdutoModel);
  // end;
  // end;

  // salva no MemTable
  frmPedidoCadastro.fdMemTable.Post;

end;

procedure TPedidoCadastroController.ValidarCamposItensPedido(Sender: TObject);
var
  iId: Integer;
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
      frmPedidoCadastro.GroupSabores.Enabled := False;

    frmPedidoCadastro.edtValorUnitario.Text := FloatToStr(bValor);
  end;
end;

end.
