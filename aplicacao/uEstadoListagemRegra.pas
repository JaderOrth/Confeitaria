unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.DBGrids, System.Classes,
  Vcl.Dialogs,
  Vcl.Controls, System.UITypes,
  uEstadoDTO, uInterfaceListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      const AModel: IInterfaceListagemModel): Boolean;
    function Excluir(const iId: Integer;
      const AModel: IInterfaceListagemModel): Boolean;
  end;

implementation

{ TEstadoListagemRegra }

function TEstadoListagemRegra.Excluir(const iId: Integer;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := False;
  if (iId > 0) then
    Result := AModel.Excluir(iId);
end;

function TEstadoListagemRegra.MontarGrid(oMemTable: TFDMeMTable;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(oMemTable);
end;

end.
