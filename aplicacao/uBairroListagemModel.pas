unit uBairroListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  uInterfaceBairroListagemModel, uBairroDTO, uClassConexaoSingleton,
  uBairroListaHash;
type
  TBairroListagemModel = class(TInterfacedObject, IInterfaceBairroListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxBairro(var aLista: TBairroListaHash;
      const aID: Integer): Boolean;
  end;

implementation

{ TBairroListagemModel }

function TBairroListagemModel.ComboBoxBairro(var aLista: TBairroListaHash;
  const aID: Integer): Boolean;
var
  oQuery: TFDQuery;
  oBairroDTO: TBairroDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idbairro, descricao FROM bairro'+
                ' WHERE idmunicipio = '+ IntToStr(aID));
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oBairroDTO :=  TBairroDTO.Create;

        oBairroDTO.idBairro := oQuery.FieldByName('idbairro').AsInteger;
        oBairroDTO.Descricao := oQuery.FieldByName('descricao').AsString;

        aLista.Add(oBairroDTO.Descricao, oBairroDTO);

        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TBairroListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM bairro WHERE idbairro = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TBairroListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT br.idbairro, br.descricao, mc.descricao as municipio '+
                ' FROM bairro as br inner join municipio as mc '+
                ' on mc.idmunicipio = br.idmunicipio');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
