unit uProdutoDTO;

interface

type
  TProdutoDTO = class
  private
    Fsabor: String;
    Fpreco: Currency;
    Fdescricao: string;
    FunidadeMedida: Integer;
    FidProduto: Integer;
    FidCategoria: Integer;
    procedure Setdescricao(const Value: string);
    procedure SetidCategoria(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure Setpreco(const Value: Currency);
    procedure Setsabor(const Value: String);
    procedure SetunidadeMedida(const Value: Integer);
  public
    property idProduto: Integer read FidProduto write SetidProduto;
    property descricao: string read Fdescricao write Setdescricao;
    property preco: Currency read Fpreco write Setpreco;
    property sabor: String read Fsabor write Setsabor;
    property idCategoria: Integer read FidCategoria write SetidCategoria;
    property unidadeMedida: Integer read FunidadeMedida write SetunidadeMedida;
  end;

implementation


{ TProdutoDTO }

procedure TProdutoDTO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TProdutoDTO.SetidCategoria(const Value: Integer);
begin
  FidCategoria := Value;
end;

procedure TProdutoDTO.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TProdutoDTO.Setpreco(const Value: Currency);
begin
  Fpreco := Value;
end;

procedure TProdutoDTO.Setsabor(const Value: String);
begin
  Fsabor := Value;
end;

procedure TProdutoDTO.SetunidadeMedida(const Value: Integer);
begin
  FunidadeMedida := Value;
end;

end.
