unit uBairroListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client,System.SysUtils, Vcl.Dialogs,
  System.UITypes,
  uBairro, uInterfaceListagemController, uBairroCadastroController,
  uBairroListagemRegra, uBairroListagemModel, uBairroDTO;

type
  TBairroListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oBairroModel: TBairroListagemModel;
    oBairroRegra: TBairroListagemRegra;
    oBairroDTO: TBairroDTO;
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
  oBairroListagemController: IInterfaceListagemController;

implementation

{ TBairroListagemController }

procedure TBairroListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%'+APesquisa+'%'''+
                      ' or municipio like ''%'+APesquisa+'%''';
  aMemTable.Filtered := true;
end;

procedure TBairroListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmBairro))) then
    exit;
  frmBairro.Close;
  FreeAndNil(frmBairro);
end;

procedure TBairroListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oBairroCadastroController))) then
    oBairroCadastroController := TBairroCadastroController.Create;
  oBairroCadastroController.CreateFormCadastro(frmBairro, Sender, 0);
end;

constructor TBairroListagemController.Create;
begin
  oBairroModel := TBairroListagemModel.Create;
  oBairroRegra := TBairroListagemRegra.Create;
  oBairroDTO := TBairroDTO.Create;
end;

procedure TBairroListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oBairroCadastroController))) then
    oBairroCadastroController := TBairroCadastroController.Create;
  iID := oMemTable.FieldByName('idbairro').AsInteger;
  oBairroCadastroController.CreateFormCadastro(frmBairro, Sender, iID);
end;

procedure TBairroListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmBairro))) then
    frmBairro := TfrmBairro.Create(AOwner);
  frmBairro.oListagemBase := oBairroListagemController;
  frmBairro.Show;
  frmBairro.OnActivate(nil);
end;

destructor TBairroListagemController.Destroy;
begin
  if (Assigned(oBairroModel)) then
    FreeAndNil(oBairroModel);

  if (Assigned(oBairroRegra)) then
    FreeAndNil(oBairroRegra);

  if (Assigned(oBairroDTO)) then
    FreeAndNil(oBairroDTO);
  inherited;
end;

procedure TBairroListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iId := oMemTable.FieldByName('idbairro').AsInteger;
    if (oBairroRegra.Excluir(iId, oBairroModel)) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idbairro', iId);
      oMemTable.Delete;
    end
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;
end;

procedure TBairroListagemController.Help(Sender: TObject);
begin

end;

procedure TBairroListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oBairroRegra.MontarGrid(oMemTable, oBairroModel)) then
  begin
    oMemTable.Open;
    frmBairro.bClick := True;
    frmBairro.btnEditar.Enabled := True;
    frmBairro.btnExcluir.Enabled := True;
  end
  else
  begin
    frmBairro.bClick := False;
    frmBairro.btnEditar.Enabled := False;
    frmBairro.btnExcluir.Enabled := False;
  end;
end;

end.
