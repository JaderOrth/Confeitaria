unit uCategoriasListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uInterfaceCategoriaListagemModel, uCategoriasDTO;

type
  TCategoriasListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceCategoriasListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceCategoriasListagemModel): Integer;
  end;

implementation

{ TCategoriasListagemRegra }

function TCategoriasListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceCategoriasListagemModel): Integer;
begin
  Result := 0;
  if (iId > 0) then
  begin
    if (not(AModel.ValidarExcluir(iId))) then
    begin
      if (AModel.Excluir(iId)) then
        Result := 1
      else
        Result := 2;
    end
    else
      Result := 3;
  end;
end;

function TCategoriasListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceCategoriasListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
