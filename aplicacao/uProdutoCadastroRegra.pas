unit uProdutoCadastroRegra;

interface
uses
  System.SysUtils,
  uInterfaceProdutoCadastroModel, uProdutoDTO, uUnidadeMedidaListaHash,
  uInterfaceUnidadeMedidaListagemModel, uCategoriaListaHash,
  uInterfaceCategoriaListagemModel;

type
  TProdutoCadastroRegra = class
  public
     procedure LimparDTO(aProdutoDTO: TProdutoDTO);
     function ComboBoxUnidadeMedida(var aLista: TUnidadeMedidaListaHash;
      const aModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
     function ComboBoxCategoria(var aLista: TCategoriaListaHash;
      const aModel: IInterfaceCategoriasListagemModel): Boolean;

  end;

implementation

{ TProdutoCadastroRegra }

function TProdutoCadastroRegra.ComboBoxCategoria(
  var aLista: TCategoriaListaHash;
  const aModel: IInterfaceCategoriasListagemModel): Boolean;
begin
  Result := aModel.ComboBoxCategoria(aLista);
end;

function TProdutoCadastroRegra.ComboBoxUnidadeMedida(
  var aLista: TUnidadeMedidaListaHash;
  const aModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
begin
  Result := aModel.ComboBoxUnidadeMedida(aLista);
end;

procedure TProdutoCadastroRegra.LimparDTO(aProdutoDTO: TProdutoDTO);
begin
  aProdutoDTO.idProduto := 0;
  aProdutoDTO.descricao := EmptyStr;
  aProdutoDTO.preco := 0;
  aProdutoDTO.sabor := EmptyStr;
  aProdutoDTO.idCategoria := 0;
  aProdutoDTO.unidadeMedida:= 0;
end;

end.
