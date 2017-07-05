unit uBairroListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceBairroListagemModel, uBairroDTO, uClassConexaoSingleton,
  uBairroListaHash;

type
  TBairroListagemModel = class(TInterfacedObject, IInterfaceBairroListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxBairro(var aLista: TBairroListaHash;
      const aId: Integer): Boolean;
  end;

implementation

{ TBairroListagemModel }

function TBairroListagemModel.ComboBoxBairro(var aLista: TBairroListaHash;
  const aId: Integer): Boolean;
var
  oQuery: TFDQuery;
  oBairroDTO: TBairroDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idbairro, descricao FROM bairro' +
                ' WHERE idmunicipio = ' + IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oBairroDTO := TBairroDTO.Create;

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
  sSql := 'DELETE FROM bairro WHERE idbairro = ' + IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TBairroListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT br.idbairro, br.descricao, mc.descricao as municipio ' +
                ' FROM bairro as br inner join municipio as mc ' +
                ' on mc.idmunicipio = br.idmunicipio');
    AMemTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TBairroListagemModel.ValidarExcluir(const aId: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT cli.idcliente FROM cliente as cli' +
                ' INNER JOIN bairro as bai ON bai.idbairro = cli.idcliente' +
                ' WHERE bai.idbairro = ' + IntToStr(aId)+' limit 2');
    if (oQuery.IsEmpty) then
    begin
      oQuery.Open('SELECT pe.idpedido FROM pedido as pe' +
                  ' INNER JOIN bairro as bai ON bai.idbairro = pe.idpedido' +
                  ' WHERE bai.idbairro = ' + IntToStr(aId)+' limit 2');
      if (not(oQuery.IsEmpty)) then
        Result := True;
    end
    else
      Result := True;

  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
