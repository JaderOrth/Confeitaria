unit uIntensPedidoDTO;

interface


type
  TSaboresItens = array of integer;

  TItensPedidoDTO = class
  private
    Fid: Integer;
    Fobservacao: String;
    Fsabores: TSaboresItens;
    FidProduto: Integer;
    FvalorTotal: Double;
    Fquantidade: Double;
    procedure SetidProduto(const Value: Integer);
    procedure Setid(const Value: Integer);
    procedure Setobservacao(const Value: String);
    procedure Setquantidade(const Value: Double);
    procedure Setsabores(const Value: TSaboresItens);
    procedure SetvalorTotal(const Value: Double);
  public
    property id: Integer read Fid write Setid;
    property idProduto: Integer read FidProduto write SetidProduto;
    property quantidade: Double read Fquantidade write Setquantidade;
    property observacao: String read Fobservacao write Setobservacao;
    property valorTotal: Double read FvalorTotal write SetvalorTotal;
    property sabores: TSaboresItens read Fsabores write Setsabores;
  end;

implementation

{ TItensPedidoDTO }

procedure TItensPedidoDTO.Setid(const Value: Integer);
begin
  Fid := Value;
end;

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

procedure TItensPedidoDTO.Setsabores(const Value: TSaboresItens);
begin
  Fsabores := Value;
end;

procedure TItensPedidoDTO.SetvalorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;


end.
