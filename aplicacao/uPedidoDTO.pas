unit uPedidoDTO;

interface

uses
  uITensPedidoListaHash, System.Classes, System.SysUtils, Vcl.StdCtrls,
  System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Controls;

type
  TPedidoDTO = class
  private
    Fobservacao: String;
    FdataPedido: TDate;
    FentregaEndereco: String;
    FidUsuario: Integer;
    FdataEntrega: TDateTime;
    FresponsavelPedido: String;
    FidBairro: Integer;
    FtotalPedido: Currency;
    FidPedido: Integer;
    FentregaNumero: String;
    FidCliente: Integer;
    FentregaComplemento: String;
    FhoraEntrega: TTime;
    FitensPedido: TItensPedidoListaHash;

    procedure SetdataEntrega(const Value: TDateTime);
    procedure SetdataPedido(const Value: TDate);
    procedure SetentregaComplemento(const Value: String);
    procedure SetentregaEndereco(const Value: String);
    procedure SetentregaNumero(const Value: String);
    procedure SetidBairro(const Value: Integer);
    procedure SetidCliente(const Value: Integer);
    procedure SetidPedido(const Value: Integer);
    procedure SetidUsuario(const Value: Integer);
    procedure Setobservacao(const Value: String);
    procedure SetresponsavelPedido(const Value: String);
    procedure SettotalPedido(const Value: Currency);
    procedure SethoraEntrega(const Value: TTime);
    procedure SetitensPedido(const Value: TItensPedidoListaHash);
  public
    property idPedido: Integer read FidPedido write SetidPedido;
    property dataPedido: TDate read FdataPedido write SetdataPedido;
    property dataEntrega: TDateTime read FdataEntrega
      write SetdataEntrega;
    property observacao: String read Fobservacao write Setobservacao;
    property totalPedido: Currency read FtotalPedido write SettotalPedido;
    property idCliente: Integer read FidCliente write SetidCliente;
    property entregaEndereco: String read FentregaEndereco
      write SetentregaEndereco;
    property entregaNumero: String read FentregaNumero write SetentregaNumero;
    property entregaComplemento: String read FentregaComplemento
      write SetentregaComplemento;
    property idBairro: Integer read FidBairro write SetidBairro;
    property responsavelPedido: String read FresponsavelPedido
      write SetresponsavelPedido;
    property idUsuario: Integer read FidUsuario write SetidUsuario;
    property horaEntrega: TTime read FhoraEntrega write SethoraEntrega;
    property ItensPedido: TItensPedidoListaHash read FitensPedido
      write SetitensPedido;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPedidoDTO }

constructor TPedidoDTO.Create;
begin
  FitensPedido := TItensPedidoListaHash.Create([doOwnsValues]);
end;

destructor TPedidoDTO.Destroy;
begin
//  if (Assigned(FitensPedido)) then
//    FreeAndNil(FitensPedido);
  inherited;
end;

procedure TPedidoDTO.SetdataEntrega(const Value: TDateTime);
begin
  FdataEntrega := Value;
end;

procedure TPedidoDTO.SetdataPedido(const Value: TDate);
begin
  FdataPedido := Value;
end;

procedure TPedidoDTO.SetentregaComplemento(const Value: String);
begin
  FentregaComplemento := Value;
end;

procedure TPedidoDTO.SetentregaEndereco(const Value: String);
begin
  FentregaEndereco := Value;
end;

procedure TPedidoDTO.SetentregaNumero(const Value: String);
begin
  FentregaNumero := Value;
end;

procedure TPedidoDTO.SethoraEntrega(const Value: TTime);
begin
  FhoraEntrega := Value;
end;

procedure TPedidoDTO.SetidBairro(const Value: Integer);
begin
  FidBairro := Value;
end;

procedure TPedidoDTO.SetidCliente(const Value: Integer);
begin
  FidCliente := Value;
end;

procedure TPedidoDTO.SetidPedido(const Value: Integer);
begin
  FidPedido := Value;
end;

procedure TPedidoDTO.SetidUsuario(const Value: Integer);
begin
  FidUsuario := Value;
end;

procedure TPedidoDTO.SetitensPedido(const Value: TItensPedidoListaHash);
begin
  FitensPedido := Value;
end;

procedure TPedidoDTO.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TPedidoDTO.SetresponsavelPedido(const Value: String);
begin
  FresponsavelPedido := Value;
end;

procedure TPedidoDTO.SettotalPedido(const Value: Currency);
begin
  FtotalPedido := Value;
end;

end.
