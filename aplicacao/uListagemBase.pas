unit uListagemBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uInterfaceListagemController;

type
  TfrmListagemBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    edtPesquisa: TEdit;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    btnAjuda: TSpeedButton;
    src_listagem: TDataSource;
    FDMemTable_listagem: TFDMemTable;
    btnExcluir: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAjudaClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oListagemBase: IInterfaceListagemController;
  end;

implementation

{$R *.dfm}

procedure TfrmListagemBase.btnAjudaClick(Sender: TObject);
begin
  oListagemBase.Help(Sender);
end;

procedure TfrmListagemBase.btnNovoClick(Sender: TObject);
begin
  oListagemBase.ControlerCadastro(Sender);
end;

procedure TfrmListagemBase.btnSairClick(Sender: TObject);
begin
  oListagemBase.CloseForm(Sender);
end;

procedure TfrmListagemBase.DBGrid1Enter(Sender: TObject);
begin
   oListagemBase.MontarGrid(FDMemTable_listagem);
end;

//oListagemBase.MontarGrid(FDMemTable_listagem);
procedure TfrmListagemBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

end.
