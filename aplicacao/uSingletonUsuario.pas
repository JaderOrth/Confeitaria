unit uSingletonUsuario;

interface

uses
  System.SysUtils;

type
  TSingletonUsuario = class
  private
    class var ID: Integer;
  public
    class procedure SetId(Values: Integer);
    class function getId: Integer;
  end;

implementation

{ TSingletonUsuario }

class function TSingletonUsuario.getId: Integer;
begin
  Result := ID;
end;

class procedure TSingletonUsuario.SetId(Values: Integer);
begin
  ID := Values;
end;

end.
