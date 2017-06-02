unit uEstadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmEstadoCadastro = class(TfrmCadastroBase)
    edtEstado: TLabeledEdit;
    edtSigla: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uEstado;

{$R *.dfm}

end.
