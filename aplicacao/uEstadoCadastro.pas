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
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oEstadoDTO :  TEstadoDTO;
    oEstadoController : TEstadoController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AIDEstado: Integer);
  end;

var
  frmEstadoCadastro: TfrmEstadoCadastro;

implementation

uses
  uEstado;

{$R *.dfm}

procedure TfrmEstadoCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  oEstadoDTO.ID := StrToIntDef(edtID.Text,0);
  if oEstadoController.Excluir(oEstadoDTO) = True then
  begin
    Close;
  end;
end;

procedure TfrmEstadoCadastro.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtEstado.SetFocus;
end;

procedure TfrmEstadoCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;
  oEstadoDTO.Descricao := edtEstado.Text;
  oEstadoDTO.UF := edtSigla.Text;
  oEstadoController.Salvar(oEstadoDTO);
  edtID.Text := IntToStr(oEstadoDTO.ID);
  oEstadoController.LimparDTO(oEstadoDTO);
end;

constructor TfrmEstadoCadastro.Create(AOwner: TComponent; AIDEstado: Integer);
begin
  inherited Create(AOwner);

  oEstadoDTO := TEstadoDTO.Create;

  oEstadoDTO.ID := AIDEstado;

  (Owner as TForm).Enabled := False;
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

  (Owner as TForm).Enabled := True;

  Action := caFree;
  frmEstadoCadastro := nil;
end;

procedure TfrmEstadoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  oEstadoController := TEstadoController.Create;
end;

procedure TfrmEstadoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  if oEstadoDTO.ID > 0 then
  begin
    //////////////////////////////////////////////////////////////////////////
  end;
end;

end.
