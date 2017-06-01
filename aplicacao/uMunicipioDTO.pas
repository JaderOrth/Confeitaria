unit uMunicipioDTO;

interface


type
  TMunicipioDTO = class
  private
    FIdMunicipio: Integer;
    FIdEstado: Integer;
    FDescricao: String;
    procedure SetDescricao(const Value: String);
    procedure SetIdEstado(const Value: Integer);
    procedure SetIdMunicipio(const Value: Integer);
  public
    property IdMunicipio: Integer read FIdMunicipio write SetIdMunicipio;
    property Descricao: String read FDescricao write SetDescricao;
    property IdEstado: Integer read FIdEstado write SetIdEstado;
  end;

implementation

{ TMunicipioDTO }

procedure TMunicipioDTO.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TMunicipioDTO.SetIdEstado(const Value: Integer);
begin
  FIdEstado := Value;
end;

procedure TMunicipioDTO.SetIdMunicipio(const Value: Integer);
begin
  FIdMunicipio := Value;
end;

end.
