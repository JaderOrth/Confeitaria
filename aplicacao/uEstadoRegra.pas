unit uEstadoRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client,
  uEstadoDTO, uEstadoModel;

type
  TEstadoRegra = class
  public
    function MontarGrid(out AMenTable: TFDMemTable;
      AEstadoModel: TEstadoModel): Boolean;
  end;

implementation

{ TEstadoRegra }

function TEstadoRegra.MontarGrid(out AMenTable: TFDMemTable;
  AEstadoModel: TEstadoModel): Boolean;
begin
  Result := AEstadoModel.MontarGrid(AMenTable);
end;

end.
