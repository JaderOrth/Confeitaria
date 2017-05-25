unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client,
  uEstadoDTO, uEstadoListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      AModel: TEstadoListagemModel): Boolean;
  end;

implementation

{ TEstadoListagemRegra }

function TEstadoListagemRegra.MontarGrid(oMemTable: TFDMeMTable;
  AModel: TEstadoListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(oMemTable);
end;

end.
