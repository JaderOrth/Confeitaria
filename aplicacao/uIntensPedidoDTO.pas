unit uIntensPedidoDTO;

interface


type
  TItensPedidoDTO = class
  private
    Fobservacao: String;
    Fsabores: TArray<Integer>;
    FidProduto: Integer;
    FvalorTotal: Double;
    Fquantidade: Double;
    procedure SetidProduto(const Value: Integer);
    procedure Setobservacao(const Value: String);
    procedure Setquantidade(const Value: Double);
    procedure Setsabores(const Value: TArray<Integer>);
    procedure SetvalorTotal(const Value: Double);
  public
    property idProduto: Integer read FidProduto write SetidProduto;
    property quantidade: Double read Fquantidade write Setquantidade;
    property observacao: String read Fobservacao write Setobservacao;
    property valorTotal: Double read FvalorTotal write SetvalorTotal;
    property sabores: TArray<Integer> read Fsabores write Setsabores;

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

procedure TItensPedidoDTO.Setsabores(const Value: TArray<Integer>);
begin
  Fsabores := Value;
end;

procedure TItensPedidoDTO.SetvalorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;


end.
