unit uMunicipioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmMunicipioCadastro = class(TfrmCadastroBase)
    edtMunicipio: TLabeledEdit;
    cbEstado: TComboBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMunicipioCadastro: TfrmMunicipioCadastro;

implementation

{$R *.dfm}

end.
