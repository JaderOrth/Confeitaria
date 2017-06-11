unit uBairroListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils,
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
    procedure MontarGrid(oMemtable: TFDMemTable);
    procedure Excluir(oMemtable: TFDMemTable);
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
  oBairroDTO   := TBairroDTO.Create;
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

procedure TBairroListagemController.Excluir(oMemtable: TFDMemTable);
begin

end;

procedure TBairroListagemController.Help(Sender: TObject);
begin

end;

procedure TBairroListagemController.MontarGrid(oMemtable: TFDMemTable);
begin
  oMemtable.Close;
end;

end.
