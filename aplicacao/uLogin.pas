unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  uLoginController, uLoginDto;

type
  TfrmLogin = class(TForm)
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnSair: TSpeedButton;
    btnLogin: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oLoginController: TLoginController;
    oLoginDTO: TLoginDTO;
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

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Assigned(oLoginController)) then
    FreeAndNil(oLoginController);
  if (Assigned(oLoginDTO)) then
    FreeAndNil(oLoginDTO);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  if (not(Assigned(oLoginController))) then
    oLoginController := TLoginController.Create;
  if (not(Assigned(oLoginDTO))) then
    oLoginDTO := TLoginDTO.Create;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  oLoginDTO.Nome := frmLogin.edtNome.Text;
  oLoginDTO.Senha := frmLogin.edtSenha.Text;
  if (oLoginController.Login(oLoginDTO)) then
    ModalResult := mrOk;

end;

end.
