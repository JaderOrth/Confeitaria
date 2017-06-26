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
    function Excluir(const aId: Integer;
      const aModel: IInterfacePedidoListagem): Boolean;
  end;

implementation

{ TPedidoListagemRegra }

function TPedidoListagemRegra.Excluir(const aId: Integer;
  const aModel: IInterfacePedidoListagem): Boolean;
begin
  Result := False;
 if (aId > 0) then
  Result := aModel.Excluir(aId);
end;

function TPedidoListagemRegra.MontarGrid(aMemTable: TFDMemTable;
  const aModel: IInterfacePedidoListagem): Boolean;
begin
  Result := aModel.MontarGrid(aMemTable);
end;

end.
