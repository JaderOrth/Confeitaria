unit uLoginController;

interface

uses
  System.classes, System.SysUtils, Vcl.Dialogs,
  uLoginDto, uLoginModel, uSingletonUsuario;

type
  TLoginController = class
  private
    oLoginDTO: TLoginDTO;
    oModel: TLoginModel;

  public
    function Login(var oLogin: TLoginDTO): Boolean;



    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TLoginController }

constructor TLoginController.Create;
begin
  if (not(Assigned(oLoginDTO))) then
    oLoginDTO := TLoginDTO.Create;
  if (not(Assigned(oModel))) then
    oModel := TLoginModel.Create;
end;

destructor TLoginController.Destroy;
begin
  if (Assigned(oLoginDTO)) then
    FreeAndNil(oLoginDTO);
  if (Assigned(oModel)) then
    FreeAndNil(oModel);
  inherited;
end;

function TLoginController.Login(var oLogin: TLoginDTO): Boolean;
begin
  Result := False;
  if (oModel.Login(oLogin)) then
  begin
    TSingletonUsuario.SetId(oLoginDTO.ID);
    Result := True;
  end
  else
  begin
    MessageDlg('Erro no login, preencha todos os campos corretamente!', mtError,[mbOK] , 0);
    exit;
  end;

end;

end.
