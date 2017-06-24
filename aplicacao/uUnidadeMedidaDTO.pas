unit uUnidadeMedidaDTO;

interface

type
  TUnidadeMedidaDTO = class
  private
    Fdescricao: string;
    Fidunidade_medida: Integer;
    Fsigla: string;
    Fpermite_decimal: string;
    procedure Setdescricao(const Value: string);
    procedure Setidunidade_medida(const Value: Integer);
    procedure Setpermite_decimal(const Value: string);
    procedure Setsigla(const Value: string);
  public
    property idunidade_medida: Integer read Fidunidade_medida write Setidunidade_medida;
    property descricao: string read Fdescricao write Setdescricao;
    property sigla: string read Fsigla write Setsigla;
    property permite_decimal: string read Fpermite_decimal write Setpermite_decimal;
  end;

implementation

{ TUnidadeMedidaDTO }

procedure TUnidadeMedidaDTO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TUnidadeMedidaDTO.Setidunidade_medida(const Value: Integer);
begin
  Fidunidade_medida := Value;
end;

procedure TUnidadeMedidaDTO.Setpermite_decimal(const Value: string);
begin
  Fpermite_decimal := Value;
end;

procedure TUnidadeMedidaDTO.Setsigla(const Value: string);
begin
  Fsigla := Value;
end;

end.
