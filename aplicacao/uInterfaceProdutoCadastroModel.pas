unit uInterfaceProdutoCadastroModel;

interface

uses
  uProdutoDTO;
type
  IInterfaceProdutoCadastroModel = interface
    function BuscarID: Integer;
    function Update(const aProdutoDTO: TProdutoDTO): Boolean;
    function Insert(const aProdutoDTO: TProdutoDTO): Boolean;
    function BuscarUpdate(var aProdutoDTO: TProdutoDTO): Boolean;
    function SalvarCheck(const aCheck: array of integer;
      const aIdProduto: Integer): Boolean;
    function RetornarIdSAbor(var aSabor: TArray<Integer>;
      const aId: Integer): Boolean;
    function ExcluiCheck(const aId: Integer): Boolean;
  end;

implementation

end.
