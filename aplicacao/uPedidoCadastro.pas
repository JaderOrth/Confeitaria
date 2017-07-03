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
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    xx: TLabel;
    dtDataHoraEntrega: TDateTimePicker;
    cbEstado: TComboBox;
    dtDataPedido: TDateTimePicker;
    edtTotalPedido: TLabeledEdit;
    edtResponsavelPedido: TLabeledEdit;
    edtEnderecoEntrega: TLabeledEdit;
    cbMunicipio: TComboBox;
    edtNumeroEntrega: TLabeledEdit;
    mObservacao: TMemo;
    cbBairro: TComboBox;
    edtComplemento: TLabeledEdit;
    tsItensPedido: TTabSheet;
    cbProduto: TComboBox;
    Label7: TLabel;
    edtQuantidade: TLabeledEdit;
    edtValor: TLabeledEdit;
    mObservacaoItensPedido: TMemo;
    Label8: TLabel;
    btnSalvarItens: TButton;
    btnEditarItens: TButton;
    btnExcluiItens: TButton;
    dbItensListagem: TDBGrid;
    fdMemTable: TFDMemTable;
    DataSource: TDataSource;
    fdMemTableidproduto: TIntegerField;
    fdMemTablequantidade: TFloatField;
    fdMemTableobservacao: TStringField;
    fdMemTableproduto: TStringField;
    cbCliente: TComboBox;
    Label10: TLabel;
    fdMemTablevalorTotal: TCurrencyField;
    btnNovoItens: TButton;
    GroupSabores: TGroupBox;
    clkSabores: TCheckListBox;
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
