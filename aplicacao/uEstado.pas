unit uEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListagemBase, Data.DB, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uEstadoController, uEstadoDTO;

type
  TfrmEstado = class(TfrmListagemBase)
    dbGridListagem: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbGridListagemDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    oEstadoDTO: TEstadoDTO;
    oEstadoControler: TEstadoController;
  public
    { Public declarations }

  end;

var
  frmEstado: TfrmEstado;

implementation

{$R *.dfm}

procedure TfrmEstado.btnEditarClick(Sender: TObject);
begin
  inherited;
  oEstadoControler.CriarFormulario(Self, FDMemTable_listagem.FieldByName('ID').AsInteger);
end;

procedure TfrmEstado.btnNovoClick(Sender: TObject);
begin
  inherited;
  oEstadoControler.CriarFormulario(Self, 0);
end;

procedure TfrmEstado.dbGridListagemDblClick(Sender: TObject);
begin
  inherited;
  btnEditarClick(Sender);
end;

procedure TfrmEstado.FormActivate(Sender: TObject);
begin
  inherited;
  oEstadoControler.MontarGrid(FDMemTable_listagem);
  FDMemTable_listagem.Open;

  oEstadoControler.OrdenarGrid(dbGridListagem);
  //define os tamanhos de cada coluna da grid
 { dbGridListagem.Columns[0].Width := 40;
  dbGridListagem.Columns[0].Title.Alignment := taCenter;
  dbGridListagem.Columns[1].Width := 260;
  dbGridListagem.Columns[1].Title.Alignment := taCenter;
  dbGridListagem.Columns[2].Width := 50;
  dbGridListagem.Columns[2].Title.Alignment := taCenter; }
end;

procedure TfrmEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (Assigned(oEstadoDTO)) then
  begin
    FreeAndNil(oEstadoDTO);
  end;

  if (Assigned(oEstadoControler)) then
  begin
    FreeAndNil(oEstadoControler);
  end;

  Action := caFree;
  frmEstado := nil;
end;

procedure TfrmEstado.FormCreate(Sender: TObject);
begin
  inherited;
  oEstadoDTO := TEstadoDTO.Create;
  oEstadoControler := TEstadoController.Create;

  {oEstadoControler.MontarGrid(FDMemTable_listagem);
  FDMemTable_listagem.Open;

  //define os tamanhos de cada coluna da grid
  dbGridListagem.Columns[0].Width := 40;
  dbGridListagem.Columns[0].Title.Alignment := taCenter;
  dbGridListagem.Columns[1].Width := 260;
  dbGridListagem.Columns[1].Title.Alignment := taCenter;
  dbGridListagem.Columns[2].Width := 50;
  dbGridListagem.Columns[2].Title.Alignment := taCenter; }
end;

end.
