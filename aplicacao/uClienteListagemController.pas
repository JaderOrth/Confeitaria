unit uClienteListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
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
    procedure MontarGrid(oMemTable: TFDMemTable);
    procedure Excluir(oMemTable: TFDMemTable);
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
  aMemTable.Filter := ' endereco like ''%' + APesquisa + '%''' +
    ' or numero like ''%' + APesquisa + '%''' + ' or telefone like ''%' +
    APesquisa + '%''' + ' or celular like ''%' + APesquisa + '%''' +
    ' or descricao like ''%' + APesquisa + '%''' + ' or municipio like ''%' +
    APesquisa + '%''';
  aMemTable.Filtered := true;
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

procedure TClienteListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente deletar esse registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idcliente').AsInteger;
    iValidar := oClienteRegra.Excluir(iID, oClienteModel);

    if (iValidar = 1) then
    begin
      MessageDlg('Resgistro deletado com sucesso', mtInformation, [mbOK], 0);
      oMemTable.Locate('idcliente', iID);
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
        mtWarning, mbOKCancel, 0);
      exit;
    end;
  end;

  if (oMemTable.IsEmpty) then
  begin
    frmCliente.btnEditar.Enabled := false;
    frmCliente.btnExcluir.Enabled := false;
  end;

end;

procedure TClienteListagemController.Help(Sender: TObject);
begin
  { }
end;

procedure TClienteListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oClienteRegra.MontarGrid(oMemTable, oClienteModel)) then
  begin
    oMemTable.Open;
    frmCliente.bClick := true;
    frmCliente.btnEditar.Enabled := true;
    frmCliente.btnExcluir.Enabled := true;
  end
  else
  begin
    frmCliente.bClick := false;
    frmCliente.btnEditar.Enabled := false;
    frmCliente.btnExcluir.Enabled := false;
  end;
end;

end.
