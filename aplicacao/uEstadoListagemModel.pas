unit uEstadoListagemModel;

interface

uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB, uInterfaceListagemModel,
  FireDAC.Comp.Client, System.SysUtils, FireDAC.DApt;

type
  TEstadoListagemModel = class
  public
    function BuscarID:Integer;
    function Salvar(const aEstado: TEstadoDTO):Boolean;
    function Excluir(const aEstado: TEstadoDTO):Boolean;
    function MontarGrid(oMemTable: TFDMemTable):Boolean;
    function BuscarSelect(var aEstado: TEstadoDTO): Boolean;
    function Update(const aEstado: TEstadoDTO): Boolean;
    function BuscarUF(const aEstado: TEstadoDTO): Boolean;
    function BuscarGrid(aMemTable: TFDMemTable; aPesquisa: String): Boolean;

  end;
implementation

{ TEstadoModel }

function TEstadoListagemModel.BuscarGrid(aMemTable: TFDMemTable;
  aPesquisa: String): Boolean;
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
                ' uf WHERE sigla_uf  like ''%'+aPesquisa+'%'' or descricao like ''%'+aPesquisa+'%''');
    aMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;

  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TEstadoListagemModel.BuscarID: Integer;
var
  oQuery : TFDQuery;
begin
  Result := 1;
  oQuery := TFDQuery.Create(nil);

  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(iduf) as ID FROM uf');

    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('ID').AsInteger +1;
    end;

  finally
    if Assigned(oQuery) then
    begin
      FreeAndNil(oQuery);
    end;
  end;
end;

function TEstadoListagemModel.BuscarSelect(var aEstado: TEstadoDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, sigla_uf FROM uf where iduf = '
                + IntToStr(aEstado.ID));
    if (not(oQuery.IsEmpty)) then
    begin
      aEstado.UF := oQuery.FieldByName('sigla_uf').AsString;
      aEstado.Descricao := oQuery.FieldByName('descricao').AsString;
      Result := true;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TEstadoListagemModel.BuscarUF(const aEstado: TEstadoDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT * FROM uf WHERE sigla_uf = '+ QuotedStr(aEstado.UF));
    if (not(oQuery.IsEmpty)) then
    begin
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TEstadoListagemModel.Excluir(const aEstado: TEstadoDTO): Boolean;
var
  sSql : string;
begin
  sSql := 'DELETE FROM uf WHERE iduf = ' +
          IntToStr(aEstado.ID);

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

function TEstadoListagemModel.Salvar(const aEstado: TEstadoDTO): Boolean;
var
  sSql : string;
begin
  sSql := 'INSERT INTO uf (iduf, descricao, sigla_uf) ' +
          'VALUES (' +
          IntToStr(aEstado.ID)+','+
          QuotedStr(aEstado.Descricao)+' ,'+
          QuotedStr(aEstado.UF)+')';

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoListagemModel.Update(const aEstado: TEstadoDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE uf SET descricao = '+ QuotedStr(aEstado.Descricao)
                     +', sigla_uf =  '+ QuotedStr(aEstado.UF)
                     +' WHERE iduf = '+ IntToStr(aEstado.ID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
