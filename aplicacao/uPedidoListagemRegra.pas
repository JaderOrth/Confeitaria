unit uPedidoListagemRegra;

interface
uses
  FireDAC.Comp.Client,
  uInterfacePedidoListagem;

type
  TPedidoListagemRegra = class
  public
    function MontarGrid(aMemTable: TFDMemTable;
      const aModel: IInterfacePedidoListagem): Boolean;
  end;

implementation

{ TPedidoListagemRegra }

function TPedidoListagemRegra.MontarGrid(aMemTable: TFDMemTable;
  const aModel: IInterfacePedidoListagem): Boolean;
begin
  Result := aModel.MontarGrid(aMemTable);
end;

end.
