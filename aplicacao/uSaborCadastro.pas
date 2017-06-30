unit uSaborCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmSaborCadastro = class(TfrmCadastroBase)
    edtSabor: TLabeledEdit;
    edtIngredientes: TMemo;
    Label1: TLabel;
    procedure edtSaborKeyPress(Sender: TObject; var Key: Char);
    procedure edtIngredientesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaborCadastro: TfrmSaborCadastro;

implementation

{$R *.dfm}

procedure TfrmSaborCadastro.edtIngredientesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSalvarClick(Sender);
end;

procedure TfrmSaborCadastro.edtSaborKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    edtIngredientes.SetFocus;
end;

end.
