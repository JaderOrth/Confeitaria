unit uMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  uClassConexaoSingleton, uInterfaceMunicipioListagemModel;

type
  TMunicipioListagemModel = class(TInterfacedObject,
    IInterfaceMunicipioListagemModel)
  public
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
  end;

implementation

{ TMunicipioListagemModel }

function TMunicipioListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM Municipio where idMunicipio = ' + IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMunicipioListagemModel.MontarGrid(oMemTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT m.idMunicipio as idMunicipio,'+
                ' m.descricao as descricao, uf.descricao as estado '+
                'FROM Municipio as m inner join uf on uf.iduf = m.iduf');
    oMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

end.
