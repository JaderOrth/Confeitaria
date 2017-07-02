unit uClienteListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uClienteDTO, uInterfaceClienteModel, uClassConexaoSingleton, uClienteListaHash;

type
  TClienteListagemModel = class(TInterfacedObject, IInterfaceClienteModel)
  public
    function MontarGrid(aMenTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxCliente(out aLista: TClienteListaHash): Boolean;
  end;

implementation

{ TClienteListagemModel }

function TClienteListagemModel.ComboBoxCliente(
  out aLista: TClienteListaHash): Boolean;
var
  oQuery: TFDQuery;
  oClienteDTO: TClienteDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idcliente, nome FROM cliente');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oClienteDTO :=  TClienteDTO.Create;
        oClienteDTO.IdCliente := oQuery.FieldByName('idcliente').AsInteger;
        oClienteDTO.Nome := oQuery.FieldByName('nome').AsString;
        aLista.Add(oClienteDTO.Nome, oClienteDTO);
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TClienteListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM cliente WHERE idcliente = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TClienteListagemModel.MontarGrid(aMenTable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT cli.idcliente, cli.endereco, cli.nome, cli.numero,'+
                ' cli.telefone, cli.celular, bai.descricao,'+
                ' mun.descricao as municipio FROM cliente as '+
                ' cli INNER JOIN bairro as bai'+
                ' ON bai.idbairro = cli.idbairro INNER JOIN municipio as mun' +
                ' ON mun.idmunicipio = bai.idmunicipio');
    aMenTable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

end.
