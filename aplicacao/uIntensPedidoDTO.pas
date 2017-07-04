unit uIntensPedidoDTO;

interface


type
  TItensPedidoDTO = class
  private
    Fobservacao: String;
    FidProduto: Integer;
    FvalorTotal: Currency;
    Fquantidade: Double;
    procedure SetidProduto(const Value: Integer);
    procedure Setobservacao(const Value: String);
    procedure Setquantidade(const Value: Double);
    procedure SetvalorTotal(const Value: Currency);
  public
    property idProduto: Integer read FidProduto write SetidProduto;
    property quantidade: Double read Fquantidade write Setquantidade;
    property observacao: String read Fobservacao write Setobservacao;
    property valorTotal: Currency read FvalorTotal write SetvalorTotal;
  end;

implementation

{ TItensPedidoDTO }

procedure TItensPedidoDTO.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TItensPedidoDTO.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TItensPedidoDTO.Setquantidade(const Value: Double);
begin
  Fquantidade := Value;
end;

procedure TItensPedidoDTO.SetvalorTotal(const Value: Currency);
begin
  FvalorTotal := Value;
end;

end.
