unit uInterfacePedidoListagem;

interface

uses
  FireDAC.Comp.Client;
type
  IInterfacePedidoListagem = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
  end;
implementation

end.
