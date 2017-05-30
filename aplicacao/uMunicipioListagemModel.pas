unit uMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  uInterfaceListagemModel, uClassConexaoSingleton;

type
  TMunicipioListagemModel = class(TInterfacedObject, IInterfaceListagemModel)
  public
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function BuscarGrid(aMemTable: TFDMemTable; aPesquisa: String): Boolean;
  end;

implementation

{ TMunicipioListagemModel }

function TMunicipioListagemModel.BuscarGrid(aMemTable: TFDMemTable;
  aPesquisa: String): Boolean;
begin

end;

function TMunicipioListagemModel.Excluir(const iID: Integer): Boolean;
begin

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
    oQuery.Open('SELECT idMunicipio as ID, descricao, iduf FROM Municipio');
    if (not(oQuery.IsEmpty)) then
    begin
      oMemTable.Data := oQuery.Data;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

end.
