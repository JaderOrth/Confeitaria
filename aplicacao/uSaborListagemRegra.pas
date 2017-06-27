unit uSaborListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uInterfaceSaborListagemModel, uSaborDTO;

type
  TSaborListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceSaborListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceSaborListagemModel): Boolean;
  end;

implementation

{ TSaborListagemRegra }

function TSaborListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceSaborListagemModel): Boolean;
begin
  Result := False;
  if (iID > 0) then
    Result := AModel.Excluir(iID);
end;

function TSaborListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceSaborListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
