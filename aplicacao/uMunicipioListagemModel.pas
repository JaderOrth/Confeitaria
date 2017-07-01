unit uMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uClassConexaoSingleton, uInterfaceMunicipioListagemModel,
  uMunicipioListaHash, uMunicipioDTO;

type
  TMunicipioListagemModel = class(TInterfacedObject,
    IInterfaceMunicipioListagemModel)
  public
    function ValidarExcluir(const iID: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function ComboBox(var aLista: TMunicipioListaHash; iID: Integer): Boolean;
  end;

implementation

{ TMunicipioListagemModel }

function TMunicipioListagemModel.ComboBox(var aLista: TMunicipioListaHash;
  iID: Integer): Boolean;
var
  oQuery: TFDQuery;
  oMunicipioDTO: TMunicipioDTO;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idmunicipio, descricao FROM municipio' +
      ' WHERE iduf = ' + IntToStr(iID));
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oMunicipioDTO := TMunicipioDTO.Create;
        oMunicipioDTO.IdMunicipio :=
          oQuery.FieldByName('idmunicipio').AsInteger;
        oMunicipioDTO.Descricao := oQuery.FieldByName('descricao').AsString;

        aLista.Add(oMunicipioDTO.Descricao, oMunicipioDTO);
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TMunicipioListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM Municipio where idMunicipio = ' + IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMunicipioListagemModel.MontarGrid(oMemTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT m.idMunicipio as idMunicipio,' +
      ' m.descricao as descricao, uf.descricao as estado ' +
      'FROM Municipio as m inner join uf on uf.iduf = m.iduf');
    oMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TMunicipioListagemModel.ValidarExcluir(const iID: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select mu.idmunicipio from municipio as mu'+
                ' inner join bairro as ba on ba.idmunicipio = mu.idmunicipio'+
                ' where mu.idmunicipio = '+ IntToStr(iID));
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
