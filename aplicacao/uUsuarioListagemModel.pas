unit uUsuarioListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uUsuarioDTO, uInterfaceUsuarioListagemModel, uClassConexaoSingleton;

type
  TUsuarioListagemModel = class(TInterfacedObject,
    IInterfaceUsuarioListagemModel)
  public
    function BuscarGrid(aMemTable: TFDMemTable): Boolean;
    function Excluir(aID: Integer): Boolean;
  end;

implementation

{ TUsuarioListagemModel }

function TUsuarioListagemModel.BuscarGrid(aMemTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idusuario, usuario FROM usuario');
    aMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;

end;

function TUsuarioListagemModel.Excluir(aID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM usuario WHERE idusuario = '+ IntToStr(aID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
