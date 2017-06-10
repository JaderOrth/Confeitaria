unit uMunicipioCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uMunicipioDTO, uInterfaceMunicipioModel, uClassConexaoSingleton;

type
  TMunicipioCadastroModel = class(TInterfacedObject, IInterfaceMunicipioModel)
  public
    function BuscarUpdate(var AMunicipio: TMunicipioDTO): Boolean;
    function Insert(const AMunicipio: TMunicipioDTO): Boolean;
    function Update(const AMunicipio: TMunicipioDTO): Boolean;
    function BuscarID: Integer;
  end;

implementation

{ TMunicipioCadastroModel }

function TMunicipioCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idmunicipio) AS id FROM municipio');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('id').AsInteger + 1;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TMunicipioCadastroModel.BuscarUpdate(
  var AMunicipio: TMunicipioDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, iduf FROM municipio WHERE idmunicipio = '
                + IntToStr(AMunicipio.IdMunicipio));
    if (not(oQuery.IsEmpty)) then
    begin
      AMunicipio.Descricao := oQuery.FieldByName('descricao').AsString;
      AMunicipio.IdEstado := oQuery.FieldByName('iduf').AsInteger;
      Result := true;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndnil(oQuery);
  end;


end;

function TMunicipioCadastroModel.Insert(
  const AMunicipio: TMunicipioDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO municipio(idmunicipio, descricao, iduf) VALUES ('+
          IntToStr(AMunicipio.IdMunicipio)+', '+
          QuotedStr(AMunicipio.Descricao)+', '+
          IntToStr(AMunicipio.IdEstado)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMunicipioCadastroModel.Update(
  const AMunicipio: TMunicipioDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE municipio SET descricao = '+QuotedStr(AMunicipio.Descricao)
          +', iduf = '+ IntToStr(AMunicipio.IdEstado)
          +' WHERE idmunicipio = '+IntToStr(AMunicipio.IdMunicipio);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
