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
      const AModel: IInterfaceSaborListagemModel): Integer;
  end;

implementation

{ TSaborListagemRegra }

function TSaborListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceSaborListagemModel): Integer;
begin
  Result := 0;
  if (iId > 0) then
  begin
    if (not(AModel.ValidarExcluir(iID))) then
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

function TSaborListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceSaborListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
