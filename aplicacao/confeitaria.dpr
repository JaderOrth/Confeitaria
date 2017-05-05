program confeitaria;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadastroBase in 'uCadastroBase.pas' {frmCadastroBase},
  uListagemBase in 'uListagemBase.pas' {frmListagemBase},
  uClassConexao in 'uClassConexao.pas',
  uClassConexaoSingleton in 'uClassConexaoSingleton.pas',
  uEstado in 'uEstado.pas' {frmEstado},
  uEstadoController in 'uEstadoController.pas',
  uEstadoModel in 'uEstadoModel.pas',
  uEstadoCadastro in 'uEstadoCadastro.pas' {frmEstadoCadastro},
  uEstadoDTO in 'uEstadoDTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
