unit uInterfacePedidoListagem;

interface

uses
  FireDAC.Comp.Client;
type
  IInterfacePedidoListagem = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;
implementation

end.
