unit uUsuarioListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uUsuarioDTO, uInterfaceUsuarioListagemModel;

type
  TUsuarioListagemRegra = class
  public
    function BuscarGrid(aMemTable: TFDMemTable;
      const aModel: IInterfaceUsuarioListagemModel): Boolean;
    function Excluir(const aID: Integer;
      const aModel: IInterfaceUsuarioListagemModel): Integer;
  end;

implementation

{ TUsuarioListagemRegra }

function TUsuarioListagemRegra.BuscarGrid(aMemTable: TFDMemTable;
  const aModel: IInterfaceUsuarioListagemModel): Boolean;
begin
  Result := aModel.BuscarGrid(aMemTable);
end;

function TUsuarioListagemRegra.Excluir(const aID: Integer;
  const aModel: IInterfaceUsuarioListagemModel): Integer;
begin
  Result := 0;
  if (aID > 0) then
  begin
    if (not(AModel.ValidarExcluir(aID))) then
    begin
      if (AModel.Excluir(aID)) then
        Result := 1
      else
        Result := 2;
    end
    else
      Result := 3;
  end;
end;

end.
