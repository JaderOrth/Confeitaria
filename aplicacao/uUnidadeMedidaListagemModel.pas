unit uUnidadeMedidaListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceUnidadeMedidaListagemModel, uUnidadeMedidaDTO, uClassConexaoSingleton;

type
  TUnidadeMedidaListagemModel = class(TInterfacedObject, IInterfaceUnidadeMedidaListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TUnidadeMedidaListagemModel }

function TUnidadeMedidaListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM unidade_medida WHERE idunidade_medida = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TUnidadeMedidaListagemModel.MontarGrid(
  AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT idunidade_medida, descricao, sigla, permite_decimal '+
                ' FROM unidade_medida');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
