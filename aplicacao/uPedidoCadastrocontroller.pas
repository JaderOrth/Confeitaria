unit uPedidoCadastrocontroller;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uPedidoCadastro;

type
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Pesquisar(Sender: TObject);


    constructor Create;
    destructor Destroy; override;
  end;
var
  oPedidoCadastroController: IInterfaceCadastroController;

implementation

{ TPedidoCadastroController }

procedure TPedidoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmPedidoCadastro))) then
    exit;
  frmPedidoCadastro.Close;
  FreeAndNil(frmPedidoCadastro);
end;

constructor TPedidoCadastroController.Create;
begin

end;

procedure TPedidoCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmPedidoCadastro))) then
    frmPedidoCadastro := TfrmPedidoCadastro.Create(AOwner);

  frmPedidoCadastro.oInterfaceCadastroController := oPedidoCadastroController;
  frmPedidoCadastro.Show;
end;

destructor TPedidoCadastroController.Destroy;
begin

  inherited;
end;

procedure TPedidoCadastroController.Novo(Sender: TObject);
begin

end;

procedure TPedidoCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TPedidoCadastroController.Salvar(Sender: TObject);
begin

end;

end.
