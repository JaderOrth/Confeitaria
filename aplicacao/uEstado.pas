unit uEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListagemBase, Data.DB, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  uEstadoController, uEstadoDTO;

type
  TfrmEstado = class(TfrmListagemBase)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

uses
  uEstadoCadastro;
{$R *.dfm}

procedure TfrmEstado.btnEditarClick(Sender: TObject);
begin
  inherited;
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(Application);
  frmEstadoCadastro.ShowModal;
end;

procedure TfrmEstado.btnNovoClick(Sender: TObject);
begin
  inherited;
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(Application);
  frmEstadoCadastro.ShowModal;
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
end;

end.
