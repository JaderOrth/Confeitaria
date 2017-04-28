unit uListagemBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

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
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    RadioButton2: TRadioButton;
    StatusBar1: TStatusBar;
    btnAjuda: TSpeedButton;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
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
  DBGrid1.SetFocus;
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
