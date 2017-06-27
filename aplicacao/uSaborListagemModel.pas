unit uSaborListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceSaborListagemModel, uSaborDTO, uClassConexaoSingleton;

type
  TSaborListagemModel = class(TInterfacedObject, IInterfaceSaborListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TSaborListagemModel }

function TSaborListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM sabores WHERE idsabores = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TSaborListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT idsabores, descricao, ingredientes '+
                ' FROM sabores');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
