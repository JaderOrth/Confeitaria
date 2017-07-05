unit uUnidadeMedidaListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uInterfaceUnidadeMedidaListagemModel, uUnidadeMedidaDTO;

type
  TUnidadeMedidaListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceUnidadeMedidaListagemModel): Integer;
  end;
implementation

{ TUnidadeMedidaListagemRegra }

function TUnidadeMedidaListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceUnidadeMedidaListagemModel): Integer;
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

function TUnidadeMedidaListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
