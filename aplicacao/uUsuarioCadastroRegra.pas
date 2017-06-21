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
    function BuscarUpdate(var aUsuarioDTO: TUsuarioDTO;
      const aModel: IInterfaceUsuarioCadastroModel): Boolean;
    procedure LimparDTO(const aUsuarioDTO: TUsuarioDTO);
  end;

implementation

{ TUsuarioCadastroRegra }

function TUsuarioCadastroRegra.BuscarUpdate(var aUsuarioDTO: TUsuarioDTO;
  const aModel: IInterfaceUsuarioCadastroModel): Boolean;
begin
  Result := aModel.BuscarUpdate(aUsuarioDTO);
end;

procedure TUsuarioCadastroRegra.LimparDTO(const aUsuarioDTO: TUsuarioDTO);
begin
  aUsuarioDTO.idUsuario := 0;
  aUsuarioDTO.usuario := EmptyStr;
  aUsuarioDTO.senha := EmptyStr;
end;

function TUsuarioCadastroRegra.Salvar(const aUsuarioDTO: TUsuarioDTO;
  const aModel: IInterfaceUsuarioCadastroModel): Integer;
begin
  if (aUsuarioDTO.idUsuario > 0) then
  begin
    if (aModel.Update(aUsuarioDTO)) then
    begin
      Result := 1;
      exit;
    end
    else
    begin
      Result := 2;
      exit;
    end;
  end
  else
  begin
    aUsuarioDTO.idUsuario := aModel.BuscarID;
    if (aModel.Insert(aUsuarioDTO)) then
    begin
      Result := 3;
      exit;
    end
    else
    begin
      Result := 4;
      exit;
    end;
  end;
end;

function TUsuarioCadastroRegra.Validar(const aUsuarioDTO: TUsuarioDTO): Integer;
begin
  Result := 0;
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
