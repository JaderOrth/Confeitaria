unit uInterfacePedidoCadastroModel;

interface

uses
  uPedidoDTO, FireDAC.Comp.Client;

type
  IInterfacePedidoCadastroModel = interface
    function ValidarCamposItensPedido(const aId: Integer; out sSabor: String;
      out aValor: Double): Boolean;
    function BurscarIdPedido: Integer;
    function InsertPedido(const aPedidoDTO: TPedidoDTO): Boolean;
    function InsertItensPedido(const aPedido: TPedidoDTO): Boolean;
    function UpdateItensPedido(const aPedido: TPedidoDTO): Boolean;




    function DeleteItensPedido(const aId: Integer): Boolean;
    function DeleteItemPedidoSabores(const aId: Integer): Boolean;
    function BuscarUpdate(out aPedidoDTO: TPedidoDTO; const aId: Integer): Boolean;
    function BuscarEstadoMunicipio(const aBairo: Integer;
      out aEstado, aMunicipio: Integer): Boolean;
    function BuscarItensPedido(const aId: Integer; out aPedidoDTO: TPedidoDTO): Boolean;
    function BuscarNomeProduto(const aID: Integer; out aNome: String): Boolean;
    function BuscarCliente(var aProduto: TPedidoDTO; out aMunicipio,
    aEstado: Integer): Boolean;
  end;

implementation

end.
