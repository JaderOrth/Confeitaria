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
  end;

implementation

{ TMunicipioCadastroModel }

function TMunicipioCadastroModel.BuscarUpdate(
  var AMunicipio: TMunicipioDTO): Boolean;
begin

end;



function TMunicipioCadastroModel.Insert(
  const AMunicipio: TMunicipioDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO(idmunicipio, descricao, iduf) VALUES ('+
          IntToStr(AMunicipio.IdMunicipio)+', '+
          QuotedStr(AMunicipio.Descricao)+', '+
          IntToStr(AMunicipio.IdEstado)+')';
  TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMunicipioCadastroModel.Update(
  const AMunicipio: TMunicipioDTO): Boolean;
begin

end;

end.
