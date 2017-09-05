unit uLoginModel;

interface

uses
  FireDAC.Comp.Client,System.SysUtils,
  uLoginDTO, uClassConexaoSingleton;

type
  TLoginModel = class
  public
    function Login(var oLoginDTO: TLoginDTO): Boolean;

  end;

implementation

{ TLoginModel }

function TLoginModel.Login(var oLoginDTO: TLoginDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idusuario,senha,usuario FROM usuario where usuario = '+
                QuotedStr(oLoginDTO.Nome)+' AND senha = '+ QuotedStr(oLoginDTO.Senha));
    if (not(oQuery.IsEmpty)) then
    begin
      oLoginDTO.ID := oQuery.FieldByName('idusuario').AsInteger;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);

  end;

end;

end.
