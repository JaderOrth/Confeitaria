unit uEstadoModel;

interface

uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB,
  FireDAC.Comp.Client, System.SysUtils, FireDAC.DApt;

type
  TEstadoModel = class
  public
    function BuscarID:Integer;
    function Salvar(const aEstado: TEstadoDTO):Boolean;
    function Excluir(const aEstado: TEstadoDTO):Boolean;
    function MontarGrid(out aMemTable: TFDMemTable):Boolean;
  end;
implementation

{ TEstadoModel }

function TEstadoModel.BuscarID: Integer;
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

function TEstadoModel.Excluir(const aEstado: TEstadoDTO): Boolean;
var
  sSql : string;
begin
  sSql := 'DELETE FROM uf WHERE iduf = ' +
          IntToStr(aEstado.ID);

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoModel.MontarGrid(out aMemTable: TFDMemTable): Boolean;
var
  oQuery : TFDQuery;
begin
  Result := False;
  oQuery:=TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT iduf ID, descricao Descri��o, sigla_uf UF FROM uf');

    if (not(oQuery.IsEmpty)) then
    begin
      aMemTable.Data := oQuery.Data;
      Result := True;
    end;
  finally
    if Assigned(oQuery) then
    begin
      FreeAndNil(oQuery);
    end;
  end;
end;

function TEstadoModel.Salvar(const aEstado: TEstadoDTO): Boolean;
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

end.
