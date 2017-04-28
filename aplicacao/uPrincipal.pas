unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls,
  uClassConexaoSingleton;

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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure Sair1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uEstado;

procedure TfrmPrincipal.Estado1Click(Sender: TObject);
begin
  if (not(Assigned(frmEstado))) then
    frmEstado := TfrmEstado.Create(Application);

  frmEstado.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    TConexaoSingleton.GetInstancia;
  except
    MessageDlg('Erro ao conectar com o banco de dados.', mtError, [mbOK], 0);
    Application.Terminate;
    exit;
  end;

  ReportMemoryLeaksOnShutdown := True;

end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

end.
