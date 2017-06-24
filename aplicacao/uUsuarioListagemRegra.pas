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
      const aModel: IInterfaceUsuarioListagemModel): Boolean;
  end;

implementation

{ TUsuarioListagemRegra }

function TUsuarioListagemRegra.BuscarGrid(aMemTable: TFDMemTable;
  const aModel: IInterfaceUsuarioListagemModel): Boolean;
begin
  Result := aModel.BuscarGrid(aMemTable);
end;

function TUsuarioListagemRegra.Excluir(const aID: Integer;
  const aModel: IInterfaceUsuarioListagemModel): Boolean;
begin
  Result := False;
  if (aID > 0) then
    Result := aModel.Excluir(aID);
end;

end.
