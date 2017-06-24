unit uUsuarioCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceUsuarioCadastroModel, uUsuarioDTO, uClassConexaoSingleton;

type
  TUsuarioCadastroModel = class(TInterfacedObject,
    IInterfaceUsuarioCadastroModel)
  public
    function BuscarID: Integer;
    function Insert(const aUsuarioDTO: TUsuarioDTO): boolean;
    function Update(const aUsuarioDTO: TUsuarioDTO): boolean;
    function BuscarUpdate(var aUsuarioDTO: TUsuarioDTO): boolean;
  end;

implementation

{ TUsuarioCadastroModel }

function TUsuarioCadastroModel.BuscarID: Integer;
var
  oQuery: TFdQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idusuario) AS id FROM usuario');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TUsuarioCadastroModel.BuscarUpdate(
  var aUsuarioDTO: TUsuarioDTO): boolean;
var
  oQuery: TFDQuery;
begin
  Result := false;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT usuario, senha FROM usuario WHERE idusuario = '+
                IntToStr(aUsuarioDTO.idUsuario));
    if (not(oQuery.IsEmpty)) then
    begin
      aUsuarioDTO.usuario := oQuery.FieldByName('usuario').AsString;
      aUsuarioDTO.senha := oQuery.FieldByName('senha').AsString;
      Result := true;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;

end;

function TUsuarioCadastroModel.Insert(const aUsuarioDTO: TUsuarioDTO): boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO usuario(idusuario, usuario, senha)'+
          ' VALUES('+IntToStr(aUsuarioDTO.idUsuario)+
          ', '+ QuotedStr(aUsuarioDTO.usuario)+
          ', '+QuotedStr(aUsuarioDTO.senha)+')';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TUsuarioCadastroModel.Update(const aUsuarioDTO: TUsuarioDTO): boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE usuario SET usuario ='+
          QuotedStr(aUsuarioDTO.usuario)+', senha = '+
          QuotedStr(aUsuarioDTO.senha)+
          ' WHERE idusuario = '+ IntToStr(aUsuarioDTO.idUsuario);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
