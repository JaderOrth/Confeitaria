unit uEstadoListagemModel;

interface

uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, FireDAC.DApt,
  uInterfaceListagemModel, uEstadoListaHash;

type
  TEstadoListagemModel = class(TInterfacedObject, IInterfaceListagemModel)
  public
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function ComboBox(var ALista: TEstadoListaHash): Boolean;
    function ValidarExcluir(const iID: Integer): Boolean;
  end;

implementation

{ TEstadoModel }

function TEstadoListagemModel.ComboBox(var ALista: TEstadoListaHash): Boolean;
var
  oQuery: TFDQuery;
  oEstadoDTO: TEstadoDTO;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT iduf, descricao FROM uf');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oEstadoDTO := TEstadoDTO.Create;
        oEstadoDTO.ID := oQuery.FieldByName('iduf').AsInteger;
        oEstadoDTO.Descricao := oQuery.FieldByName('descricao').AsString;
        ALista.Add(oEstadoDTO.Descricao, oEstadoDTO);
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;

end;

function TEstadoListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: string;
begin
  sSql := 'DELETE FROM uf WHERE iduf = '+IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoListagemModel.MontarGrid(oMemTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Close;
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT iduf, descricao, sigla_uf FROM uf');
    oMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TEstadoListagemModel.ValidarExcluir(const iID: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select uf.iduf from uf inner join municipio as mu'+
                ' on mu.iduf = uf.iduf where uf.iduf = '+
                IntToStr(iID)+' limit 2');
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
