unit uEstadoListagemController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.DBGrids, Vcl.ExtCtrls,
  uInterfaceListagemController, uEstadoListagemModel, uEstadoDTO,
  uEstadoListagemRegra, uEstado, uEstadoCadastroController;

type
  TEstadoListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
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
    procedure MontarGrid(oMemTable: TFDMemTable; AGrid: TDBGrid);
    procedure Excluir(oMemTable: TFDMemTable; AGrid: TDBGrid);
    procedure BuscarGrid(aMemTable: TFDMemTable; AGrid: TDBGrid;
      const APesquisa: String);

    constructor Create;
    destructor Destroy; override;
  end;
var
  oEstadoListagemController: IInterfaceListagemController;

implementation

{ TEstadoControler }

procedure TEstadoListagemController.BuscarGrid(aMemTable: TFDMemTable;
  AGrid: TDBGrid; const APesquisa: String);
begin
  oEstadoRegra.BuscarGrid(aMemTable, oEstadoModel, APesquisa);
end;

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

  iId := oMemTable.FieldByName('iduf').AsInteger;
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

procedure TEstadoListagemController.Excluir(oMemTable: TFDMemTable;
  AGrid: TDBGrid);
begin
  // retorna erro quando não tem nada cadastrado BUG-----
  if oEstadoRegra.Excluir(oMemTable.FieldByName('iduf').AsInteger, oEstadoModel)
  then
  begin
    oMemTable.Close;
    oEstadoRegra.MontarGrid(oMemTable, oEstadoModel);
    oMemTable.Open;
  end;
end;

procedure TEstadoListagemController.Help(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TEstadoListagemController.MontarGrid(oMemTable: TFDMemTable;
  AGrid: TDBGrid);
begin
  oMemTable.Close;
  if oEstadoRegra.MontarGrid(oMemTable, oEstadoModel) then
  begin
    oMemTable.Open;
    frmEstado.btnExcluir.Enabled := True;
    frmEstado.btnEditar.Enabled := True;
    frmEstado.bClick := True;
  end
  else
  begin
    frmEstado.btnExcluir.Enabled := False;
    frmEstado.btnEditar.Enabled := False;
    frmEstado.bClick := False;
  end;
end;

end.
