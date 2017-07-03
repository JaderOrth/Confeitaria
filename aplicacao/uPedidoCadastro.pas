unit uPedidoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompListbox, Vcl.CheckLst, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPedidoCadastro = class(TfrmCadastroBase)
    PageControlPedido: TPageControl;
    tsPedido: TTabSheet;
    tsItensPedido: TTabSheet;
    fdMemTable: TFDMemTable;
    DataSource: TDataSource;
    fdMemTableidproduto: TIntegerField;
    fdMemTablequantidade: TFloatField;
    fdMemTableobservacao: TStringField;
    fdMemTableproduto: TStringField;
    fdMemTablevalorTotal: TCurrencyField;
    GroupBox1: TGroupBox;
    cbEstado: TComboBox;
    cbMunicipio: TComboBox;
    cbBairro: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    edtResponsavelPedido: TLabeledEdit;
    Label10: TLabel;
    cbCliente: TComboBox;
    edtEnderecoEntrega: TLabeledEdit;
    edtNumeroEntrega: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    dtDataEntrega: TDateTimePicker;
    dtDataPedido: TDateTimePicker;
    dtHoraEntrega: TDateTimePicker;
    Label2: TLabel;
    mObservacao: TMemo;
    xx: TLabel;
    edtTotalPedido: TLabeledEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    cbProduto: TComboBox;
    edtQuantidade: TLabeledEdit;
    edtValor: TLabeledEdit;
    mObservacaoItensPedido: TMemo;
    Label8: TLabel;
    GroupSabores: TGroupBox;
    clkSabores: TCheckListBox;
    dbItensListagem: TDBGrid;
    SpeedButton1: TSpeedButton;
    btnNovoItens: TSpeedButton;
    btnSalvarItens: TSpeedButton;
    btnEditarItens: TSpeedButton;
    btnExcluiItens: TSpeedButton;
    procedure clkSaboresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCadastro: TfrmPedidoCadastro;

implementation

{$R *.dfm}

procedure TfrmPedidoCadastro.clkSaboresClick(Sender: TObject);
begin
  inherited;
  clkSabores.Checked[clkSabores.ItemIndex] := not(clkSabores.Checked[clkSabores.ItemIndex]);
end;

end.
