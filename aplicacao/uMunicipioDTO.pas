unit uMunicipioDTO;

interface


type
  TMunicipioDTO = class
  private
    FIdMunicipio: Integer;
    FIdEstado: Integer;
    FDescri��o: String;
    procedure SetDescri��o(const Value: String);
    procedure SetIdEstado(const Value: Integer);
    procedure SetIdMunicipio(const Value: Integer);
  public
    property IdMunicipio: Integer read FIdMunicipio write SetIdMunicipio;
    property Descri��o: String read FDescri��o write SetDescri��o;
    property IdEstado: Integer read FIdEstado write SetIdEstado;
  end;

implementation

{ TMunicipioDTO }

procedure TMunicipioDTO.SetDescri��o(const Value: String);
begin
  FDescri��o := Value;
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
