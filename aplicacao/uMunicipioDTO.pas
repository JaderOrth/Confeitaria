unit uMunicipioDTO;

interface


type
  TMunicipioDTO = class
  private
    FIdMunicipio: Integer;
    FIdEstado: Integer;
    FDescrição: String;
    procedure SetDescrição(const Value: String);
    procedure SetIdEstado(const Value: Integer);
    procedure SetIdMunicipio(const Value: Integer);
  public
    property IdMunicipio: Integer read FIdMunicipio write SetIdMunicipio;
    property Descrição: String read FDescrição write SetDescrição;
    property IdEstado: Integer read FIdEstado write SetIdEstado;
  end;

implementation

{ TMunicipioDTO }

procedure TMunicipioDTO.SetDescrição(const Value: String);
begin
  FDescrição := Value;
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
