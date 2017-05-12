unit uListagemBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListagemBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    edtPesquisa: TEdit;
    Panel3: TPanel;
    btnPesquisa: TBitBtn;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    btnAjuda: TSpeedButton;
    src_listagem: TDataSource;
    FDMemTable_listagem: TFDMemTable;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemBase: TfrmListagemBase;

implementation

{$R *.dfm}

procedure TfrmListagemBase.btnPesquisaClick(Sender: TObject);
begin
//
end;

procedure TfrmListagemBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemBase.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btnPesquisaClick(Sender);
  end;
end;

end.
