unit uInterfacePedidoCadastroModel;

interface

uses
  uPedidoDTO;

type
  IInterfacePedidoCadastroModel = interface
    function ValidarCamposItensPedido(const aId: Integer; out sSabor: String;
      out aValor: Double): Boolean;
    function BurscarIdPedido: Integer;
    function InsertPedido(const aPedidoDTO: TPedidoDTO): Boolean;
    function InsertItensPedido(const aPedido: TPedidoDTO): Boolean;
    function DeleteItensPedido(const aId: Integer): Boolean;
    function BuscarUpdate(out aPedidoDTO: TPedidoDTO; const aId: Integer): Boolean;
    function BuscarEstadoMunicipio(const aBairo: Integer;
      out aEstado, aMunicipio: Integer): Boolean;
  end;

implementation

end.
