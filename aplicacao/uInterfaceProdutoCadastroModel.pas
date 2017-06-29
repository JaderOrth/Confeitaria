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
  end;

implementation

end.
