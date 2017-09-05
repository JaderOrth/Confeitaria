unit uLoginDto;

interface


type
  TLoginDTO = class
  private
    FID: Integer;
    FSenha: String;
    FNome: string;
    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetSenha(const Value: String);
  public
    property ID: Integer read FID write SetID;
    property Nome: string read FNome write SetNome;
    property Senha: String read FSenha write SetSenha;
  end;

implementation

{ TLoginDTO }

procedure TLoginDTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TLoginDTO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TLoginDTO.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.
