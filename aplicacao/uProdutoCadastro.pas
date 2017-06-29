unit uProdutoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.CheckLst;

type
  TfrmProdutoCadastro = class(TfrmCadastroBase)
    cbCategoria: TComboBox;
    edtProduto: TLabeledEdit;
    cbUnidadeMedida: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPreco: TLabeledEdit;
    GroupBox1: TGroupBox;
    clkSabores: TCheckListBox;
    ckbSabor: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clkSaboresClick(Sender: TObject);
  private
    { Private declarations }
    bValidar: Boolean;
  public
    { Public declarations }
  end;

var
  frmProdutoCadastro: TfrmProdutoCadastro;

implementation

{$R *.dfm}

procedure TfrmProdutoCadastro.clkSaboresClick(Sender: TObject);
begin
  inherited;
  clkSabores.Checked[clkSabores.ItemIndex] := not(clkSabores.Checked[clkSabores.ItemIndex]);
end;

procedure TfrmProdutoCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  if (bValidar) then
    oInterfaceCadastroController.Pesquisar(Sender);
  bValidar := true;
end;

procedure TfrmProdutoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  bValidar := False;
end;

end.
