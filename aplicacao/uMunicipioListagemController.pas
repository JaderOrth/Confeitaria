unit uMunicipioListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client,System.SysUtils, Vcl.Dialogs,
   System.UITypes,
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
    procedure MontarGrid(oMemTable: TFDMemTable);
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
  aMemTable.Filter := 'descricao like ''%'+
                      APesquisa+'%'' or estado like ''%'+
                      UpperCase(APesquisa)+'%''';
  aMemTable.Filtered := True;
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
    oMunicipioCadastroController := TMunicipioCadastroController.Create;
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
  iId: Integer;
begin
  if (MessageDlg('Deseja realmente Excluir?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  begin
    iId := oMemTable.FieldByName('idmunicipio').AsInteger;
    if (oMunicipioRegra.Excluir(iId, oMunicipioModel)) then
    begin
      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
      //deleta o registro do mentable sem ir no banco de dados para atualizar a grid
      oMemTable.Locate('idmunicipio', iId);
      oMemTable.Delete;
    end
    else
      raise Exception.Create('Error  ao deletar o Registro');
  end;
end;

procedure TMunicipioListagemController.Help(Sender: TObject);
begin
  {  }
end;

procedure TMunicipioListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oMunicipioRegra.MontarGrid(oMemTable, oMunicipioModel)) then
  begin
    oMemTable.Open;
    frmMunicipio.btnEditar.Enabled := True;
    frmMunicipio.btnExcluir.Enabled := True;
    frmMunicipio.bClick := true;
  end
  else
  begin
    frmMunicipio.btnEditar.Enabled := False;
    frmMunicipio.btnExcluir.Enabled := False;
    frmMunicipio.bClick := False;
  end;
end;

end.
