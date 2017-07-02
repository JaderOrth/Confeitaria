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
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
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
  aMemTable.Filter := ' endereco like ''%'+APesquisa+'%'''+
                      ' or numero like ''%'+APesquisa+'%'''+
                      ' or telefone like ''%'+APesquisa+'%'''+
                      ' or celular like ''%'+APesquisa+'%'''+
                      ' or descricao like ''%'+APesquisa+'%'''+
                      ' or municipio like ''%'+APesquisa+'%''';
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
    oClienteCadastroController := TClienteCadastroController.Create(MontarGrid);
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
    oClienteCadastroController := TClienteCadastroController.Create(MontarGrid);
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
var
  iID: Integer;
begin
  if (MessageDlg('Deseja realmente deletar esse registro?', mtConfirmation,
  [mbYes, mbNo], 0 ) = mrYes) then
  begin
    iID := oMemtable.FieldByName('idcliente').AsInteger;
    if (oClienteRegra.Excluir(iID, oClienteModel)) then
    begin
      MessageDlg('Resgistro deletado com sucesso', mtInformation, [mbOK], 0);
      oMemtable.Locate('idcliente', iID);
      oMemtable.Delete;
    end
    else
      MessageDlg('Erro ao deletar este registro!', mtError, [mbOK], 0);
  end;

  if (oMemtable.IsEmpty) then
  begin
    frmCliente.btnEditar.Enabled := false;
    frmCliente.btnExcluir.Enabled := false;
  end;

end;

procedure TClienteListagemController.MontarGrid;
begin
  frmCliente.FDMemTable_listagem.Close;
  if (oClienteRegra.MontarGrid(frmCliente.FDMemTable_listagem, oClienteModel)) then
   begin
    frmCliente.bClick := True;
    frmCliente.btnEditar.Enabled := True;
    frmCliente.btnExcluir.Enabled := True;
  end
  else
  begin
    frmCliente.bClick := False;
    frmCliente.btnEditar.Enabled := False;
    frmCliente.btnExcluir.Enabled := False;
  end;
end;

end.
