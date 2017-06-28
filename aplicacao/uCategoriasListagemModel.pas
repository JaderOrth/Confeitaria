unit uCategoriasListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB, uClassConexaoSingleton,
  uInterfaceCategoriaListagemModel, uCategoriasDTO, uCategoriaListaHash;

type
  TCategoriasListagemModel = class(TInterfacedObject, IInterfaceCategoriasListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxCategoria(var aLista: TCategoriaListaHash): Boolean;
  end;

implementation

{ TCategoriasListagemModel }

function TCategoriasListagemModel.ComboBoxCategoria(
  var aLista: TCategoriaListaHash): Boolean;
var
  oQuery: TFDQuery;
  oCategoriaDTO: TCategoriasDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idcategorias, descricao FROM categorias');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oCategoriaDTO :=  TCategoriasDTO.Create;

        oCategoriaDTO.idcategoria := oQuery.FieldByName('idcategorias').AsInteger;
        oCategoriaDTO.descricao := oQuery.FieldByName('descricao').AsString;

        aLista.Add(oCategoriaDTO.descricao, oCategoriaDTO);

        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;


end;

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
