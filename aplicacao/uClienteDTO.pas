unit uClienteDTO;

interface

type
  TClienteDTO = class
  private
    FCPF_CNPJ: Currency;
    FObservacao: String;
    FNumero: String;
    FIdBairro: Integer;
    FComplemento: String;
    FIdCliente: Integer;
    FEndereco: String;
    FTelefone: Currency;
    FCelular: Currency;
    procedure SetCelular(const Value: Currency);
    procedure SetComplemento(const Value: String);
    procedure SetCPF_CNPJ(const Value: Currency);
    procedure SetEndereco(const Value: String);
    procedure SetIdBairro(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNumero(const Value: String);
    procedure SetObservacao(const Value: String);
    procedure SetTelefone(const Value: Currency);
  public
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property Endereco: String read FEndereco write SetEndereco;
    property Numero: String read FNumero write SetNumero;
    property Complemento: String read FComplemento write SetComplemento;
    property Observacao: String read FObservacao write SetObservacao;
    property CPF_CNPJ: Currency read FCPF_CNPJ write SetCPF_CNPJ;
    property Telefone: Currency read FTelefone write SetTelefone;
    property Celular: Currency read FCelular write SetCelular;
    property IdBairro: Integer read FIdBairro write SetIdBairro;
  end;

implementation

{ TClienteDTO }

procedure TClienteDTO.SetCelular(const Value: Currency);
begin
  FCelular := Value;
end;

procedure TClienteDTO.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TClienteDTO.SetCPF_CNPJ(const Value: Currency);
begin
  FCPF_CNPJ := Value;
end;

procedure TClienteDTO.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TClienteDTO.SetIdBairro(const Value: Integer);
begin
  FIdBairro := Value;
end;

procedure TClienteDTO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TClienteDTO.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TClienteDTO.SetObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TClienteDTO.SetTelefone(const Value: Currency);
begin
  FTelefone := Value;
end;

end.
