unit uEstadoCadastroController;

interface


uses
  System.Classes,
  System.SysUtils,
  uEstadoCadastro;

type
  TEstadoCadastroController = class
  private
    frmEstadoCadastro: TfrmEstadoCadastro;
  public
    procedure CreateFormCadastro(AOwner: TComponent);
    procedure CloseFormCadastro(Sender: TObject);
  end;

var
  oEstadoCadastroController: TEstadoCadastroController;

implementation

procedure TEstadoCadastroController.CreateFormCadastro(AOwner: TComponent);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner);
  frmEstadoCadastro.Show;

  frmEstadoCadastro.btnSair.OnClick := CloseFormCadastro;
end;

procedure TEstadoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    exit;
  FreeAndNil(frmEstadoCadastro);
end;

end.
