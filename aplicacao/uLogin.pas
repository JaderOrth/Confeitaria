unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmLogin = class(TForm)
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnSair: TSpeedButton;
    btnLogin: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
