unit uBairroDTO;

interface

type
  TBairroDTO = class
  private
    FidMunicipio: Integer;
    FDescricao: String;
    FidBairro: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetidBairro(const Value: Integer);
    procedure SetidMunicipio(const Value: Integer);

  public
    property idBairro: Integer read FidBairro write SetidBairro;
    property Descricao: String read FDescricao write SetDescricao;
    property idMunicipio: Integer read FidMunicipio write SetidMunicipio;
  end;

implementation

{ TBairroDTO }

procedure TBairroDTO.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBairroDTO.SetidBairro(const Value: Integer);
begin
  FidBairro := Value;
end;

procedure TBairroDTO.SetidMunicipio(const Value: Integer);
begin
  FidMunicipio := Value;
end;

end.
