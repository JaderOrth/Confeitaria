unit uPedidoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, data.db, System.Rtti, FireDAC.Comp.Client,
  uInterfaceCadastroController, uPedidoCadastro, uPedidoCadastroRegra,
  uPedidoCadastroModel, uPedidoDTO, uProdutoListaHash, uProdutoListagemModel,
  uProdutoDTO, uEstadoDTO, uEstadoListaHash, uEstadoListagemModel,
  uMunicipioDTO,uMunicipioListagemModel, uMunicipioListaHash, uBairroDTO,
  uBairroListagemModel, uBairroListaHash, uClienteListaHash,
  uClienteListagemModel, uClienteDTO, uSaborListaHash, uSaborDTO,
  uSaborListagemModel;

type
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
    iIdEstado, iIDProduto: Integer;
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
      for I := 0 to frmPedidoCadastro.clkSabores.Items.Count -1 do
      begin
        iCount := Length(aSabor);
        for J := 0 to iCount do
        begin
          iValor := Integer(frmPedidoCadastro.clkSabores.Items.Objects[I]);
          iValorArray := aSabor[iCount];
          if (iValorArray = iValor) then
          begin
            frmPedidoCadastro.clkSabores.Checked[I] := true;
          end;
          iCount := iCount -1;
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
        frmPedidoCadastro.cbBairro.Items.AddObject(oBairroDTO.Descricao,
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
        frmPedidoCadastro.cbMunicipio.Items.AddObject(oMunicipioDTO.Descricao,
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
        frmPedidoCadastro.cbProduto.Items.AddObject(oProdutoDTO.Descricao,
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
  inherited;
end;

procedure TPedidoCadastroController.EditarItens(Sender: TObject);
var
  iID: Integer;
begin
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;

    iID := frmPedidoCadastro.fdMemTable.FieldByName('idproduto').AsInteger;
    frmPedidoCadastro.cbProduto.ItemIndex :=
      frmPedidoCadastro.cbProduto.Items.IndexOfObject(TObject(iID));
    frmPedidoCadastro.edtValor.Text :=
     CurrToStr(frmPedidoCadastro.fdMemTable.FieldByName('valorTotal').AsCurrency);
    frmPedidoCadastro.edtQuantidade.Text :=
      FloatToStr(frmPedidoCadastro.fdMemTable.FieldByName('quantidade').AsFloat);
    frmPedidoCadastro.mObservacaoItensPedido.Text :=
      frmPedidoCadastro.fdMemTable.FieldByName('observacao').AsString;

    frmPedidoCadastro.fdMemTable.Post;
    iIDProduto := iID;
  end;
end;

procedure TPedidoCadastroController.ExcluirItens(Sender: TObject);
var
  iId: Integer;
begin
  if (not(frmPedidoCadastro.fdMemTable.IsEmpty)) then
    begin
    if (messageDlg('Deseja relmente excluir este registro', mtConfirmation,
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
  //comboBox Cliente
  ComboBoxCliente(Sender);
  //Mostrar da data e horas atualizadas
  frmPedidoCadastro.dtDataEntrega.Date := now;
  //montar o checkBoxlist
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
        frmPedidoCadastro.cbEstado.Items.AddObject(oEstadoDTO.Descricao,
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
  iIdEstadoValidar: Integer;
begin
  oPedidoDTO.responsavelPedido := frmPedidoCadastro.edtResponsavelPedido.Text;
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
    oPedidoDTO.idBairro :=  -1;
  if (frmPedidoCadastro.dtDataPedido.Date > 0) then
     oPedidoDTO.dataPedido := frmPedidoCadastro.dtDataPedido.Date
  else
  begin

  end;
  if (frmPedidoCadastro.dtDataEntrega.Date > 0) then
    oPedidoDTO.dataHoraEntrega := frmPedidoCadastro.dtDataEntrega.Date;
  oPedidoDTO.observacao := frmPedidoCadastro.mObservacao.Text;
  oPedidoDTO.totalPedido := StrToCurrDef(frmPedidoCadastro.edtTotalPedido.Text, 0);
  oPedidoDTO.idUsuario := 1;
  oPedidoDTO.entregaEndereco := frmPedidoCadastro.edtEnderecoEntrega.Text;
  oPedidoDTO.entregaNumero := frmPedidoCadastro.edtNumeroEntrega.Text;
  oPedidoDTO.entregaComplemento := frmPedidoCadastro.edtComplemento.Text;
  if (frmPedidoCadastro.cbCliente.ItemIndex <> -1) then
  begin
    oPedidoDTO.idCliente := Integer(frmPedidoCadastro.cbCliente.Items.Objects
      [frmPedidoCadastro.cbCliente.ItemIndex]);
  end
  else
    oPedidoDTO.idUsuario := -1;


end;

procedure TPedidoCadastroController.SalvarItens(Sender: TObject);
begin
  // adiciona valor no memTable e irá mostrar na grid
  if (iIDProduto > 0) then
  begin
    frmPedidoCadastro.fdMemTable.Edit;
  end
  else
  begin
    frmPedidoCadastro.fdMemTable.insert;
  end;

  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    frmPedidoCadastro.fdMemTableidproduto.AsInteger :=
      Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
  end
  else
  begin
    MessageDlg('Preencha o campo PRODUTO!', mtWarning, [mbOK], 0);
    frmPedidoCadastro.cbProduto.SetFocus;
    exit;
  end;
  frmPedidoCadastro.fdMemTableproduto.AsString :=
    frmPedidoCadastro.cbProduto.Items.Strings
    [frmPedidoCadastro.cbProduto.ItemIndex];

  if (Length(Trim(frmPedidoCadastro.edtQuantidade.Text)) > 0) then
  begin
  frmPedidoCadastro.fdMemTablequantidade.AsFloat :=
    StrToFloatDef(frmPedidoCadastro.edtQuantidade.Text, 0);
  end
  else
  begin
    MessageDlg('Preencha o campo QUANTIDADE!', mtWarning, [mbOK], 0);
    frmPedidoCadastro.edtQuantidade.SetFocus;
    exit;
  end;
  frmPedidoCadastro.fdMemTablevalorTotal.AsCurrency :=
    StrToCurrDef(frmPedidoCadastro.edtValor.Text, 0);
  frmPedidoCadastro.fdMemTableobservacao.AsString :=
    frmPedidoCadastro.mObservacaoItensPedido.Text;

  //  if (frmPedidoCadastro.GroupSabores.Enabled = True) then
//  begin
//    SetLength(aCheck, 0);
//    for I := 0 to frmProdutoCadastro.clkSabores.Items.Count - 1 do
//    begin
//      if (frmProdutoCadastro.clkSabores.Checked[I]) then
//      begin
//        iCont := Length(aCheck);
//        SetLength(aCheck, iCont + 1);
//        aCheck[iCont] :=
//          Integer(frmProdutoCadastro.clkSabores.Items.Objects[I]);
//      end;
//    end;
//  end
//  else
//  begin
//    for I := 0 to frmProdutoCadastro.clkSabores.Items.Count - 1 do
//    begin
//      frmProdutoCadastro.clkSabores.Checked[I] := False;
//    end;
//    if (oProdutoDTO.idProduto > 0) then
//    begin
//      oProdutoRegra.ExcluirSabores(oProdutoDTO.idProduto, oProdutoModel);
//    end;
//  end;
  frmPedidoCadastro.fdMemTable.Post;
  // frmPedidoCadastro.fdMemTable.open;
end;

procedure TPedidoCadastroController.ValidarCamposItensPedido(Sender: TObject);
var
  iId: Integer;
begin
  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    iId := Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
    if (not(oPedidoRegra.ValidarCamposItensPedido(iId, oPedidoModel))) then
    begin
      frmPedidoCadastro.GroupSabores.Enabled := True;
    end;
  end;
end;

end.
