unit uEstadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uEstadoDTO, uEstadoController;

type
  TfrmEstadoCadastro = class(TfrmCadastroBase)
    edtID: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtSigla: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    oEstadoDTO :  TEstadoDTO;
    oEstadoController : TEstadoController;
  public
    { Public declarations }
  end;

var
  frmEstadoCadastro: TfrmEstadoCadastro;

implementation

{$R *.dfm}

procedure TfrmEstadoCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;
  oEstadoDTO.Descricao := edtEstado.Text;
  oEstadoDTO.UF := edtSigla.Text;
  oEstadoController.Salvar(oEstadoDTO);
end;

procedure TfrmEstadoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if Assigned(oEstadoDTO) then
  begin
    FreeAndNil(oEstadoDTO);
  end;

  if Assigned(oEstadoController) then
  begin
    FreeAndNil(oEstadoController);
  end;

  Action := caFree;
  frmEstadoCadastro := nil;
end;

procedure TfrmEstadoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  oEstadoDTO := TEstadoDTO.Create;
  oEstadoController := TEstadoController.Create;
end;

end.
