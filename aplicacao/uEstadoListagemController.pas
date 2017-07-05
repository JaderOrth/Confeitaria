unit uEstadoListagemController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.ExtCtrls, Data.DB,
  uInterfaceListagemController, uEstadoListagemModel, uEstadoDTO,
  uEstadoListagemRegra, uEstado, uEstadoCadastroController;

type
  TEstadoListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oEstadoModel: TEstadoListagemModel;
    oEstadoDTO: TEstadoDTO;
    oEstadoRegra: TEstadoListagemRegra;
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
  oEstadoListagemController: IInterfaceListagemController;

implementation

{ TEstadoControler }

procedure TEstadoListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + AnsiUpperCase(aPesquisa) + '%''' +
                      ' or sigla_uf like ''%' + AnsiUpperCase(aPesquisa) + '%''';
  aMemTable.Filtered := True;
end;

procedure TEstadoListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmEstado))) then
    exit;
  oEstadoCadastroController.CloseFormCadastro(Sender);
  frmEstado.Close;
  FreeAndNil(frmEstado);
end;

procedure TEstadoListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oEstadoCadastroController))) then
    oEstadoCadastroController := TEstadoCadastroController.Create;
  // passa 0 porque quando o usuario clicar em editar irá passar o ID
  oEstadoCadastroController.CreateFormCadastro(frmEstado, Sender, 0);
end;

procedure TEstadoListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iId: Integer;
begin
  if (not(Assigned(oEstadoCadastroController))) then
    oEstadoCadastroController := TEstadoCadastroController.Create;

  iId := oMemTable.FieldByName('iduf').AsInteger;
  oEstadoCadastroController.CreateFormCadastro(frmEstado, Sender, iId);
end;

constructor TEstadoListagemController.Create;
begin
  if (not(Assigned(oEstadoModel))) then
    oEstadoModel := TEstadoListagemModel.Create;

  if (not(Assigned(oEstadoDTO))) then
    oEstadoDTO := TEstadoDTO.Create;

  if (not(Assigned(oEstadoRegra))) then
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

procedure TEstadoListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('iduf').AsInteger;
    iValidar := oEstadoRegra.Excluir(iID, oEstadoModel);

    if (iValidar = 1) then
    begin
      MessageDlg('Registro deletado com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('iduf', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

     if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao MUNICÍPIO',
        mtWarning, [mbOK], 0);
      exit;
    end;
  end;

  if (oMemtable.IsEmpty) then
  begin
    frmEstado.btnEditar.Enabled := false;
    frmEstado.btnExcluir.Enabled := false;
  end;

end;

procedure TEstadoListagemController.Help(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TEstadoListagemController.MontarGrid(oMemTable: TFDMemTable);
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
