unit uProdutoCadastroRegra;

interface
uses
  System.SysUtils,
  uInterfaceProdutoCadastroModel, uProdutoDTO;

type
  TProdutoCadastroRegra = class
  public
     procedure LimparDTO(aProdutoDTO: TProdutoDTO);
  end;

implementation

end.
