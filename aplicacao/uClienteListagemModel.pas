unit uClienteListagemModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uClienteDTO, uInterfaceClienteModel, uClassConexaoSingleton, uBairroListaHash;

type
  TClienteListagemModel = class(TInterfacedObject, IInterfaceClienteModel)
  public
    function MontarGrid(aMenTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxBairro(var aLista: TBairroListaHash;
      const aId: Integer): Boolean;
  end;

implementation

{ TClienteListagemModel }

function TClienteListagemModel.ComboBoxBairro(var aLista: TBairroListaHash;
  const aId: Integer): Boolean;
begin

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
    oQuery.Open('SELECT cli.idcliente, cli.endereco, cli.numero,'+
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
