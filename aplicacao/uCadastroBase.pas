unit uCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroBase = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    panelCadastro: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparFormulario;
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.btnNovoClick(Sender: TObject);
begin
  LimparFormulario;
  btnNovo.Enabled := False;
end;

procedure TfrmCadastroBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroBase.LimparFormulario;
var
  iIndiceComponente: Integer;
begin
  for iIndiceComponente := 0 to pred(Self.ComponentCount) do
  begin
    if (Components[iIndiceComponente] is TLabeledEdit) or
       (Components[iIndiceComponente] is TEdit) then
      (Components[iIndiceComponente] as TCustomEdit).Clear;

    if (Components[iIndiceComponente] is TComboBox) then
      (Components[iIndiceComponente] as TComboBox).ItemIndex := -1;
  end;
end;
end.
