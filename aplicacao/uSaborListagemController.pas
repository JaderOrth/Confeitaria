unit uSaborListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uSabor, uInterfaceListagemController, uSaborDTO, uSaborListagemRegra,
  uSaborListagemModel,
  uSaborCadastroController;

type
  TSaborListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oSaborModel: TSaborListagemModel;
    oSaborRegra: TSaborListagemRegra;
    oSaborDTO: TSaborDTO;
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
  oSaborListagemController: IInterfaceListagemController;

implementation

{ TSaborListagemController }

procedure TSaborListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + APesquisa + '%''' +
    ' or ingredientes like ''%' + APesquisa + '%''';
  aMemTable.Filtered := true;
end;

procedure TSaborListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmSabor))) then
    exit;
  oSaborCadastroController.CloseFormCadastro(Sender);
  frmSabor.Close;
  FreeAndNil(frmSabor);
end;

procedure TSaborListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oSaborCadastroController))) then
    oSaborCadastroController := TSaborCadastroController.Create;
  oSaborCadastroController.CreateFormCadastro(frmSabor, Sender, 0);
end;

constructor TSaborListagemController.Create;
begin
  oSaborModel := TSaborListagemModel.Create;
  oSaborRegra := TSaborListagemRegra.Create;
  oSaborDTO := TSaborDTO.Create;
end;

procedure TSaborListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oSaborCadastroController))) then
    oSaborCadastroController := TSaborCadastroController.Create;
  iID := oMemTable.FieldByName('idsabores').AsInteger;
  oSaborCadastroController.CreateFormCadastro(frmSabor, Sender, iID);
end;

procedure TSaborListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmSabor))) then
    frmSabor := TfrmSabor.Create(AOwner);
  frmSabor.oListagemBase := oSaborListagemController;
  frmSabor.Show;
  frmSabor.OnActivate(nil);
end;

destructor TSaborListagemController.Destroy;
begin
  if (Assigned(oSaborModel)) then
    FreeAndNil(oSaborModel);

  if (Assigned(oSaborRegra)) then
    FreeAndNil(oSaborRegra);

  if (Assigned(oSaborDTO)) then
    FreeAndNil(oSaborDTO);
  inherited;
end;

procedure TSaborListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idsabores').AsInteger;
    iValidar := oSaborRegra.Excluir(iID, oSaborModel);
    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idsabores', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao PRODUTO ou PEDIDO',
        mtWarning, mbOKCancel, 0);
      exit;
    end;
  end;

  if (oMemTable.IsEmpty) then
  begin
    frmSabor.btnEditar.Enabled := false;
    frmSabor.btnExcluir.Enabled := false;
  end;
end;

procedure TSaborListagemController.Help(Sender: TObject);
begin

end;

procedure TSaborListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oSaborRegra.MontarGrid(oMemTable, oSaborModel)) then
  begin
    oMemTable.Open;
    frmSabor.bClick := true;
    frmSabor.btnEditar.Enabled := true;
    frmSabor.btnExcluir.Enabled := true;
  end
  else
  begin
    frmSabor.bClick := false;
    frmSabor.btnEditar.Enabled := false;
    frmSabor.btnExcluir.Enabled := false;
  end;
end;

end.
