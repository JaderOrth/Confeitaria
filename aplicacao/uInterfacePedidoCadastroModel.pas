unit uInterfacePedidoCadastroModel;

interface

type
  IInterfacePedidoCadastroModel = interface
    function ValidarCamposItensPedido(const aId: Integer; out sSabor: String;
      out aValor: Double): Boolean;

  end;

implementation

end.
