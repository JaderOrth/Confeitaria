unit uPedidoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmPedidoCadastro = class(TfrmCadastroBase)
    DateTimePicker1: TDateTimePicker;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    LabeledEdit2: TLabeledEdit;
    ComboBox2: TComboBox;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCadastro: TfrmPedidoCadastro;

implementation

{$R *.dfm}

end.
