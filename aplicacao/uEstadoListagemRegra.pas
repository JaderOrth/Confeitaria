unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client,
  uEstadoDTO, uEstadoListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(out AMenTable: TFDMemTable;
      AEstadoModel: TEstadoListagemModel): Boolean;
  end;

implementation

{ TEstadoRegra }

function TEstadoListagemRegra.MontarGrid(out AMenTable: TFDMemTable;
  AEstadoModel: TEstadoListagemModel): Boolean;
begin
  Result := AEstadoModel.MontarGrid(AMenTable);
end;

end.
