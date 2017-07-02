unit uPedidoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, data.db, System.Rtti,FireDAC.Comp.Client, Winapi.Windows,
  uInterfaceCadastroController, uPedidoCadastro, uPedidoCadastroRegra,
  uPedidoCadastroModel, uPedidoDTO;

type
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
    procedure SalvarItens(Sender: TObject);
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure RetornarValorEdit(Sender: TObject);
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
  frmPedidoCadastro.btnSalvarItens.OnClick := SalvarItens;

  if (iId > 0) then
  begin
    oPedidoDTO.idPedido := iId;
    RetornarValorEdit(Sender);
  end;
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

procedure TPedidoCadastroController.RetornarValorEdit(Sender: TObject);
begin

end;

procedure TPedidoCadastroController.Salvar(Sender: TObject);
begin
  // dtDataHoraEntrega.DateTime := now;
  // ShowMessage(DateTimeToStr(frmPedidoCadastro.dtDataHoraEntrega.DateTime));
end;

procedure TPedidoCadastroController.SalvarItens(Sender: TObject);
begin
frmPedidoCadastro.fdMemTable.CreateDataSet;
frmPedidoCadastro.fdMemTable.insert;
frmPedidoCadastro.fdMemTableproduto.AsString := 'asasas';
frmPedidoCadastro.fdMemTable.Post;
end;

end.
