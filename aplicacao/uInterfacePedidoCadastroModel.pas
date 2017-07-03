unit uInterfacePedidoCadastroModel;

interface

type
  IInterfacePedidoCadastroModel = interface
    function ValidarCamposItensPedido(const aId: Integer;
      out sSabor: String): Boolean;
  end;

implementation

end.
