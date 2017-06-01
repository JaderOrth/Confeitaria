unit uEstadoListagemModel;

interface

uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, FireDAC.DApt,
  uInterfaceListagemModel;

type
  TEstadoListagemModel = class(TInterfacedObject, IInterfaceListagemModel)
  public
    function Excluir(const iID: Integer):Boolean;
    function MontarGrid(oMemTable: TFDMemTable):Boolean;
    function BuscarGrid(aMemTable: TFDMemTable; const aPesquisa: String): Boolean;

  end;
implementation

{ TEstadoModel }

function TEstadoListagemModel.BuscarGrid(aMemTable: TFDMemTable;
  const aPesquisa: String): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Close;
    aMemTable.Close;
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT iduf ID, descricao Descrição, sigla_uf UF FROM'+
                ' uf WHERE sigla_uf  like ''%'+aPesquisa+'%'''+
                ' or descricao like ''%'+aPesquisa+'%'''+
                ' or iduf like ''%'+aPesquisa+'%''');
    aMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;

  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TEstadoListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql : string;
begin
  sSql := 'DELETE FROM uf WHERE iduf = ' +
          IntToStr(iID);

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoListagemModel.MontarGrid(oMemTable: TFDMemTable): Boolean;
var
  oQuery : TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Close;
    oMemTable.Close;
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT iduf ID, descricao Descrição, sigla_uf UF FROM uf');
    oMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
