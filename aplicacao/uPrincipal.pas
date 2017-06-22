unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls, System.UITypes,
  uClassConexaoSingleton, uEstadoListagemController, uMunicipioListagemController,
  uBairroListagemController, uClienteListagemController, uUsuarioListagemController,
  uCategoriasListagemController, uPedidoListagemController;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Funes1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Cadastros1: TMenuItem;
    Usurio1: TMenuItem;
    Produtos1: TMenuItem;
    Bairro1: TMenuItem;
    Categorias1: TMenuItem;
    Cliente1: TMenuItem;
    Municpio1: TMenuItem;
    Sabores1: TMenuItem;
    Estado1: TMenuItem;
    UnidadedeMedida1: TMenuItem;
    LargeImages: TImageList;
    SmallImages: TImageList;
    Panel1: TPanel;
    btnPedidos: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnClientes: TSpeedButton;
    btnSair: TSpeedButton;
    Pedido1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Municpio1Click(Sender: TObject);
    procedure Bairro1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Bairro1Click(Sender: TObject);
begin
  if (not(Assigned(oBairroListagemController))) then
    oBairroListagemController := TBairroListagemController.Create;

  oBairroListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  if (not(Assigned(oClienteListagemController))) then
    oClienteListagemController := TClienteListagemController.Create;
  oClienteListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.btnPedidosClick(Sender: TObject);
begin
  if (not(Assigned(oPedidoListagemController))) then
    oPedidoListagemController := TPedidoListagemController.Create;
  oPedidoListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Categorias1Click(Sender: TObject);
begin
  if (not(Assigned(oCategoriaListagemController))) then
    oCategoriaListagemController := TCategoriasListagemController.Create;
  oCategoriaListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  btnClientesClick(Sender);
end;

procedure TfrmPrincipal.Estado1Click(Sender: TObject);
begin
  if (not(Assigned(oEstadoListagemController))) then
    oEstadoListagemController := TEstadoListagemController.Create;
  oEstadoListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal := nil;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  try
    TConexaoSingleton.GetInstancia;
  except
    MessageDlg('Erro ao conectar com o banco de dados.', mtError, [mbOK], 0);
    Application.Terminate;
    exit;
  end;

end;

procedure TfrmPrincipal.Municpio1Click(Sender: TObject);
begin
  if (not(Assigned(oMunicipioListagemController))) then
    oMunicipioListagemController := TMunicipioListagemController.Create;
  oMunicipioListagemController.CreateFormListagem(Self);
end;

procedure TfrmPrincipal.Pedido1Click(Sender: TObject);
begin
  btnPedidosClick(Sender);
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
  if (not(Assigned(oUsuarioListagemController))) then
    oUsuarioListagemController := TUsuarioListagemController.Create;
  oUsuarioListagemController.CreateFormListagem(Self);
end;

end.
