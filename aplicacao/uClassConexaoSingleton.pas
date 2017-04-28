unit uClassConexaoSingleton;

interface

uses
  System.SysUtils, uClassConexao;

type
  TConexaoSingleton = class
  private
    class var oConexao: TConexao;
  public
    class function GetInstancia: TConexao;
  end;

implementation

{ TConexaoSingleton }

class function TConexaoSingleton.GetInstancia: TConexao;
begin
  if (not(Assigned(oConexao))) then
    oConexao := TConexao.Create(nil);

  Result := oConexao;
end;

initialization

finalization
  if (Assigned(TConexaoSingleton.oConexao)) then
    FreeAndNil(TConexaoSingleton.oConexao);

end.
