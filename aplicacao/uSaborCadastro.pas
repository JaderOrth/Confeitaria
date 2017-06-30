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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaborCadastro: TfrmSaborCadastro;

implementation

{$R *.dfm}

end.
