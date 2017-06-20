unit uUsuarioCadastroRegra;

interface

uses
  System.Classes, System.SysUtils,
  uInterfaceUsuarioCadastroModel, uUsuarioDTO;

type
  TUsuarioCadastroRegra = class
  public
    function Validar(const aUsuarioDTO: TUsuarioDTO): Integer;
    function Salvar(const aUsuarioDTO: TUsuarioDTO;
      const aModel: IInterfaceUsuarioCadastroModel): Integer;
  end;

implementation

{ TUsuarioCadastroRegra }

function TUsuarioCadastroRegra.Salvar(const aUsuarioDTO: TUsuarioDTO;
  const aModel: IInterfaceUsuarioCadastroModel): Integer;
begin
  if (aUsuarioDTO.idUsuario > 0) then
  begin

  end
  else
  begin

  end;
end;

function TUsuarioCadastroRegra.Validar(const aUsuarioDTO: TUsuarioDTO): Integer;
begin
  if (Trim(aUsuarioDTO.usuario).IsEmpty) then
  begin
    Result := 1;
    exit;
  end;

  if (Length(Trim(aUsuarioDTO.senha)) < 6) then
  begin
    Result := 2;
    exit;
  end;
end;

end.
