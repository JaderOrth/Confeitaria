unit uBairroListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
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
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
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
  if (Assigned(oBairroCadastroController)) then
   oBairroCadastroController.CloseFormCadastro(Sender);
  frmBairro.Close;
  FreeAndNil(frmBairro);
end;

procedure TBairroListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oBairroCadastroController))) then
    oBairroCadastroController := TBairroCadastroController.Create(MontarGrid);
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
    oBairroCadastroController := TBairroCadastroController.Create(MontarGrid);
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
  iID, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iID := oMemTable.FieldByName('idbairro').AsInteger;
    iValidar := oBairroRegra.Excluir(iID, oBairroModel);

    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idbairro', iID);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Erro ao deletar este registro, está associado ao CLIENTE ou PEDIDO',
        mtWarning, mbOKCancel, 0);
      exit;
    end;

  end;

  if (oMemTable.IsEmpty) then
  begin
    frmBairro.btnEditar.Enabled := false;
    frmBairro.btnExcluir.Enabled := false;
  end;
end;

procedure TBairroListagemController.MontarGrid;
begin
  frmBairro.FDMemTable_listagem.Close;
  if (oBairroRegra.MontarGrid(frmBairro.FDMemTable_listagem, oBairroModel)) then
  begin
    //oMemTable.Open;
    frmBairro.bClick := true;
    frmBairro.btnEditar.Enabled := true;
    frmBairro.btnExcluir.Enabled := true;
  end
  else
  begin
    frmBairro.bClick := false;
    frmBairro.btnEditar.Enabled := false;
    frmBairro.btnExcluir.Enabled := false;
  end;
end;

end.
