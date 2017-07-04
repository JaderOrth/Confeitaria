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
  end;

implementation

end.
