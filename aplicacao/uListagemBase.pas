unit uListagemBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uInterfaceListagemController, uPrincipal;

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
    src_listagem: TDataSource;
    FDMemTable_listagem: TFDMemTable;
    btnExcluir: TSpeedButton;
    DBGridListagem: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAjudaClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridListagemDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    bGrid: Boolean;
  public
    { Public declarations }
    oListagemBase: IInterfaceListagemController;
    bClick: Boolean;
  end;

implementation

{$R *.dfm}

procedure TfrmListagemBase.btnAjudaClick(Sender: TObject);
begin
  oListagemBase.Help(Sender);
end;

procedure TfrmListagemBase.btnEditarClick(Sender: TObject);
begin
  oListagemBase.CreateFormEdit(Sender, FDMemTable_listagem);
end;

procedure TfrmListagemBase.btnExcluirClick(Sender: TObject);
begin
  oListagemBase.Excluir(FDMemTable_listagem);
end;

procedure TfrmListagemBase.btnNovoClick(Sender: TObject);
begin
  oListagemBase.ControlerCadastro(Sender);
end;

procedure TfrmListagemBase.btnSairClick(Sender: TObject);
begin
  oListagemBase.CloseForm(Sender);
end;

procedure TfrmListagemBase.DBGridListagemDblClick(Sender: TObject);
begin
  if (bClick) then
    btnEditarClick(Sender);
end;

procedure TfrmListagemBase.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  oListagemBase.BuscarGrid(FDMemTable_listagem, edtPesquisa.Text);
end;

procedure TfrmListagemBase.FormActivate(Sender: TObject);
begin
  if (bGrid) then
  begin
    oListagemBase.MontarGrid(FDMemTable_listagem)
  end;
  bGrid := true;
end;

procedure TfrmListagemBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmListagemBase.FormCreate(Sender: TObject);
begin
  bGrid := false;
  Self.Width :=
  Self.Height :=
end;

end.
