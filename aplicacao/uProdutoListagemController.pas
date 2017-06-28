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
    oProdutoModel: TBairroListagemModel;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemTable: TFDMemTable);
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
  aMemTable.Filter := '''%'+APesquisa+'%''';
  aMemTable.Filtered := true;
end;

procedure TProdutoListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmProduto))) then
    exit;
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
  oProdutoModel := TBairroListagemModel.Create;
end;

procedure TProdutoListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oProdutoCadastroController))) then
    oProdutoCadastroController := TBairroCadastroController.Create;
  iID := oMemTable.FieldByName('idproduto').AsInteger;
  oProdutoCadastroController.CreateFormCadastro(frmProduto, Sender, iID);

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
  iID: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iId := oMemTable.FieldByName('idbairro').AsInteger;
    if (oProdutoRegra.Excluir(iId, oProdutoModel)) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idbairro', iId);
      oMemTable.Delete;
    end
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;

  if (oMemtable.IsEmpty) then
  begin
    frmProduto.btnEditar.Enabled := false;
    frmProduto.btnExcluir.Enabled := false;
  end;
end;

procedure TProdutoListagemController.Help(Sender: TObject);
begin

end;

procedure TProdutoListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
oMemTable.Close;
  if (oProdutoRegra.MontarGrid(oMemTable, oProdutoModel)) then
  begin
    oMemTable.Open;
    frmProduto.bClick := True;
    frmProduto.btnEditar.Enabled := True;
    frmProduto.btnExcluir.Enabled := True;
  end
  else
  begin
    frmProduto.bClick := False;
    frmProduto.btnEditar.Enabled := False;
    frmProduto.btnExcluir.Enabled := False;
  end;
end;

end.
