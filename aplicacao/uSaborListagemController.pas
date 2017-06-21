unit uSaborListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uSabor, uInterfaceListagemController;
  // uInterfaceListagemController, uBairroCadastroController,
  //uBairroListagemRegra, uBairroListagemModel, uBairroDTO;

type
  TSaborListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    {oSaborModel: TSaborListagemModel;
    oSaborRegra: TSaborListagemRegra;
    oSaborDTO: TSaborDTO;}
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
  aMemTable.Filter := 'descricao like ''%'+APesquisa+'%'''+
                      ' or ingredientes like ''%'+APesquisa+'%''';
  aMemTable.Filtered := true;
end;

procedure TSaborListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmSaborListagem))) then
    exit;
  frmSaborListagem.Close;
  FreeAndNil(frmSaborListagem);
end;

procedure TSaborListagemController.ControlerCadastro(Sender: TObject);
begin
  {if (not(Assigned(oSaborCadastroController))) then
    oSaborCadastroController := TSaborCadastroController.Create;
  oSaborListagemController.CreateFormCadastro(frmSaborListagem, Sender, 0); }
end;

constructor TSaborListagemController.Create;
begin
  {oSaborModel := TSaborListagemModel.Create;
  oSaborRegra := TSaborListagemRegra.Create;
  oSaborDTO := TSaborDTO.Create;}
end;

procedure TSaborListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  {if (not(Assigned(oSaborCadastroController))) then
    oSaborCadastroController := TSaborCadastroController.Create;
  iID := oMemTable.FieldByName('idsabores').AsInteger;
  oSaborCadastroController.CreateFormCadastro(frmSaborListagem, Sender, iID);}
end;

procedure TSaborListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmSaborListagem))) then
    frmSaborListagem := TfrmSaborListagem.Create(AOwner);
  frmSaborListagem.oListagemBase := oSaborListagemController;
  frmSaborListagem.Show;
  frmSaborListagem.OnActivate(nil);
end;

destructor TSaborListagemController.Destroy;
begin
  if (Assigned(oModel)) then
    FreeAndNil(oBairroModel);

  if (Assigned(oBairroRegra)) then
    FreeAndNil(oBairroRegra);

  if (Assigned(oBairroDTO)) then
    FreeAndNil(oBairroDTO);
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
    frmSaborListagem.btnEditar.Enabled := false;
    frmSaborListagem.btnExcluir.Enabled := false;
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
