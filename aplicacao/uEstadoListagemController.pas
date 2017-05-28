unit uEstadoListagemController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.DBGrids, Vcl.ExtCtrls,
  uInterfaceListagemController, uEstadoListagemModel, uEstadoDTO,
  uEstadoListagemRegra, uEstado, uEstadoCadastroController;

type
  TEstadoListagemController = class(TInterfacedObject, IInterfaceListagemController)
  private
    oEstadoModel: TEstadoListagemModel;
    oEstadoDTO: TEstadoDTO;
    oEstadoRegra: TEstadoListagemRegra;

    frmEstado: TfrmEstado;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemtable: TFDMemTable; AGrid: TDBGrid);
    procedure Excluir(oMemtable: TFDMemTable; AGrid: TDBGrid);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oEstadoListagemController: IInterfaceListagemController;

implementation


{ TEstadoControler }

procedure TEstadoListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmEstado))) then
    exit;
  frmEstado.Close;
  FreeAndNil(frmEstado);
end;

procedure TEstadoListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oEstadoCadastroController))) then
    oEstadoCadastroController := TEstadoCadastroController.Create;
   // passa 0 porque quando o usuario clicar em editar iá passar o ID
  oEstadoCadastroController.CreateFormCadastro(frmEstado, 0);
end;

procedure TEstadoListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iId: Integer;
begin
  if (not(Assigned(oEstadoCadastroController))) then
    oEstadoCadastroController := TEstadoCadastroController.Create;

  iId := oMemTable.FieldByName('ID').AsInteger;
  oEstadoCadastroController.CreateFormCadastro(frmEstado, iId);
end;

constructor TEstadoListagemController.Create;
begin
  oEstadoModel := TEstadoListagemModel.Create;
  oEstadoDTO := TEstadoDTO.Create;
  oEstadoRegra := TEstadoListagemRegra.Create;
end;



procedure TEstadoListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmEstado))) then
    frmEstado := TfrmEstado.Create(AOwner);
  frmEstado.oListagemBase := oEstadoListagemController;
  frmEstado.Show;
  frmEstado.FormActivate(nil);
end;

destructor TEstadoListagemController.Destroy;
begin
  if (Assigned(oEstadoModel)) then
    FreeAndNil(oEstadoModel);

  if (Assigned(oEstadoDTO)) then
    FreeAndNil(oEstadoDTO);

  if (Assigned(oEstadoRegra)) then
    FreeAndNil(oEstadoRegra);

  inherited;
end;

procedure TEstadoListagemController.Excluir(oMemtable: TFDMemTable;
  AGrid: TDBGrid);
begin
  oEstadoRegra.Excluir(oMemtable.FieldByName('ID').AsInteger, oEstadoModel);
  oEstadoRegra.MontarGrid(oMemtable, oEstadoModel);
   oEstadoRegra.ConfigGrid(AGrid);
  oMemtable.Open;
end;

procedure TEstadoListagemController.Help(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TEstadoListagemController.MontarGrid(oMemtable: TFDMemTable;
  AGrid: TDBGrid);
begin
  oEstadoRegra.MontarGrid(oMemtable, oEstadoModel);
  oEstadoRegra.ConfigGrid(AGrid);
  oMemtable.Open;
end;

end.
