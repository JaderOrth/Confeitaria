unit uCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroBase = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    panelCadastro: TPanel;
    btnNovo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  if (Owner is TForm) then
    (Owner as TForm).Enabled := False;
end;

procedure TfrmCadastroBase.FormDestroy(Sender: TObject);
begin
  if (Owner is TForm) then
    (Owner as TForm).Enabled := True;
end;

end.
