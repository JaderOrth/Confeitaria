unit uRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls;

type
  TfrmRel = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel1: TPanel;
    btnImprimir: TSpeedButton;
    btnProcessar: TSpeedButton;
    btnSair: TSpeedButton;
    s: TPageControl;
    tsFitro: TTabSheet;
    tsGrid: TTabSheet;
    src_listagem: TDataSource;
    FDMemTable_listagem: TFDMemTable;
    DBGridListagem: TDBGrid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

end.
