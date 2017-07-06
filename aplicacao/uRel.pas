unit uRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, frxClass, frxDBSet, uInterfaceRel;

type
  TfrmRel = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    s: TPageControl;
    tsFitro: TTabSheet;
    src_listagem: TDataSource;
    FDMemTable_listagem: TFDMemTable;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    cbEstado: TComboBox;
    cbMunicipio: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    cbProduto: TComboBox;
    Label7: TLabel;
    cbCliente: TComboBox;
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDMemTable_listagemidpedido: TIntegerField;
    FDMemTable_listagemdata_pedido: TDateField;
    FDMemTable_listagemtotal_pedido: TFloatField;
    FDMemTable_listagemvalor_total_itens: TFloatField;
    FDMemTable_listagemproduto: TStringField;
    FDMemTable_listagempreco: TFloatField;
    FDMemTable_listagemcategoria: TStringField;
    FDMemTable_listagemsigla: TStringField;
    FDMemTable_listagemnome: TStringField;
    FDMemTable_listagemtelefone: TStringField;
    FDMemTable_listagemcelular: TStringField;
    FDMemTable_listagemmunicipio: TStringField;
    FDMemTable_listagemestado: TStringField;
    btnProcessar: TSpeedButton;
    DBGridListagem: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbClienteEnter(Sender: TObject);
    procedure cbEstadoEnter(Sender: TObject);
    procedure cbMunicipioEnter(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oBase: IInterfaceRel;
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

procedure TfrmRel.btnImprimirClick(Sender: TObject);
begin
  oBase.Relatorio(Sender);
end;

procedure TfrmRel.btnProcessarClick(Sender: TObject);
begin
  oBase.MontarGrid(Sender);
end;

procedure TfrmRel.btnSairClick(Sender: TObject);
begin
  oBase.CloseForm(Sender);
end;

procedure TfrmRel.cbClienteEnter(Sender: TObject);
begin
  oBase.ComboBoxCliente(Sender);
end;

procedure TfrmRel.cbEstadoEnter(Sender: TObject);
begin
  oBase.ComboBoxEstado(Sender);
end;

procedure TfrmRel.cbMunicipioEnter(Sender: TObject);
begin
  oBase.ComboBoxMunicipio(Sender);
end;

procedure TfrmRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
