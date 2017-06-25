unit uPedidoListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfacePedidoListagem, uClassConexaoSingleton;

type
  TPedidoListagemModel = class(TInterfacedObject, IInterfacePedidoListagem)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TPedidoListagemModel }

function TPedidoListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM pedido WHERE idpedido = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TPedidoListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
