unit uClassConexao;

interface

uses
  System.Classes, System.SysUtils,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.MySQL, FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Async;

type
  TConexao = class(TFDConnection)
  private
    oWaitCursor: TFDGUIxWaitCursor;
    oDriverLink: TFDPhysMySQLDriverLink;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;
implementation

{ TConexao }

constructor TConexao.Create(AOwner: TComponent);
begin
  inherited;
  oWaitCursor := TFDGUIxWaitCursor.Create(nil);
  oDriverLink := TFDPhysMySQLDriverLink.Create(nil);

  Params.DriverID := 'MySql';
  LoginPrompt := False;
  Params.Values['Database'] := 'confeitaria';
  Params.Values['User_Name'] := 'root';
  Params.Values['Password'] := '';
  Params.Values['Port'] := '3306';
  Params.Values['Server'] := '127.0.0.1';
  Connected := True;
end;

destructor TConexao.Destroy;
begin
  Connected := False;

  if (Assigned(oWaitCursor)) then
    FreeAndNil(oWaitCursor);

  if (Assigned(oDriverLink)) then
    FreeAndNil(oDriverLink);

  inherited;
end;

end.
