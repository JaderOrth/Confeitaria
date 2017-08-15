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
  uPedido in 'uPedido.pas' {frmPedido},
  uPedidoListagemController in 'uPedidoListagemController.pas',
  uPedidoCadastro in 'uPedidoCadastro.pas' {frmPedidoCadastro},
  uPedidoCadastroController in 'uPedidoCadastroController.pas',
  uPedidoDTO in 'uPedidoDTO.pas',
  uPedidoListagemRegra in 'uPedidoListagemRegra.pas',
  uPedidoListagemModel in 'uPedidoListagemModel.pas',
  uInterfacePedidoListagem in 'uInterfacePedidoListagem.pas',
  uPedidoCadastroRegra in 'uPedidoCadastroRegra.pas',
  uInterfacePedidoCadastroModel in 'uInterfacePedidoCadastroModel.pas',
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
  uSaborCadastroModel in 'uSaborCadastroModel.pas',
  uUnidadeMedida in 'uUnidadeMedida.pas' {frmUnidadeMedida},
  uUnidadeMedidaCadastro in 'uUnidadeMedidaCadastro.pas' {frmUnidadeMedidaCadastro},
  uUnidadeMedidaCadastroController in 'uUnidadeMedidaCadastroController.pas',
  uUnidadeMedidaDTO in 'uUnidadeMedidaDTO.pas',
  uUnidadeMedidaListagemController in 'uUnidadeMedidaListagemController.pas',
  uUnidadeMedidaListagemModel in 'uUnidadeMedidaListagemModel.pas',
  uUnidadeMedidaListagemRegra in 'uUnidadeMedidaListagemRegra.pas',
  uUnidadeMedidaCadastroRegra in 'uUnidadeMedidaCadastroRegra.pas',
  uInterfaceUnidadeMedidaCadastroModel in 'uInterfaceUnidadeMedidaCadastroModel.pas',
  uUnidadeMedidaCadastroModel in 'uUnidadeMedidaCadastroModel.pas',
  uProduto in 'uProduto.pas' {frmProduto},
  uProdutoListagemRegra in 'uProdutoListagemRegra.pas',
  uProdutoListagemModel in 'uProdutoListagemModel.pas',
  uInterfaceProdutoListagemModel in 'uInterfaceProdutoListagemModel.pas',
  uProdutoDTO in 'uProdutoDTO.pas',
  uProdutoCadastroController in 'uProdutoCadastroController.pas',
  uProdutoCadastro in 'uProdutoCadastro.pas' {frmProdutoCadastro},
  uProdutoListagemController in 'uProdutoListagemController.pas',
  uProdutoCadastroRegra in 'uProdutoCadastroRegra.pas',
  uProdutoCadastroModel in 'uProdutoCadastroModel.pas',
  uInterfaceProdutoCadastroModel in 'uInterfaceProdutoCadastroModel.pas',
  uCategoriaListaHash in 'uCategoriaListaHash.pas',
  uUnidadeMedidaListaHash in 'uUnidadeMedidaListaHash.pas',
  uSaborListaHash in 'uSaborListaHash.pas',
  uPedidoCadastroModel in 'uPedidoCadastroModel.pas',
  uProdutoListaHash in 'uProdutoListaHash.pas',
  uIntensPedidoDTO in 'uIntensPedidoDTO.pas',
  uITensPedidoListaHash in 'uITensPedidoListaHash.pas',
  uRel in 'uRel.pas' {frmRel},
  uInterfaceRel in 'uInterfaceRel.pas',
  uRelModel in 'uRelModel.pas',
  uRelController in 'uRelController.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  System.SysUtils,
  Vcl.Controls {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrOk then
   begin
      FreeAndNil(FrmLogin);
//      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.Run;
   end
   else
      Application.Terminate;
end.
