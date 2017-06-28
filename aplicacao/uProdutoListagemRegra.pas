unit uProdutoListagemRegra;

interface
uses
  FireDAC.Comp.Client,
  uInterfaceProdutoListagemModel,uProdutoDTO;

type
  TProdutoListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceProdutoListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceProdutoListagemModel): Boolean;
  end;
implementation

{ TProdutoListagemRegra }

function TProdutoListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceProdutoListagemModel): Boolean;
begin

end;

function TProdutoListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceProdutoListagemModel): Boolean;
begin

end;

end.
