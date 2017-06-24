unit uBairroCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmBairroCadastro = class(TfrmCadastroBase)
    edtBairro: TLabeledEdit;
    cbEstado: TComboBox;
    cbMunicipio: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBairroCadastro: TfrmBairroCadastro;

implementation

{$R *.dfm}

procedure TfrmBairroCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  oInterfaceCadastroController.Pesquisar(Sender);
end;

end.
