unit uEstadoListagemModel;

interface

uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, FireDAC.DApt,
  uInterfaceListagemModel, uMunicipioListaHash, uMunicipioDTO;

type
  TEstadoListagemModel = class(TInterfacedObject, IInterfaceListagemModel)
  public
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function ComboBox(ALista: TMunicipioListaHash): Boolean;

  end;

implementation

{ TEstadoModel }

function TEstadoListagemModel.ComboBox(ALista: TMunicipioListaHash): Boolean;
var
  oQuery: TFDQuery;
  oMunicipioDTO: TMunicipioDTO;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT * FROM Municipio');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (oQuery.Eof) do
      begin
        oMunicipioDTO.IdMunicipio := oQuery.FieldByName('idMunicipio').AsInteger;
        oMunicipioDTO.Descricao := oQuery.FieldByName('descricao').AsString;
        oMunicipioDTO.IdEstado := oQuery.FieldByName('iduf').AsInteger;

        ALista.Add(oMunicipioDTO.Descricao, oMunicipioDTO);

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
  sSql := 'DELETE FROM uf WHERE iduf = ' + IntToStr(iID);

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
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
