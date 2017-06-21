unit uCategoriasDTO;

interface

type
  TCategoriasDTO = class
  private
    Fdescricao: string;
    Fidcategoria: integer;
    procedure Setdescricao(const Value: string);
    procedure Setidcategoria(const Value: integer);
  public
    property idcategoria : integer read Fidcategoria write Setidcategoria;
    property descricao : string read Fdescricao write Setdescricao;
  end;

implementation

{ TCategoriasDTO }

procedure TCategoriasDTO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TCategoriasDTO.Setidcategoria(const Value: integer);
begin
  Fidcategoria := Value;
end;

end.
