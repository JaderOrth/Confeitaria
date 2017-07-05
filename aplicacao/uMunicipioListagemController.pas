unit uMunicipioListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uInterfaceListagemController, uMunicipio, uMunicipioCadastroController,
  uMunicipioDTO, uMunicipioListagemRegra, uMunicipioListagemModel;

type
  TMunicipioListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oMunicipioDTO: TMunicipioDTO;
    oMunicipioRegra: TMunicipioListagemRegra;
    oMunicipioModel: TMunicipioListagemModel;
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
  oMunicipioListagemController: IInterfaceListagemController;

implementation

{ TMunicipioListagemController }

procedure TMunicipioListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'descricao like ''%' + APesquisa +
    '%'' or estado like ''%' + AnsiUpperCase(APesquisa) + '%''';
  aMemTable.Filtered := True;
end;

procedure TMunicipioListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmMunicipio))) then
    exit;
  if (Assigned(oMunicipioCadastroController)) then
    oMunicipioCadastroController.CloseFormCadastro(Sender);
  frmMunicipio.Close;
  FreeAndNil(frmMunicipio);
end;

procedure TMunicipioListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oMunicipioCadastroController))) then
    oMunicipioCadastroController := TMunicipioCadastroController.Create(MontarGrid);
  oMunicipioCadastroController.CreateFormCadastro(frmMunicipio, Sender, 0);
end;

constructor TMunicipioListagemController.Create;
begin
  oMunicipioDTO := TMunicipioDTO.Create;
  oMunicipioRegra := TMunicipioListagemRegra.Create;
  oMunicipioModel := TMunicipioListagemModel.Create;
end;

procedure TMunicipioListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
begin
  if (not(Assigned(oMunicipioCadastroController))) then
    oMunicipioCadastroController := TMunicipioCadastroController.Create(MontarGrid);

  oMunicipioCadastroController.CreateFormCadastro(frmMunicipio, Sender,
    oMemTable.FieldByName('idmunicipio').AsInteger);
end;

procedure TMunicipioListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmMunicipio))) then
    frmMunicipio := TfrmMunicipio.Create(AOwner);
  frmMunicipio.oListagemBase := oMunicipioListagemController;
  frmMunicipio.Show;
  frmMunicipio.OnActivate(nil);
end;

destructor TMunicipioListagemController.Destroy;
begin
  if (Assigned(oMunicipioDTO)) then
    FreeAndNil(oMunicipioDTO);

  if (Assigned(oMunicipioRegra)) then
    FreeAndNil(oMunicipioRegra);

  if (Assigned(oMunicipioModel)) then
    FreeAndNil(oMunicipioModel);
  inherited;
end;

procedure TMunicipioListagemController.Excluir(oMemTable: TFDMemTable);
var
  iId, iValidar: Integer;
begin
  if (MessageDlg('Deseja realmente Excluir?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  begin
    iId := oMemTable.FieldByName('idmunicipio').AsInteger;
    iValidar := oMunicipioRegra.Excluir(iId, oMunicipioModel);
    if (iValidar = 1) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      // deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idmunicipio', iId);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      MessageDlg('Erro ao excluir este registro!', mtError, [mbOK], 0);
      exit;
    end;

    if (iValidar = 3) then
    begin
      MessageDlg('Registro não pode ser excluido, está associado a algum BAIRRO!',
        mtError, [mbOK], 0);
      exit;
    end;

  end;

  if (oMemTable.IsEmpty) then
  begin
    frmMunicipio.btnEditar.Enabled := false;
    frmMunicipio.btnExcluir.Enabled := false;
  end;

end;

procedure TMunicipioListagemController.MontarGrid;
begin
  frmMunicipio.FDMemTable_listagem.Close;
  if (oMunicipioRegra.MontarGrid(frmMunicipio.FDMemTable_listagem, oMunicipioModel)) then
  begin
    frmMunicipio.btnEditar.Enabled := True;
    frmMunicipio.btnExcluir.Enabled := True;
    frmMunicipio.bClick := True;
  end
  else
  begin
    frmMunicipio.btnEditar.Enabled := false;
    frmMunicipio.btnExcluir.Enabled := false;
    frmMunicipio.bClick := false;
  end;
end;

end.
