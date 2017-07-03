unit uCategoriasListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uCategorias, uInterfaceListagemController, uCategoriasDTO,
  uCategoriasListagemModel, uCategoriasListagemRegra,
  uCategoriasCadastroController;

type
  TCategoriasListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oCategoriasModel: TCategoriasListagemModel;
    oCategoriasRegra: TCategoriasListagemRegra;
    oCategoriasDTO: TCategoriasDTO;

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
  oCategoriaListagemController: IInterfaceListagemController;

implementation

{ TCategoriasListagemController }

constructor TCategoriasListagemController.Create;
begin
  oCategoriasModel := TCategoriasListagemModel.Create;
  oCategoriasRegra := TCategoriasListagemRegra.Create;
  oCategoriasDTO := TCategoriasDTO.Create;
end;

destructor TCategoriasListagemController.Destroy;
begin
  if (Assigned(oCategoriasModel)) then
    FreeAndNil(oCategoriasModel);

  if (Assigned(oCategoriasRegra)) then
    FreeAndNil(oCategoriasRegra);

  if (Assigned(oCategoriasDTO)) then
    FreeAndNil(oCategoriasDTO);

  inherited;
end;

procedure TCategoriasListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + APesquisa + '%''';
  aMemTable.Filtered := true;
end;

procedure TCategoriasListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmCategorias))) then
    exit;
  frmCategorias.Close;
  FreeAndNil(frmCategorias);
end;

procedure TCategoriasListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oCategoriasCadastroController))) then
    oCategoriasCadastroController := TCategoriasCadastroController.Create;
  oCategoriasCadastroController.CreateFormCadastro(frmCategorias, Sender, 0);
end;

procedure TCategoriasListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oCategoriasCadastroController))) then
    oCategoriasCadastroController := TCategoriasCadastroController.Create;
  iID := oMemTable.FieldByName('idcategorias').AsInteger;
  oCategoriasCadastroController.CreateFormCadastro(frmCategorias, Sender, iID);
end;

procedure TCategoriasListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmCategorias))) then
    frmCategorias := TfrmCategorias.Create(AOwner);
  frmCategorias.oListagemBase := oCategoriaListagemController;
  frmCategorias.Show;
  frmCategorias.OnActivate(nil);
end;

procedure TCategoriasListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idcategorias').AsInteger;
    iValidar := oCategoriasRegra.Excluir(iID, oCategoriasModel);
    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idcategorias', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao PRODUTO',
        mtWarning, [mbOK], 0);
      exit;
    end;
  end;

  if (oMemTable.IsEmpty) then
  begin
    frmCategorias.btnEditar.Enabled := false;
    frmCategorias.btnExcluir.Enabled := false;
  end;
end;

procedure TCategoriasListagemController.Help(Sender: TObject);
begin

end;

procedure TCategoriasListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oCategoriasRegra.MontarGrid(oMemTable, oCategoriasModel)) then
  begin
    oMemTable.Open;
    frmCategorias.bClick := true;
    frmCategorias.btnEditar.Enabled := true;
    frmCategorias.btnExcluir.Enabled := true;
  end
  else
  begin
    frmCategorias.bClick := false;
    frmCategorias.btnEditar.Enabled := false;
    frmCategorias.btnExcluir.Enabled := false;
  end;
end;

end.
