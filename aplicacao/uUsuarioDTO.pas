unit uUsuarioDTO;

interface


type
  TUsuarioDTO = class
  private
    FidUsuario: Integer;
    Fsenha: String;
    Fusuario: String;
    procedure SetidUsuario(const Value: Integer);
    procedure Setsenha(const Value: String);
    procedure Setusuario(const Value: String);
  public
    property idUsuario: Integer read FidUsuario write SetidUsuario;
    property usuario: String read Fusuario write Setusuario;
    property senha: String read Fsenha write Setsenha;
  end;
implementation

{ TUsuarioDTO }

procedure TUsuarioDTO.SetidUsuario(const Value: Integer);
begin
  FidUsuario := Value;
end;

procedure TUsuarioDTO.Setsenha(const Value: String);
begin
  Fsenha := Value;
end;

procedure TUsuarioDTO.Setusuario(const Value: String);
begin
  Fusuario := Value;
end;

end.
