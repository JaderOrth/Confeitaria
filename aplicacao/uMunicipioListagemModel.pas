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
    function BuscarGrid(aMemTable: TFDMemTable;
      const aPesquisa: String): Boolean;
  end;

implementation

{ TMunicipioListagemModel }

function TMunicipioListagemModel.BuscarGrid(aMemTable: TFDMemTable;
  const aPesquisa: String): Boolean;
begin

end;

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
    oMemTable.Close;
    oQuery.Close;
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idMunicipio, descricao, iduf FROM Municipio');
    oMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

end.
