unit uEstadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmEstadoCadastro = class(TfrmCadastroBase)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoCadastro: TfrmEstadoCadastro;

implementation

{$R *.dfm}

procedure TfrmEstadoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEstadoCadastro := nil;
end;

end.
