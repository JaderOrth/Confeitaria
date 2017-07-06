unit uClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.StdCtrls;

type
  TfrmCadastroCliente = class(TfrmCadastroBase)
    Label4: TLabel;
    edtObservacao: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtEndereco: TLabeledEdit;
    cbEstado: TComboBox;
    Label1: TLabel;
    cbMunicipio: TComboBox;
    Label2: TLabel;
    cbBairro: TComboBox;
    Label3: TLabel;
    edtNumero: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCPFCNPJ: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    edtCelular: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

end.
