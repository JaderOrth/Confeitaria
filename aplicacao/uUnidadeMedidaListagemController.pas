unit uUnidadeMedidaListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uUnidadeMedida, uInterfaceListagemController, uUnidadeMedidaDTO,
  uUnidadeMedidaListagemModel, uUnidadeMedidaListagemRegra,
  uUnidadeMedidaCadastroController;

type
  TUnidadeMedidaListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oUnidadeMedidaModel: TUnidadeMedidaListagemModel;
    oUnidadeMedidaRegra: TUnidadeMedidaListagemRegra;
    oUnidadeMedidaDTO: TUnidadeMedidaDTO;
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
  oUnidadeMedidaListagemController: IInterfaceListagemController;

implementation

{ TUnidadeMedidaListagemController }

procedure TUnidadeMedidaListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + AnsiUpperCase(APesquisa) + '%''' +
    ' or sigla like ''%' + AnsiUpperCase(APesquisa) + '%''';
  aMemTable.Filtered := true;
end;

procedure TUnidadeMedidaListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmUnidadeMedida))) then
    exit;
  if (Assigned(oUnidadeMedidaCadastroController)) then
    oUnidadeMedidaCadastroController.CloseFormCadastro(Sender);
  frmUnidadeMedida.Close;
  FreeAndNil(frmUnidadeMedida);
end;

procedure TUnidadeMedidaListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oUnidadeMedidaCadastroController))) then
    oUnidadeMedidaCadastroController := TUnidadeMedidaCadastroController.Create(MontarGrid);
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
    oUnidadeMedidaCadastroController := TUnidadeMedidaCadastroController.Create(MontarGrid);
  iID := oMemTable.FieldByName('idunidade_medida').AsInteger;
  oUnidadeMedidaCadastroController.CreateFormCadastro(frmUnidadeMedida,
    Sender, iID);
end;

procedure TUnidadeMedidaListagemController.CreateFormListagem
  (AOwner: TComponent);
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

procedure TUnidadeMedidaListagemController.Excluir(oMemTable: TFDMemTable);
var
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idunidade_medida').AsInteger;
    iValidar := oUnidadeMedidaRegra.Excluir(iID, oUnidadeMedidaModel);
    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idunidade_medida', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao PRODUTO',
        mtWarning, mbOKCancel, 0);
      exit;
    end;
  end;

  if (oMemTable.IsEmpty) then
  begin
    frmUnidadeMedida.btnEditar.Enabled := false;
    frmUnidadeMedida.btnExcluir.Enabled := false;
  end;
end;

procedure TUnidadeMedidaListagemController.MontarGrid;
begin
  frmUnidadeMedida.FDMemTable_listagem.Close;
  if (oUnidadeMedidaRegra.MontarGrid(frmUnidadeMedida.FDMemTable_listagem, oUnidadeMedidaModel)) then
  begin
    frmUnidadeMedida.bClick := True;
    frmUnidadeMedida.btnEditar.Enabled := True;
    frmUnidadeMedida.btnExcluir.Enabled := True;
  end
  else
  begin
    frmUnidadeMedida.bClick := true;
    frmUnidadeMedida.btnEditar.Enabled := false;
    frmUnidadeMedida.btnExcluir.Enabled := false;
  end;
end;

end.
