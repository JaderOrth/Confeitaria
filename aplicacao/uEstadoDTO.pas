unit uEstadoDTO;

interface


type
  TEstadoDTO = class
  private
    FUF: String;
    FDescricao: String;
    FID: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetUF(const Value: String);
  public
    property ID: Integer read FID write SetID;
    property UF: String read FUF write SetUF;
    property Descricao: String read FDescricao write SetDescricao;
  end;
implementation

{ TEstadoDTO }

procedure TEstadoDTO.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TEstadoDTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TEstadoDTO.SetUF(const Value: String);
begin
  FUF := Value;
end;

end.
