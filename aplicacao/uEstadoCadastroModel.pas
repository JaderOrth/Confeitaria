unit uEstadoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  uClassConexaosingleton, uEstadoDTO;

type
  TEstadoCadastroModel = class
  public
    function BuscarSelect(var aEstado: TEstadoDTO): Boolean;


  end;

implementation

function TEstadoCadastroModel.BuscarSelect(var aEstado: TEstadoDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, sigla_uf FROM uf where iduf = '
                + IntToStr(aEstado.ID));
    if (not(oQuery.IsEmpty)) then
    begin
      aEstado.UF := oQuery.FieldByName('sigla_uf').AsString;
      aEstado.Descricao := oQuery.FieldByName('descricao').AsString;
      Result := true;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;
end.
