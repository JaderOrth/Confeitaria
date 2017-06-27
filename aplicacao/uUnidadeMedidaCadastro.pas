unit uUnidadeMedidaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmUnidadeMedidaCadastro = class(TfrmCadastroBase)
    edtDescricao: TLabeledEdit;
    edtSigla: TLabeledEdit;
    chkbDecimal: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnidadeMedidaCadastro: TfrmUnidadeMedidaCadastro;

implementation

{$R *.dfm}

end.
