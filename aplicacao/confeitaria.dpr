program confeitaria;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadastroBase in 'uCadastroBase.pas' {frmCadastroBase},
  uListagemBase in 'uListagemBase.pas' {frmListagemBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroBase, frmCadastroBase);
  Application.CreateForm(TfrmListagemBase, frmListagemBase);
  Application.Run;
end.
