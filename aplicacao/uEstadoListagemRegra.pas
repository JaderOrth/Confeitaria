unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.DBGrids, System.Classes,
  Vcl.Dialogs, Vcl.Controls, System.UITypes,
  uEstadoDTO, uInterfaceListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      const AModel: IInterfaceListagemModel): Boolean;
    function Excluir(const iId: Integer;
      const AModel: IInterfaceListagemModel): Integer;
  end;

implementation

{ TEstadoListagemRegra }

function TEstadoListagemRegra.Excluir(const iId: Integer;
  const AModel: IInterfaceListagemModel): Integer;
begin
  Result := 0;
  if (iId > 0) then
  begin
    if (not(AModel.ValidarExcluir(iId))) then
    begin
      if (AModel.Excluir(iId)) then
        Result := 2
      else
        Result := 3;
    end
    else
      Result := 1;
  end;
end;

function TEstadoListagemRegra.MontarGrid(oMemTable: TFDMeMTable;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(oMemTable);
end;

end.
