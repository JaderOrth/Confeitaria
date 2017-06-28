unit uProdutoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Controls,
  uInterfaceCadastroController,uProdutoCadastro;

type
  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private

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
  oProdutoCadastroController: IInterfaceCadastroController;

implementation

{ TBairroCadastroController }

procedure TBairroCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmProdutoCadastro))) then
    Exit;
  frmProdutoCadastro.Close;
  FreeAndNil(frmProdutoCadastro);
end;

constructor TBairroCadastroController.Create;
begin

end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmProdutoCadastro))) then
    frmProdutoCadastro := TfrmProdutoCadastro.Create(AOwner);
  frmProdutoCadastro.oInterfaceCadastroController := oProdutoCadastroController;
  frmProdutoCadastro.Show;

  if (iId > 0) then
  begin

  end;
end;

destructor TBairroCadastroController.Destroy;
begin

  inherited;
end;

procedure TBairroCadastroController.Novo(Sender: TObject);
begin

end;

procedure TBairroCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
begin

end;

end.
