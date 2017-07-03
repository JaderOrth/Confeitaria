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
      const AModel: IInterfaceProdutoListagemModel): Integer;
  end;
implementation

{ TProdutoListagemRegra }

function TProdutoListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceProdutoListagemModel): Integer;
begin
  Result := 0;
  if (iId > 0) then
  begin
    if (not(AModel.ValdiarExcluir(iID))) then
    begin
      if (AModel.Excluir(iID)) then
        Result := 1
      else
        Result := 2;
    end
    else
      Result := 3;
  end;
end;

function TProdutoListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceProdutoListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
