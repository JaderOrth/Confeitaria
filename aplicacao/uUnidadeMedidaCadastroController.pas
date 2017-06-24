unit uUnidadeMedidaCadastroController;

interface

uses
  Vcl.Controls,
  System.Classes,
  System.SysUtils,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  uInterfaceCadastroController, uUnidadeMedidaCadastro;

type
  TUnidadeMedidaCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
    procedure CreateFormCadastro(AOwner: TComponent; iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);

  end;

var
  oUnidadeMedidaCadastroController: IInterfaceCadastroController;

implementation

{ TUnidadeMedidaCadastroController }

procedure TUnidadeMedidaCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmUnidadeMedidaCadastro))) then
    exit;
  frmUnidadeMedidaCadastro.Close;
  FreeAndNil(frmUnidadeMedidaCadastro);
end;

procedure TUnidadeMedidaCadastroController.CreateFormCadastro(AOwner: TComponent; iId: Integer);
begin
  if (not(Assigned(frmUnidadeMedidaCadastro))) then
    frmUnidadeMedidaCadastro := TfrmUnidadeMedidaCadastro.Create(AOwner);
  frmUnidadeMedidaCadastro.oInterfaceCadastroController := oUnidadeMedidaCadastroController;
  frmUnidadeMedidaCadastro.Show;

end;

procedure TUnidadeMedidaCadastroController.Salvar(Sender: TObject);
begin

end;

end.
