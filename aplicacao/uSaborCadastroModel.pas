unit uSaborCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceSaborCadastroModel, uSaborDTO, uClassConexaoSingleton;

type
  TSaborCadastroModel = class(TInterfacedObject, IInterfaceSaborCadastroModel)
  public
    function SelectUpdate(var aSaborDTO: TSaborDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aSaborDTO: TSaborDTO): Boolean;
    function update(const aSaborDTO: TSaborDTO): Boolean;
  end;

implementation

{ TSaborCadastroModel }

function TSaborCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idsabores) as id FROM sabores');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TSaborCadastroModel.Insert(const aSaborDTO: TSaborDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO sabores(idsabores, descricao, ingredientes) VALUES('+
          IntToStr(aSaborDTO.idsabores)+', '+
          QuotedStr(aSaborDTO.descricao)+', '+
          QuotedStr(aSaborDTO.ingredientes)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;


function TSaborCadastroModel.SelectUpdate(var aSaborDTO: TSaborDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, ingredientes '+
                'FROM sabores '+
                'WHERE idsabores ='+
                IntToStr(aSaborDTO.idsabores));
    if (not(oQuery.IsEmpty)) then
    begin
      aSaborDTO.descricao := oQuery.FieldByName('descricao').AsString;
      aSaborDTO.ingredientes := oQuery.FieldByName('ingredientes').AsString;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TSaborCadastroModel.update(const aSaborDTO: TSaborDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE sabores SET descricao = '+ QuotedStr(aSaborDTO.descricao)+
          ', ingredientes = '+ QuotedStr(aSaborDTO.ingredientes)+
          ' WHERE idsabores = '+ IntToStr(aSaborDTO.idsabores);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
