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
      const aCheck: array of integer;
      const aModel: IInterfaceProdutoCadastroModel): integer;
    function CheckSabor(var aLista: TSaborListaHash;
      const aModel: IInterfaceSaborListagemModel): Boolean;
    function BuscarUpdate(var aProdutoDTO: TProdutoDTO;
      const aModel: IInterfaceProdutoCadastroModel): Boolean;
    function ValidarSabor(const Sabor: String): Boolean;
    function RetornarIdSAbor(var aSabor: TArray<integer>; const aId: integer;
      const aModel: IInterfaceProdutoCadastroModel): Boolean;
    function ExcluirSabores(const aId: integer;
      const aModel: IInterfaceProdutoCadastroModel): Boolean;
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

function TProdutoCadastroRegra.ComboBoxCategoria
  (var aLista: TCategoriaListaHash;
  const aModel: IInterfaceCategoriasListagemModel): Boolean;
begin
  Result := aModel.ComboBoxCategoria(aLista);
end;

function TProdutoCadastroRegra.ComboBoxUnidadeMedida
  (var aLista: TUnidadeMedidaListaHash;
  const aModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
begin
  Result := aModel.ComboBoxUnidadeMedida(aLista);
end;

function TProdutoCadastroRegra.ExcluirSabores(const aId: integer;
  const aModel: IInterfaceProdutoCadastroModel): Boolean;
begin
  Result := aModel.ExcluiCheck(aId);
end;

procedure TProdutoCadastroRegra.LimparDTO(aProdutoDTO: TProdutoDTO);
begin
  aProdutoDTO.idProduto := 0;
  aProdutoDTO.descricao := EmptyStr;
  aProdutoDTO.preco := EmptyStr;
  aProdutoDTO.Sabor := EmptyStr;
  aProdutoDTO.idCategoria := 0;
  aProdutoDTO.unidadeMedida := 0;
end;

function TProdutoCadastroRegra.RetornarIdSAbor(var aSabor: TArray<integer>;
  const aId: integer; const aModel: IInterfaceProdutoCadastroModel): Boolean;
begin
  Result := aModel.RetornarIdSAbor(aSabor, aId);
end;

function TProdutoCadastroRegra.Salvar(const aProdutoDTO: TProdutoDTO;
  const aCheck: array of integer;
  const aModel: IInterfaceProdutoCadastroModel): integer;
begin
  Result := 0;
  // Editar
  if (aProdutoDTO.idProduto > 0) then
  begin
    // salva o produto
    if (aModel.Update(aProdutoDTO)) then
    begin
      if (Length(aCheck) <> 0) then
      begin
        // excluir do banco tudo o sabor que esta salvo com o idProduto
        aModel.ExcluiCheck(aProdutoDTO.idProduto);
        // salva todo os registro novamenete
        if (not(aModel.SalvarCheck(aCheck, aProdutoDTO.idProduto))) then
        begin
          Result := 2;
          exit;
        end;
      end;
    end
    else
    begin
      Result := 1;
      exit;
    end;
  end;

  // Salvar
  if (aProdutoDTO.idProduto = 0) then
  begin
    aProdutoDTO.idProduto := aModel.BuscarID;
    if (aModel.Insert(aProdutoDTO)) then
    begin
      if (Length(aCheck) <> 0) then
      begin
        if (not(aModel.SalvarCheck(aCheck, aProdutoDTO.idProduto))) then
        begin
          Result := 4;
          exit;
        end;
      end;
    end
    else
    begin
      Result := 3;
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

  if (aProdutoDTO.preco = '') then
  begin
    Result := 4;
    exit;
  end;
end;

function TProdutoCadastroRegra.ValidarSabor(const Sabor: String): Boolean;
begin
  Result := False;
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
