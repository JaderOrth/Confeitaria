unit uProdutoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Controls, System.StrUtils,
  uInterfaceCadastroController, uProdutoCadastro, uProdutoCadastroRegra,
  uProdutoCadastroModel, uProdutoDTO,
  uUnidadeMedidaListaHash, uUnidadeMedidaDTO, uUnidadeMedidaListagemModel,
  uCategoriaListaHash, uCategoriasDTO, uCategoriasListagemModel,
  uSaborListaHash, uSaborDTO, uSaborListagemModel;

type
  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oProdutoDTO: TProdutoDTO;
    oProdutoModel: TProdutoCadastroModel;
    oProdutoRegra: TProdutoCadastroRegra;
    procedure ComboBoxCategoria(Sender: TObject);
    procedure CheckSabor(Sender: TObject);
    procedure ComboBoxUnidadeMedida(Sender: TObject);
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oProdutoCadastroController: IInterfaceCadastroController;

implementation

{ TBairroCadastroController }

procedure TBairroCadastroController.CheckSabor(Sender: TObject);
var
  oSaborLista: TSaborListaHash;
  oSaborModel: TSaborListagemModel;
  oSaborDTO: TSaborDTO;
begin
  frmProdutoCadastro.clkSabores.Clear;
  try
    oSaborLista := TSaborListaHash.Create([doOwnsValues]);
    oSaborModel := TSaborListagemModel.Create;

    if (oProdutoRegra.CheckSabor(oSaborLista, oSaborModel)) then
    begin
      for oSaborDTO in oSaborLista.Values do
      begin
        frmProdutoCadastro.clkSabores.Items.AddObject(oSaborDTO.descricao,
          TObject(oSaborDTO.idsabores));
      end
    end

  finally
    if (Assigned(oSaborModel)) then
      FreeAndNil(oSaborModel);

    if (Assigned(oSaborLista)) then
      FreeAndNil(oSaborLista);
  end;
end;

procedure TBairroCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmProdutoCadastro))) then
    Exit;
  frmProdutoCadastro.Close;
  FreeAndNil(frmProdutoCadastro);
end;

procedure TBairroCadastroController.ComboBoxCategoria(Sender: TObject);
var
  oCategoriaLista: TCategoriaListaHash;
  oCategoriaModel: TCategoriasListagemModel;
  oCategoriaDTO: TCategoriasDTO;
  iCategoria: Integer;
begin
  if (frmProdutoCadastro.cbCategoria.ItemIndex <> -1) then
  begin
    iCategoria := Integer(frmProdutoCadastro.cbCategoria.Items.Objects
      [frmProdutoCadastro.cbCategoria.ItemIndex]);
  end
  else
    iCategoria := -1;

  frmProdutoCadastro.cbCategoria.Items.Clear;
  frmProdutoCadastro.cbCategoria.Clear;
  try
    oCategoriaLista := TCategoriaListaHash.Create([doOwnsValues]);
    oCategoriaModel := TCategoriasListagemModel.Create;

    if (oProdutoRegra.ComboBoxCategoria(oCategoriaLista, oCategoriaModel)) then
    begin
      for oCategoriaDTO in oCategoriaLista.Values do
      begin
        frmProdutoCadastro.cbCategoria.Items.AddObject(oCategoriaDTO.descricao,
          TObject(oCategoriaDTO.idcategoria));
      end;
    end;

    if (iCategoria <> -1) then
    begin
      frmProdutoCadastro.cbCategoria.ItemIndex :=
        frmProdutoCadastro.cbCategoria.Items.IndexOfObject(TObject(iCategoria));
    end;

  finally
    if (Assigned(oCategoriaModel)) then
      FreeAndNil(oCategoriaModel);

    if (Assigned(oCategoriaLista)) then
      FreeAndNil(oCategoriaLista);
  end;
end;

procedure TBairroCadastroController.ComboBoxUnidadeMedida(Sender: TObject);
var
  oUnidadeMedidaLista: TUnidadeMedidaListaHash;
  oUnidadeMedidaModel: TUnidadeMedidaListagemModel;
  oUnidadeMedidaDTO: TUnidadeMedidaDTO;
  iUnidadeMedida: Integer;
begin
  if (frmProdutoCadastro.cbUnidadeMedida.ItemIndex <> -1) then
  begin
    iUnidadeMedida := Integer(frmProdutoCadastro.cbUnidadeMedida.Items.Objects
      [frmProdutoCadastro.cbUnidadeMedida.ItemIndex]);
  end
  else
    iUnidadeMedida := -1;

  frmProdutoCadastro.cbUnidadeMedida.Items.Clear;
  frmProdutoCadastro.cbUnidadeMedida.Clear;
  try
    oUnidadeMedidaLista := TUnidadeMedidaListaHash.Create([doOwnsValues]);
    oUnidadeMedidaModel := TUnidadeMedidaListagemModel.Create;

    if (oProdutoRegra.ComboBoxUnidadeMedida(oUnidadeMedidaLista,
      oUnidadeMedidaModel)) then
    begin
      for oUnidadeMedidaDTO in oUnidadeMedidaLista.Values do
      begin
        frmProdutoCadastro.cbUnidadeMedida.Items.AddObject
          (oUnidadeMedidaDTO.descricao,
          TObject(oUnidadeMedidaDTO.idunidade_medida));
      end;
    end;

    if (iUnidadeMedida <> -1) then
    begin
      frmProdutoCadastro.cbUnidadeMedida.ItemIndex :=
        frmProdutoCadastro.cbUnidadeMedida.Items.IndexOfObject
        (TObject(iUnidadeMedida));
    end;

  finally
    if (Assigned(oUnidadeMedidaModel)) then
      FreeAndNil(oUnidadeMedidaModel);

    if (Assigned(oUnidadeMedidaLista)) then
      FreeAndNil(oUnidadeMedidaLista);
  end;
end;

constructor TBairroCadastroController.Create;
begin
  oProdutoDTO := TProdutoDTO.Create;
  oProdutoModel := TProdutoCadastroModel.Create;
  oProdutoRegra := TProdutoCadastroRegra.Create;
end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmProdutoCadastro))) then
    frmProdutoCadastro := TfrmProdutoCadastro.Create(AOwner);
  frmProdutoCadastro.oInterfaceCadastroController := oProdutoCadastroController;
  frmProdutoCadastro.Show;
  frmProdutoCadastro.OnActivate(nil);

  if (iId > 0) then
  begin
    oProdutoDTO.idProduto := iId;
    if (oProdutoRegra.BuscarUpdate(oProdutoDTO, oProdutoModel)) then
    begin
      frmProdutoCadastro.edtProduto.Text := oProdutoDTO.descricao;
      frmProdutoCadastro.edtPreco.Text := CurrToStr(oProdutoDTO.preco);

      if (oProdutoRegra.ValidarSabor(oProdutoDTO.sabor)) then
        frmProdutoCadastro.ckbSabor.State := cbChecked
      else
        frmProdutoCadastro.ckbSabor.State := cbUnchecked;

      frmProdutoCadastro.cbCategoria.ItemIndex :=
        frmProdutoCadastro.cbCategoria.Items.IndexOfObject
        (TObject(oProdutoDTO.idcategoria));
      frmProdutoCadastro.cbUnidadeMedida.ItemIndex :=
        frmProdutoCadastro.cbUnidadeMedida.Items.IndexOfObject
        (TObject(oProdutoDTO.unidadeMedida));
    end
    else
    begin
      MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
      Exit;
    end;
  end;
end;

destructor TBairroCadastroController.Destroy;
begin
  if (Assigned(oProdutoDTO)) then
    FreeAndNil(oProdutoDTO);

  if (Assigned(oProdutoModel)) then
    FreeAndNil(oProdutoModel);

  if (Assigned(oProdutoRegra)) then
    FreeAndNil(oProdutoRegra);
  inherited;
end;

procedure TBairroCadastroController.Novo(Sender: TObject);
begin
  oProdutoRegra.LimparDTO(oProdutoDTO);
end;

procedure TBairroCadastroController.Pesquisar(Sender: TObject);
begin
  // monta o ComboBox Categoria no  onActivate
  ComboBoxCategoria(Sender);
  // monta o ComboBox do UnidadeMedida
  ComboBoxUnidadeMedida(Sender);
  // Monta o Check dos Sabores
  CheckSabor(Sender);
end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar, I, iChecked, iCont: Integer;
  aCheck: array of Integer;
begin
  oProdutoDTO.descricao := frmProdutoCadastro.edtProduto.Text;
  oProdutoDTO.preco := StrToCurrDef(frmProdutoCadastro.edtPreco.Text, 0);
  oProdutoDTO.sabor := ifthen(frmProdutoCadastro.ckbSabor.Checked, 'S', 'N');
  if (frmProdutoCadastro.cbCategoria.ItemIndex <> -1) then
  begin
    oProdutoDTO.idcategoria :=
      Integer(frmProdutoCadastro.cbCategoria.Items.Objects
      [frmProdutoCadastro.cbCategoria.ItemIndex]);
  end
  else
    oProdutoDTO.idcategoria := -1;

  if (frmProdutoCadastro.cbUnidadeMedida.ItemIndex <> -1) then
  begin
    oProdutoDTO.unidadeMedida :=
      Integer(frmProdutoCadastro.cbUnidadeMedida.Items.Objects
      [frmProdutoCadastro.cbUnidadeMedida.ItemIndex]);
  end
  else
    oProdutoDTO.unidadeMedida := -1;

  iValidar := oProdutoRegra.Validar(oProdutoDTO);

  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo PRODUTO corretamente!', mtWarning, [mbOK], 0);
    Exit;
  end;

  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo CATEGORIA corretamente!', mtWarning,
      [mbOK], 0);
    Exit;
  end;

  if (iValidar = 3) then
  begin
    MessageDlg('Preencha o campo UNIDADE MEDIDA corretamente!', mtWarning,
      [mbOK], 0);
    Exit;
  end;

  if (iValidar = 4) then
  begin
    MessageDlg('Preencha o campo PRE�O corretamente!', mtWarning, [mbOK], 0);
    Exit;
  end;

  SetLength(aCheck, 0);
  for I := 0 to frmProdutoCadastro.clkSabores.Items.Count - 1 do
  begin
    if (frmProdutoCadastro.clkSabores.Checked[I]) then
    begin
      iCont := Length(aCheck);
      SetLength(aCheck, iCont + 1);
      aCheck[iCont] := Integer(frmProdutoCadastro.clkSabores.Items.Objects[I]);
    end;
  end;

  iSalvar := oProdutoRegra.Salvar(oProdutoDTO, aCheck, oProdutoModel);
  // Update False
  if (iSalvar = 1) then
  begin
    MessageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    Exit;
  end;
  // Insert False
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao salvar o registro!', mtError, [mbOK], 0);
    Exit;
  end;
  // Insert do Sabor
  if (iSalvar = 3) then
  begin
    MessageDlg('Erro ao salvar os sabores do Produto!', mtError, [mbOK], 0);
    Exit;
  end;




end;

end.
