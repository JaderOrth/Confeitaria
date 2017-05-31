unit uMunicipioListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.DBGrids,
  System.SysUtils, Vcl.Dialogs, System.UITypes,
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
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemTable: TFDMemTable; AGrid: TDBGrid);
    procedure Excluir(oMemTable: TFDMemTable; AGrid: TDBGrid);
    procedure BuscarGrid(aMemTable: TFDMemTable; AGrid: TDBGrid;
      APesquisa: String);

    constructor Create;
    destructor Destroy; override;

  end;

var
  oMunicipioListagemController: IInterfaceListagemController;

implementation

{ TMunicipioListagemController }

procedure TMunicipioListagemController.BuscarGrid(aMemTable: TFDMemTable;
  AGrid: TDBGrid; APesquisa: String);
begin

end;

procedure TMunicipioListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmMunicipio))) then
    exit;
  frmMunicipio.Close;
  FreeAndNil(frmMunicipio);
end;

procedure TMunicipioListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oMunicipioCadastroController))) then
    oMunicipioCadastroController := TMunicipioCadastroController.Create;
  oMunicipioCadastroController.CreateFormCadastro(frmMunicipio, 0);
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
  oMunicipioCadastroController.CreateFormCadastro(frmMunicipio,
    oMemTable.FieldByName('ID').AsInteger);
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

procedure TMunicipioListagemController.Excluir(oMemTable: TFDMemTable;
  AGrid: TDBGrid);
var
  iId: Integer;
begin
  if (MessageDlg('Deseja realmente Excluir?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  begin
    iId := oMemTable.FieldByName('ID').AsInteger;
    if (oMunicipioRegra.Excluir(iId, oMunicipioModel)) then
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0)
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;
end;

procedure TMunicipioListagemController.Help(Sender: TObject);
begin
  {  }
end;

procedure TMunicipioListagemController.MontarGrid(oMemTable: TFDMemTable;
  AGrid: TDBGrid);
begin
  if (oMunicipioRegra.MontarGrid(oMemTable, oMunicipioModel)) then
  begin
    frmMunicipio.btnEditar.Enabled := True;
    frmMunicipio.btnExcluir.Enabled := True;
    oMunicipioRegra.ConfigGrid(AGrid);
    oMemTable.Open;
  end else
  begin
    frmMunicipio.btnEditar.Enabled := False;
    frmMunicipio.btnExcluir.Enabled := False;
    oMunicipioRegra.ConfigGrid(AGrid);
  end;
end;

end.
