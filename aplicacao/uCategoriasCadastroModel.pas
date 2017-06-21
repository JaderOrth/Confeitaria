unit uCategoriasCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  uInterfaceCategoriaCadastroModel, uCategoriasDTO, uClassConexaoSingleton;

type
  TCategoriasCadastroModel = class(TInterfacedObject, IInterfaceCategoriaCadastroModel)
  public
    function SelectUpdate(var aCategoriasDTO: TCategoriasDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aCategoriasDTO: TCategoriasDTO): Boolean;
    function update(const aCategoriasDTO: TCategoriasDTO): Boolean;
  end;

implementation

{ TCategoriasCadastroModel }

function TCategoriasCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idcategorias) as id FROM categorias');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TCategoriasCadastroModel.Insert(
  const aCategoriasDTO: TCategoriasDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO categorias(idcategorias, descricao) VALUES('+
          IntToStr(aCategoriasDTO.idCategoria)+', '+
          QuotedStr(aCategoriasDTO.Descricao)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TCategoriasCadastroModel.SelectUpdate(
  var aCategoriasDTO: TCategoriasDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao '+
                'FROM categorias '+
                'WHERE idcategorias ='+
                IntToStr(aCategoriasDTO.idcategoria));
    if (not(oQuery.IsEmpty)) then
    begin
      aCategoriasDTO.descricao := oQuery.FieldByName('descricao').AsString;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TCategoriasCadastroModel.update(
  const aCategoriasDTO: TCategoriasDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE categorias SET descricao = '+ QuotedStr(aCategoriasDTO.descricao)+
          ' WHERE idcategorias = '+ IntToStr(aCategoriasDTO.idcategoria);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
