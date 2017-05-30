program confeitaria;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadastroBase in 'uCadastroBase.pas' {frmCadastroBase},
  uListagemBase in 'uListagemBase.pas' {frmListagemBase},
  uClassConexao in 'uClassConexao.pas',
  uClassConexaoSingleton in 'uClassConexaoSingleton.pas',
  uEstado in 'uEstado.pas' {frmEstado},
  uEstadoListagemModel in 'uEstadoListagemModel.pas',
  uEstadoDTO in 'uEstadoDTO.pas',
  uEstadoListagemRegra in 'uEstadoListagemRegra.pas',
  uInterfaceListagemController in 'uInterfaceListagemController.pas',
  uEstadoListagemController in 'uEstadoListagemController.pas',
  uEstadoCadastro in 'uEstadoCadastro.pas' {frmEstadoCadastro},
  uEstadoCadastroController in 'uEstadoCadastroController.pas',
  uInterfaceListagemModel in 'uInterfaceListagemModel.pas',
  uInterfaceCadastroController in 'uInterfaceCadastroController.pas',
  uEstadoCadastroRegra in 'uEstadoCadastroRegra.pas',
  uEstadoCadastroModel in 'uEstadoCadastroModel.pas',
  uInterfaceCadastroModel in 'uInterfaceCadastroModel.pas',
  uMunicipioListagemController in 'uMunicipioListagemController.pas',
  uMunicipio in 'uMunicipio.pas' {frmMunicipio},
  uMunicipioCadastro in 'uMunicipioCadastro.pas' {frmMunicipioCadastro},
  uMunicipioCadastroController in 'uMunicipioCadastroController.pas',
  uMunicipioListagemRegra in 'uMunicipioListagemRegra.pas',
  uMunicipioListagemModel in 'uMunicipioListagemModel.pas',
  uMunicipioDTO in 'uMunicipioDTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
