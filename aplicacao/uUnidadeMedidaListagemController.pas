unit uUnidadeMedidaListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uUnidadeMedida, uInterfaceListagemController, uUnidadeMedidaDTO,
  uUnidadeMedidaListagemModel, uUnidadeMedidaListagemRegra, uUnidadeMedidaCadastroController;

type
  TUnidadeMedidaListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oUnidadeMedidaModel : TUnidadeMedidaListagemModel;
    oUnidadeMedidaRegra : TUnidadeMedidaListagemRegra;
    oUnidadeMedidaDTO : TUnidadeMedidaDTO;
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
  oUnidadeMedidaListagemController: IInterfaceListagemController;

implementation

{ TUnidadeMedidaListagemController }

procedure TUnidadeMedidaListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%'+APesquisa+'%'''+
                      ' or sigla like ''%'+APesquisa+'%''';
  aMemTable.Filtered := true;
end;

procedure TUnidadeMedidaListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmUnidadeMedida))) then
    exit;
  frmUnidadeMedida.Close;
  FreeAndNil(frmUnidadeMedida);
end;

procedure TUnidadeMedidaListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oUnidadeMedidaCadastroController))) then
    oUnidadeMedidaCadastroController := TUnidadeMedidaCadastroController.Create;
  oUnidadeMedidaCadastroController.CreateFormCadastro(frmUnidadeMedida, Sender, 0);
end;

constructor TUnidadeMedidaListagemController.Create;
begin
  oUnidadeMedidaModel := TUnidadeMedidaListagemModel.Create;
  oUnidadeMedidaRegra := TUnidadeMedidaListagemRegra.Create;
  oUnidadeMedidaDTO := TUnidadeMedidaDTO.Create;
end;

procedure TUnidadeMedidaListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oUnidadeMedidaCadastroController))) then
    oUnidadeMedidaCadastroController := TUnidadeMedidaCadastroController.Create;
  iID := oMemTable.FieldByName('idunidade_medida').AsInteger;
  oUnidadeMedidaCadastroController.CreateFormCadastro(frmUnidadeMedida, Sender, iID);
end;

procedure TUnidadeMedidaListagemController.CreateFormListagem(
  AOwner: TComponent);
begin
  if (not(Assigned(frmUnidadeMedida))) then
    frmUnidadeMedida := TfrmUnidadeMedida.Create(AOwner);
  frmUnidadeMedida.oListagemBase := oUnidadeMedidaListagemController;
  frmUnidadeMedida.Show;
  frmUnidadeMedida.OnActivate(nil);
end;

destructor TUnidadeMedidaListagemController.Destroy;
begin
  if (Assigned(oUnidadeMedidaModel)) then
    FreeAndNil(oUnidadeMedidaModel);

  if (Assigned(oUnidadeMedidaRegra)) then
    FreeAndNil(oUnidadeMedidaRegra);

  if (Assigned(oUnidadeMedidaDTO)) then
    FreeAndNil(oUnidadeMedidaDTO);
  inherited;
end;

procedure TUnidadeMedidaListagemController.Excluir(oMemtable: TFDMemTable);
var
  iID: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iId := oMemTable.FieldByName('idunidade_medida').AsInteger;
    if (oUnidadeMedidaRegra.Excluir(iId, oUnidadeMedidaModel)) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idunidade_medida', iId);
      oMemTable.Delete;
    end
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;

  if (oMemtable.IsEmpty) then
  begin
    frmUnidadeMedida.btnEditar.Enabled := false;
    frmUnidadeMedida.btnExcluir.Enabled := false;
  end;
end;

procedure TUnidadeMedidaListagemController.Help(Sender: TObject);
begin

end;

procedure TUnidadeMedidaListagemController.MontarGrid(oMemtable: TFDMemTable);
begin
  oMemTable.Close;
  if (oUnidadeMedidaRegra.MontarGrid(oMemTable, oUnidadeMedidaModel)) then
  begin
    oMemTable.Open;
    frmUnidadeMedida.bClick := True;
    frmUnidadeMedida.btnEditar.Enabled := True;
    frmUnidadeMedida.btnExcluir.Enabled := True;
  end
  else
  begin
    frmUnidadeMedida.bClick := True;
    frmUnidadeMedida.btnEditar.Enabled := False;
    frmUnidadeMedida.btnExcluir.Enabled := False;
  end;
end;

end.
