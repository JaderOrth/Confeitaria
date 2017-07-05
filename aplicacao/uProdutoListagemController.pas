unit uProdutoListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uInterfaceListagemController, uProduto, uProdutoListagemRegra,
  uProdutoListagemModel, uProdutoDTO, uProdutoCadastroController;

type
  TProdutoListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oProdutoDTO: TProdutoDTO;
    oProdutoRegra: TProdutoListagemRegra;
    oProdutoModel: TProdutoListagemModel;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
    procedure Excluir(oMemTable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oProdutoListagemController: IInterfaceListagemController;

implementation

{ TProdutoListagemController }

procedure TProdutoListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + APesquisa + '%''' +
    ' or preco like ''%' + APesquisa + '%''' + ' or tipo  like ''%' +
    APesquisa + '%''';
  aMemTable.Filtered := true;
end;

procedure TProdutoListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmProduto))) then
    exit;
  oProdutoCadastroController.CloseFormCadastro(Sender);
  frmProduto.Close;
  FreeAndNil(frmProduto);
end;

procedure TProdutoListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oProdutoCadastrocontroller))) then
    oProdutoCadastrocontroller := TBairroCadastroController.Create;
  oProdutoCadastrocontroller.CreateFormCadastro(frmProduto, Sender, 0);
end;

constructor TProdutoListagemController.Create;
begin
  oProdutoDTO := TProdutoDTO.Create;
  oProdutoRegra := TProdutoListagemRegra.Create;
  oProdutoModel := TProdutoListagemModel.Create;
end;

procedure TProdutoListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oProdutoCadastrocontroller))) then
    oProdutoCadastrocontroller := TBairroCadastroController.Create;
  iID := oMemTable.FieldByName('idprodutos').AsInteger;
  oProdutoCadastrocontroller.CreateFormCadastro(frmProduto, Sender, iID);

end;

procedure TProdutoListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmProduto))) then
    frmProduto := TfrmProduto.Create(AOwner);
  frmProduto.oListagemBase := oProdutoListagemController;
  frmProduto.OnActivate(nil);
  frmProduto.Show;
end;

destructor TProdutoListagemController.Destroy;
begin
  if (Assigned(oProdutoDTO)) then
    FreeAndNil(oProdutoDTO);

  if (Assigned(oProdutoRegra)) then
    FreeAndNil(oProdutoRegra);

  if (Assigned(oProdutoModel)) then
    FreeAndNil(oProdutoModel);
  inherited;
end;

procedure TProdutoListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idprodutos').AsInteger;
    iValidar := oProdutoRegra.Excluir(iID, oProdutoModel);
    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idprodutos', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao PEDIDO',
        mtWarning, mbOKCancel, 0);
      exit;
    end;
  end;

  if (oMemTable.IsEmpty) then
  begin
    frmProduto.btnEditar.Enabled := false;
    frmProduto.btnExcluir.Enabled := false;
  end;
end;

procedure TProdutoListagemController.MontarGrid;
begin
  frmProduto.FDMemTable_listagem.Close;
  if (oProdutoRegra.MontarGrid(frmProduto.FDMemTable_listagem, oProdutoModel)) then
  begin
   // oMemTable.Open;
    frmProduto.bClick := true;
    frmProduto.btnEditar.Enabled := true;
    frmProduto.btnExcluir.Enabled := true;
  end
  else
  begin
    frmProduto.bClick := false;
    frmProduto.btnEditar.Enabled := false;
    frmProduto.btnExcluir.Enabled := false;
  end;
end;

end.
