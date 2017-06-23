unit uClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.StdCtrls;

type
  TfrmCadastroCliente = class(TfrmCadastroBase)
    edtNome: TLabeledEdit;
    edtCPFCNPJ: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtCelular: TLabeledEdit;
    cbEstado: TComboBox;
    cbMunicipio: TComboBox;
    cbBairro: TComboBox;
    edtTelefone: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtObservacao: TMemo;
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
