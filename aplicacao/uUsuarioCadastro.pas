unit uUsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmUsuarioCadastro = class(TfrmCadastroBase)
    edtSenha: TLabeledEdit;
    edtUsuario: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarioCadastro: TfrmUsuarioCadastro;

implementation

{$R *.dfm}

end.
