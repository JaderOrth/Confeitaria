unit uClienteListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, System.UITypes,
  uInterfaceListagemController, uClienteDTO, uCliente,
  uClienteCadastroController, uClienteListagemRegra, uClienteListagemModel;

type
  TClienteListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oClieteDTO: TClienteDTO;
    oClienteModel: TClienteListagemModel;
    oClienteRegra: TClienteListagemRegra;
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
  oClienteListagemController: IInterfaceListagemController;

implementation

{ TClienteListagemController }

procedure TClienteListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin

end;

procedure TClienteListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmCliente))) then
    exit;
  frmCliente.Close;
  FreeAndNil(frmCliente);
end;

procedure TClienteListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oClienteCadastroController))) then
    oClienteCadastroController := TClienteCadastroController.Create;
  oClienteCadastroController.CreateFormCadastro(frmCliente, Sender, 0);
end;

constructor TClienteListagemController.Create;
begin
  oClienteModel := TClienteListagemModel.Create;
  oClieteDTO := TClienteDTO.Create;
  oClienteRegra := TClienteListagemRegra.Create;
end;

procedure TClienteListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oClienteCadastroController))) then
    oClienteCadastroController := TClienteCadastroController.Create;
  iID := oMemTable.FieldByName('idcliente').AsInteger;
  oClienteCadastroController.CreateFormCadastro(frmCliente, Sender, iID);
end;

procedure TClienteListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmCliente))) then
    frmCliente := TfrmCliente.Create(AOwner);
  frmCliente.oListagemBase := oClienteListagemController;
  frmCliente.show;
  frmCliente.OnActivate(nil);
end;

destructor TClienteListagemController.Destroy;
begin
  if (Assigned(oClienteModel)) then
    FreeAndNil(oClienteModel);

  if (Assigned(oClieteDTO)) then
    FreeAndNil(oClieteDTO);

  if (Assigned(oClienteRegra)) then
    FreeAndNil(oClienteRegra);
  inherited;
end;

procedure TClienteListagemController.Excluir(oMemtable: TFDMemTable);
begin

end;

procedure TClienteListagemController.Help(Sender: TObject);
begin

end;

procedure TClienteListagemController.MontarGrid(oMemtable: TFDMemTable);
begin
  oMemtable.Close;
  oClienteRegra.MontarGrid(oMemtable, oClienteModel);
  oMemtable.open;
end;

end.
