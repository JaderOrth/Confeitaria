unit uProdutoCadastroRegra;

interface
uses
  System.SysUtils,
  uInterfaceProdutoCadastroModel, uProdutoDTO, uUnidadeMedidaListaHash,
  uInterfaceUnidadeMedidaListagemModel, uCategoriaListaHash,
  uInterfaceCategoriaListagemModel, uSaborListaHash,
  uInterfaceSaborListagemModel;

type
  TProdutoCadastroRegra = class
  public
     procedure LimparDTO(aProdutoDTO: TProdutoDTO);
     function ComboBoxUnidadeMedida(var aLista: TUnidadeMedidaListaHash;
      const aModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
     function ComboBoxCategoria(var aLista: TCategoriaListaHash;
      const aModel: IInterfaceCategoriasListagemModel): Boolean;
     function Validar(const aProdutoDTO: TProdutoDTO): integer;
     function Salvar(const aProdutoDTO: TProdutoDTO;
      const aModel: IInterfaceProdutoCadastroModel): integer;
     function CheckSabor(var aLista: TSaborListaHash;
      const aModel: IInterfaceSaborListagemModel): Boolean;
     function BuscarUpdate(var aProdutoDTO: TProdutoDTO;
      const aModel: IInterfaceProdutoCadastroModel): Boolean;
     function ValidarSabor(const Sabor: String): Boolean;
  end;

implementation

{ TProdutoCadastroRegra }

function TProdutoCadastroRegra.BuscarUpdate(var aProdutoDTO: TProdutoDTO;
  const aModel: IInterfaceProdutoCadastroModel): Boolean;
begin
  Result := aModel.BuscarUpdate(aProdutoDTO);
end;

function TProdutoCadastroRegra.CheckSabor(var aLista: TSaborListaHash;
  const aModel: IInterfaceSaborListagemModel): Boolean;
begin
  Result := aModel.CheckSabor(aLista);
end;

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

function TProdutoCadastroRegra.Salvar(const aProdutoDTO: TProdutoDTO;
  const aModel: IInterfaceProdutoCadastroModel): integer;
begin
  Result := 0;
  if (aProdutoDTO.idProduto > 0) then
  begin
    if (not(aModel.Update(aProdutoDTO))) then
    begin
      Result := 1;
      exit;
    end;
  end
  else
  begin
    aProdutoDTO.idProduto := aModel.BuscarID;
    if (not(aModel.Insert(aProdutoDTO))) then
    begin
      Result := 2;
      exit;
    end;
  end;
end;

function TProdutoCadastroRegra.Validar(const aProdutoDTO: TProdutoDTO): integer;
begin
  Result := 0;
  if (Trim(aProdutoDTO.descricao).IsEmpty) then
  begin
    Result := 1;
    exit;
  end;

  if (aProdutoDTO.idCategoria = -1) then
  begin
    Result := 2;
    exit;
  end;

  if (aProdutoDTO.unidadeMedida = -1) then
  begin
    Result := 3;
    exit;
  end;

   if (aProdutoDTO.preco = 0)  then
  begin
    Result := 4;
    exit;
  end;
end;

function TProdutoCadastroRegra.ValidarSabor(const Sabor: String): Boolean;
begin
  if (Sabor = 'S') then
  begin
    Result := True;
    exit;
  end;
  if (Sabor = 'N') then
  begin
    Result := False;
    exit;
  end;

end;

end.
