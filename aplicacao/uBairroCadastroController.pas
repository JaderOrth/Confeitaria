unit uBairroCadastroController;

interface

uses
  System.Classes, System.SysUtils,
  uInterfaceCadastroController, uBairroCadastro;

type
  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);

  end;

var
  oBairroCadastroController: IInterfaceCadastroController;

implementation

{ TBairroCadastroController }

procedure TBairroCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmBairroCadastro))) then
    exit;
  frmBairroCadastro.Close;
  FreeAndNil(frmBairroCadastro);
end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmBairroCadastro))) then
    frmBairroCadastro := TfrmBairroCadastro.Create(AOwner);
  frmBairroCadastro.oInterfaceCadastroController := oBairroCadastroController;
  frmBairroCadastro.Show;
end;

procedure TBairroCadastroController.Novo(Sender: TObject);
begin

end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
begin

end;

end.
