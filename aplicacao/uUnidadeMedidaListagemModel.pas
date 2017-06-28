unit uUnidadeMedidaListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceUnidadeMedidaListagemModel, uUnidadeMedidaDTO, uClassConexaoSingleton,
  uUnidadeMedidaListaHash;

type
  TUnidadeMedidaListagemModel = class(TInterfacedObject,
    IInterfaceUnidadeMedidaListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxUnidadeMedida(var aLista: TUnidadeMedidaListaHash): Boolean;
  end;

implementation

{ TUnidadeMedidaListagemModel }

function TUnidadeMedidaListagemModel.ComboBoxUnidadeMedida(
  var aLista: TUnidadeMedidaListaHash): Boolean;
var
  oQuery: TFDQuery;
  oUnidadeMedidaDTO: TUnidadeMedidaDTO;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idunidade_medida, descricao'+
                ' FROM unidade_medida');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oUnidadeMedidaDTO := TUnidadeMedidaDTO.Create;
        oUnidadeMedidaDTO.idunidade_medida :=
          oQuery.FieldByName('idunidade_medida').AsInteger;
        oUnidadeMedidaDTO.descricao := oQuery.FieldByName('descricao').AsString;
        ALista.Add(oUnidadeMedidaDTO.descricao, oUnidadeMedidaDTO);
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;


end;

function TUnidadeMedidaListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM unidade_medida WHERE idunidade_medida = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TUnidadeMedidaListagemModel.MontarGrid(
  AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT idunidade_medida, descricao, sigla, permite_decimal '+
                ' FROM unidade_medida');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
