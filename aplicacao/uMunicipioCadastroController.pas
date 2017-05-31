unit uMunicipioCadastroController;

interface

uses
  System.Classes, System.SysUtils,
  uInterfaceCadastroController, uMunicipioCadastro, uMunicipioCadastroModel,
  uMunicipioCadastroRegra, uMunicipioDTO;

type
  TMunicipioCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oMunicipioDTO: TMunicipioDTO;
    oMunicipioRegra: TMunicipioCadastroRegra;
    oMunicipioModel: TMunicipioCadastroModel;
  public
    procedure CreateFormCadastro(AOwner: TComponent; iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oMunicipioCadastroController: IInterfaceCadastroController;

implementation

{ TMunicipioCadastroController }

procedure TMunicipioCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (Assigned(frmMunicipioCadastro)) then
    frmMunicipioCadastro.Close;
  FreeandNil(frmMunicipioCadastro);
end;

constructor TMunicipioCadastroController.Create;
begin
  oMunicipioDTO := TMunicipioDTO.Create;
  oMunicipioRegra := TMunicipioCadastroRegra.Create;
  oMunicipioModel := TMunicipioCadastroModel.Create;
end;

procedure TMunicipioCadastroController.CreateFormCadastro(AOwner: TComponent;
  iId: Integer);
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.Show;



  oMunicipioDTO.IdMunicipio := iId;
  if (oMunicipioRegra.BuscarUpdate(oMunicipioDTO, oMunicipioModel)) then
  begin
    frmMunicipioCadastro.edtID.Text := IntToStr(oMunicipioDTO.IdMunicipio);
    frmMunicipioCadastro.edtMunicipio.Text := oMunicipioDTO.Descrição;
  end;
end;

destructor TMunicipioCadastroController.Destroy;
begin
  if (Assigned(oMunicipioDTO)) then
    FreeAndNil(oMunicipioDTO);

  if (Assigned(oMunicipioRegra)) then
    FreeAndNil(oMunicipioRegra);

  if (Assigned(oMunicipioModel)) then
    FreeAndNil(oMunicipioModel);
  inherited;
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
begin

end;

end.
