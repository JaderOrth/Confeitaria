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
  uMunicipioDTO in 'uMunicipioDTO.pas',
  uMunicipioCadastroRegra in 'uMunicipioCadastroRegra.pas',
  uMunicipioCadastroModel in 'uMunicipioCadastroModel.pas',
  uInterfaceMunicipioModel in 'uInterfaceMunicipioModel.pas',
  uInterfaceMunicipioListagemModel in 'uInterfaceMunicipioListagemModel.pas',
  uEstadoListaHash in 'uEstadoListaHash.pas',
  uBairro in 'uBairro.pas' {frmBairro},
  uBairroListagemController in 'uBairroListagemController.pas',
  uBairroCadastroController in 'uBairroCadastroController.pas',
  uBairroCadastro in 'uBairroCadastro.pas' {frmBairroCadastro},
  uBairroListagemRegra in 'uBairroListagemRegra.pas',
  uBairroListagemModel in 'uBairroListagemModel.pas',
  uInterfaceBairroListagemModel in 'uInterfaceBairroListagemModel.pas',
  uBairroDTO in 'uBairroDTO.pas',
  uBairroCadastroRegra in 'uBairroCadastroRegra.pas',
  uBairroCadastroModel in 'uBairroCadastroModel.pas',
  uInterfaceBairroCadastroModel in 'uInterfaceBairroCadastroModel.pas',
  uMunicipioListaHash in 'uMunicipioListaHash.pas',
  uClienteListagemController in 'uClienteListagemController.pas',
  uClienteListagemRegra in 'uClienteListagemRegra.pas',
  uClienteListagemModel in 'uClienteListagemModel.pas',
  uClienteDTO in 'uClienteDTO.pas',
  uCliente in 'uCliente.pas' {frmCliente},
  uClienteCadastro in 'uClienteCadastro.pas' {frmCadastroCliente},
  uClienteCadastroController in 'uClienteCadastroController.pas',
  uInterfaceClienteModel in 'uInterfaceClienteModel.pas',
  uClienteCadastroRegra in 'uClienteCadastroRegra.pas',
  uClienteCadastroModel in 'uClienteCadastroModel.pas',
  uInterfaceClienteCadastroModel in 'uInterfaceClienteCadastroModel.pas',
  uClienteListaHash in 'uClienteListaHash.pas',
  uBairroListaHash in 'uBairroListaHash.pas',
  uUsuario in 'uUsuario.pas' {frmUsuario},
  uUsuarioListagemController in 'uUsuarioListagemController.pas',
  uUsuarioCadastro in 'uUsuarioCadastro.pas' {frmUsuarioCadastro},
  uUsuarioCadastroController in 'uUsuarioCadastroController.pas',
  uUsuarioDTO in 'uUsuarioDTO.pas',
  uUsuarioListagemRegra in 'uUsuarioListagemRegra.pas',
  uUsuarioListagemModel in 'uUsuarioListagemModel.pas',
  uInterfaceUsuarioListagemModel in 'uInterfaceUsuarioListagemModel.pas',
  uUsuarioCadastroRegra in 'uUsuarioCadastroRegra.pas',
  uUsuarioCadastroModel in 'uUsuarioCadastroModel.pas',
  uInterfaceUsuarioCadastroModel in 'uInterfaceUsuarioCadastroModel.pas',
  uCategorias in 'uCategorias.pas' {frmCategorias},
  uCategoriasListagemController in 'uCategoriasListagemController.pas',
  uCategoriasListagemRegra in 'uCategoriasListagemRegra.pas',
  uCategoriasListagemModel in 'uCategoriasListagemModel.pas',
  uInterfaceCategoriaListagemModel in 'uInterfaceCategoriaListagemModel.pas',
  uCategoriasDTO in 'uCategoriasDTO.pas',
  uCategoriasCadastroController in 'uCategoriasCadastroController.pas',
  uCategoriasCadastroModel in 'uCategoriasCadastroModel.pas',
  uCategoriasCadastroRegra in 'uCategoriasCadastroRegra.pas',
  uInterfaceCategoriaCadastroModel in 'uInterfaceCategoriaCadastroModel.pas',
  uCategoriasCadastro in 'uCategoriasCadastro.pas' {frmCategoriasCadastro},
  uSabor in 'uSabor.pas' {frmSabor},
  uSaborListagemController in 'uSaborListagemController.pas',
  uInterfaceSaborListagemModel in 'uInterfaceSaborListagemModel.pas',
  uSaborDTO in 'uSaborDTO.pas',
  uSaborListagemRegra in 'uSaborListagemRegra.pas',
  uSaborListagemModel in 'uSaborListagemModel.pas',
  uSaborCadastroController in 'uSaborCadastroController.pas',
  uSaborCadastro in 'uSaborCadastro.pas' {frmSaborCadastro},
  uSaborCadastroRegra in 'uSaborCadastroRegra.pas',
  uInterfaceSaborCadastroModel in 'uInterfaceSaborCadastroModel.pas',
  uSaborCadastroModel in 'uSaborCadastroModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
