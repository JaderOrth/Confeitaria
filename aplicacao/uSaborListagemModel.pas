unit uSaborListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceSaborListagemModel, uSaborDTO, uClassConexaoSingleton,
  uSaborListaHash;

type
  TSaborListagemModel = class(TInterfacedObject, IInterfaceSaborListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function CheckSabor(var aLista: TSaborListaHash): Boolean;
  end;

implementation

{ TSaborListagemModel }

function TSaborListagemModel.CheckSabor(var aLista: TSaborListaHash): Boolean;
var
  oQuery: TFDQuery;
  oSaborDTO: TSaborDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idsabores, descricao FROM sabores order by descricao asc');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oSaborDTO :=  TSaborDTO.Create;

        oSaborDTO.idsabores := oQuery.FieldByName('idsabores').AsInteger;
        oSaborDTO.descricao := oQuery.FieldByName('descricao').AsString;

        aLista.Add(oSaborDTO.descricao, oSaborDTO);

        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TSaborListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM sabores WHERE idsabores = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TSaborListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT idsabores, descricao, ingredientes '+
                ' FROM sabores');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
