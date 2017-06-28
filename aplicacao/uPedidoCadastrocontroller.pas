unit uPedidoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uPedidoCadastro, uPedidoCadastroRegra,
  uPedidoCadstroModel, uPedidoDTO;

type
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
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
  oPedidoDTO := TPedidoDTO.Create;
  oPedidoRegra := TPedidoCadastroRegra.Create;
  oPedidoModel := TPedidoCadastroModel.Create;
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
  if (Assigned(oPedidoDTO)) then
    FreeAndNil(oPedidoDTO);

  if (Assigned(oPedidoRegra)) then
    FreeAndNil(oPedidoRegra);

  if (Assigned(oPedidoModel)) then
    FreeAndNil(oPedidoModel);
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
