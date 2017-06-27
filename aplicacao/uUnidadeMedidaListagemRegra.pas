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
      const AModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
  end;
implementation

{ TUnidadeMedidaListagemRegra }

function TUnidadeMedidaListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
begin
  Result := False;
  if (iID > 0) then
    Result := AModel.Excluir(iID);
end;

function TUnidadeMedidaListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceUnidadeMedidaListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
