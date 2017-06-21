unit uBairroCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceBairroCadastroModel, uBairroDTO, uClassConexaoSingleton;

type
  TBairroCadastroModel = class(TInterfacedObject, IInterfaceBairroCadastroModel)
  public
    function SelectUpdate(var aBairroDTO: TBairroDTO;
      var aID: Integer): Boolean;
    function BuscarID: Integer;
    function Insert(const aBairroDTO: TBairroDTO): Boolean;
    function update(const aBairroDTO: TBairroDTO): Boolean;
  end;

implementation

{ TBairroCadastroModel }

function TBairroCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idbairro) as id FROM bairro');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TBairroCadastroModel.Insert(const aBairroDTO: TBairroDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO bairro(idbairro, descricao, idmunicipio) VALUES('+
          IntToStr(aBairroDTO.idBairro)+', '+
          QuotedStr(aBairroDTO.Descricao)+', '+
          IntToStr(aBairroDTO.idMunicipio)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TBairroCadastroModel.SelectUpdate(var aBairroDTO: TBairroDTO;
  var aID: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT ba.descricao, ba.idmunicipio, uf.iduf '+
                ' FROM bairro as ba inner join municipio as mu '+
                ' on mu.idmunicipio = ba.idmunicipio inner join uf '+
                ' on uf.iduf = mu.iduf where ba.idbairro ='+
                IntToStr(aBairroDTO.idBairro));
    if (not(oQuery.IsEmpty)) then
    begin
      aBairroDTO.Descricao := oQuery.FieldByName('descricao').AsString;
      aBairroDTO.idMunicipio := oQuery.FieldByName('idmunicipio').AsInteger;
      aID := oQuery.FieldByName('iduf').AsInteger;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TBairroCadastroModel.update(const aBairroDTO: TBairroDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE bairro SET descricao = '+ QuotedStr(aBairroDTO.Descricao)+
                        ', idmunicipio = '+ IntToStr(aBairroDTO.idMunicipio)+
                        ' WHERE idbairro = '+ IntToStr(aBairroDTO.idBairro);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
