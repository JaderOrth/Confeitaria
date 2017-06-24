unit uUnidadeMedidaCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceUnidadeMedidaCadastroModel, uUnidadeMedidaDTO, uClassConexaoSingleton;

type
  TUnidadeMedidaCadastroModel = class(TInterfacedObject, IInterfaceUnidadeMedidaCadastroModel)
  public
    function SelectUpdate(var aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
    function update(const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
  end;

implementation

{ TUnidadeMedidaCadastroModel }

function TUnidadeMedidaCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idunidade_medida) as id FROM unidade_medida');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TUnidadeMedidaCadastroModel.Insert(
  const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO unidade_medida(idunidade_medida, descricao, sigla, permite_decimal) VALUES('+
          IntToStr(aUnidadeMedidaDTO.idunidade_medida)+', '+
          QuotedStr(aUnidadeMedidaDTO.descricao)+', '+
          QuotedStr(aUnidadeMedidaDTO.sigla)+', '+
          QuotedStr(aUnidadeMedidaDTO.permite_decimal)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TUnidadeMedidaCadastroModel.SelectUpdate(
  var aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, sigla, permite_decimal '+
                'FROM unidade_medida '+
                'WHERE idunidade_medida ='+
                IntToStr(aUnidadeMedidaDTO.idunidade_medida));
    if (not(oQuery.IsEmpty)) then
    begin
      aUnidadeMedidaDTO.descricao := oQuery.FieldByName('descricao').AsString;
      aUnidadeMedidaDTO.sigla := oQuery.FieldByName('sigla').AsString;
      aUnidadeMedidaDTO.permite_decimal := oQuery.FieldByName('permite_decimal').AsString;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TUnidadeMedidaCadastroModel.update(
  const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE unidade_medida SET descricao = '+ QuotedStr(aUnidadeMedidaDTO.descricao)+
          ', sigla = '+ QuotedStr(aUnidadeMedidaDTO.sigla)+
          ', permite_decimal = '+ QuotedStr(aUnidadeMedidaDTO.permite_decimal)+
          ' WHERE idunidade_medida = '+ IntToStr(aUnidadeMedidaDTO.idunidade_medida);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
