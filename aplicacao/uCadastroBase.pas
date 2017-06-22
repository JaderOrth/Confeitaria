unit uCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls,
  uInterfaceCadastroController;

type
  TfrmCadastroBase = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnSair: TSpeedButton;
    panelCadastro: TPanel;
    btnNovo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oInterfaceCadastroController: IInterfaceCadastroController;
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.btnNovoClick(Sender: TObject);
var
  iIndiceComponente: Integer;
begin
  oInterfaceCadastroController.Novo(Sender);

  for iIndiceComponente := 0 to pred(Self.ComponentCount) do
  begin
    if (Components[iIndiceComponente] is TLabeledEdit) or
       (Components[iIndiceComponente] is TEdit) then
      (Components[iIndiceComponente] as TCustomEdit).Clear;

    if (Components[iIndiceComponente] is TComboBox) then
      (Components[iIndiceComponente] as TComboBox).ItemIndex := -1;

    if (Components[iIndiceComponente] is TMemo) then
      (Components[iIndiceComponente] as TMemo).Clear;
  end;
end;

procedure TfrmCadastroBase.btnSairClick(Sender: TObject);
begin
  oInterfaceCadastroController.CloseFormCadastro(Sender);
end;

procedure TfrmCadastroBase.btnSalvarClick(Sender: TObject);
begin
  oInterfaceCadastroController.Salvar(Sender);
end;

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  if (Owner is TForm) then
    (Owner as TForm).Enabled := False;
end;

procedure TfrmCadastroBase.FormDestroy(Sender: TObject);
begin
  if (Owner is TForm) then
    (Owner as TForm).Enabled := True;
end;

end.
