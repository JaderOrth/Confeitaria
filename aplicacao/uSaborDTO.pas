unit uSaborDTO;

interface

type
  TSaborDTO = class
  private
    Fdescricao: string;
    Fingredientes: string;
    Fidsabores: integer;
    procedure Setdescricao(const Value: string);
    procedure Setidsabores(const Value: integer);
    procedure Setingredientes(const Value: string);
 public
    property idsabores : integer read Fidsabores write Setidsabores;
    property descricao : string read Fdescricao write Setdescricao;
    property ingredientes : string read Fingredientes write Setingredientes;
end;

implementation

{ TSaborDTO }

procedure TSaborDTO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TSaborDTO.Setidsabores(const Value: integer);
begin
  Fidsabores := Value;
end;

procedure TSaborDTO.Setingredientes(const Value: string);
begin
  Fingredientes := Value;
end;

end.
