unit uEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListagemBase, Data.DB, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Vcl.CheckLst;

type
  TfrmEstado = class(TfrmListagemBase)
    dbGridListagem: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmEstado: TfrmEstado;

implementation

//uses
 // uEstadoCadastro;

{$R *.dfm}

procedure TfrmEstado.btnEditarClick(Sender: TObject);
begin
  inherited;
 // oEstadoControler.CriarFormulario(Self, FDMemTable_listagem.FieldByName('ID').AsInteger);
end;

procedure TfrmEstado.btnNovoClick(Sender: TObject);
begin
  inherited;
//  oEstadoControler.CriarFormulario(Self, 0);
end;

procedure TfrmEstado.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //pesquisa um determinado campo desejado pelo usuário
//  oEstadoControler.BuscarGrid(FDMemTable_listagem, edtPesquisa.Text);
//  oEstadoControler.OrdenarGrid(dbGridListagem);
//  FDMemTable_listagem.Open;
end;

procedure TfrmEstado.FormActivate(Sender: TObject);
begin
  inherited;
//  oEstadoControler.MontarGrid(FDMemTable_listagem);
//  //define os tamanhos de cada coluna da grid
//  oEstadoControler.OrdenarGrid(dbGridListagem);
//  FDMemTable_listagem.Open;
end;

procedure TfrmEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  if (Assigned(oEstadoDTO)) then
//  begin
//    FreeAndNil(oEstadoDTO);
//  end;
//
//  if (Assigned(oEstadoControler)) then
//  begin
//    FreeAndNil(oEstadoControler);
//  end;
//
//  Action := caFree;
//  frmEstado := nil;
end;

end.
