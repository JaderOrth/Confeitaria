unit uMunicipioCadastroController;

interface

uses
  System.Classes, System.SysUtils,
  uInterfaceCadastroController, uMunicipioCadastro;

type
  TMunicipioCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)

    procedure CreateFormCadastro(AOwner: TComponent; iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
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

procedure TMunicipioCadastroController.CreateFormCadastro(AOwner: TComponent;
  iId: Integer);
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.Show;
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
begin

end;

end.
