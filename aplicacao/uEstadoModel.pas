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
