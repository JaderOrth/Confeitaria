unit uProdutoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmProdutoCadastro = class(TfrmCadastroBase)
    cbCategoria: TComboBox;
    edtProduto: TLabeledEdit;
    cbUnidadeMedida: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPreco: TLabeledEdit;
    chkbSabores: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoCadastro: TfrmProdutoCadastro;

implementation

{$R *.dfm}

end.
