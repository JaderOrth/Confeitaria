unit uEstadoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uClassConexaosingleton, uEstadoDTO;

type
  TEstadoCadastroModel = class
  public
    function BuscarSelect(var aEstado: TEstadoDTO): Boolean;
    function Salvar(const aEstado: TEstadoDTO):Boolean;
    function Update(const aEstado: TEstadoDTO): Boolean;
    function BuscarID:Integer;
    function BuscarUF(const aEstado: TEstadoDTO): Boolean;
    function BuscarUFEdit(const aEstado: TEstadoDTO): Boolean;
  end;

implementation

function TEstadoCadastroModel.BuscarID: Integer;
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

function TEstadoCadastroModel.BuscarSelect(var aEstado: TEstadoDTO): Boolean;
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

function TEstadoCadastroModel.BuscarUF(const aEstado: TEstadoDTO): Boolean;
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

function TEstadoCadastroModel.BuscarUFEdit(const aEstado: TEstadoDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT * FROM uf WHERE sigla_uf = '+ QuotedStr(aEstado.UF)+
                ' and iduf = '+ IntToStr(aEstado.ID));
    if (not(oQuery.IsEmpty)) then
    begin
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;

end;

function TEstadoCadastroModel.Salvar(const aEstado: TEstadoDTO): Boolean;
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

function TEstadoCadastroModel.Update(const aEstado: TEstadoDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE uf SET descricao = '+ QuotedStr(aEstado.Descricao)
                     +', sigla_uf =  '+ QuotedStr(aEstado.UF)
                     +' WHERE iduf = '+ IntToStr(aEstado.ID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
