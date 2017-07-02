unit uSaborListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uSabor, uInterfaceListagemController, uSaborDTO, uSaborListagemRegra, uSaborListagemModel,
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
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
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
  aMemTable.Filter := 'descricao like ''%'+APesquisa+'%'''+
                      ' or ingredientes like ''%'+APesquisa+'%''';
  aMemTable.Filtered := true;
end;

procedure TSaborListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmSabor))) then
    exit;
  frmSabor.Close;
  FreeAndNil(frmSabor);
end;

procedure TSaborListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oSaborCadastroController))) then
    oSaborCadastroController := TSaborCadastroController.Create(MontarGrid);
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
    oSaborCadastroController := TSaborCadastroController.Create(MontarGrid);
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
  iID: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iId := oMemTable.FieldByName('idsabores').AsInteger;
    if (oSaborRegra.Excluir(iId, oSaborModel)) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idsabores', iId);
      oMemTable.Delete;
    end
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;

  if (oMemtable.IsEmpty) then
  begin
    frmSabor.btnEditar.Enabled := false;
    frmSabor.btnExcluir.Enabled := false;
  end;
end;

procedure TSaborListagemController.MontarGrid;
begin
  frmSabor.FDMemTable_listagem.Close;
  if (oSaborRegra.MontarGrid(frmSabor.FDMemTable_listagem, oSaborModel)) then
  begin
    frmSabor.bClick := True;
    frmSabor.btnEditar.Enabled := True;
    frmSabor.btnExcluir.Enabled := True;
  end
  else
  begin
    frmSabor.bClick := False;
    frmSabor.btnEditar.Enabled := False;
    frmSabor.btnExcluir.Enabled := False;
  end;
end;

end.
