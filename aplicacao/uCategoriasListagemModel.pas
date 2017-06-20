unit uCategoriasListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB, uClassConexaoSingleton,
  uInterfaceCategoriaListagemModel, uCategoriasDTO;

type
  TCategoriasListagemModel = class(TInterfacedObject, IInterfaceCategoriasListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TCategoriasListagemModel }

function TCategoriasListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM categorias WHERE idcategorias = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TCategoriasListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT idcategorias, descricao '+
                ' FROM categorias');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
