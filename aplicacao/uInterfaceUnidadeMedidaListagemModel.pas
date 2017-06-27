unit uInterfaceUnidadeMedidaListagemModel;

interface
  uses
  FireDAC.Comp.Client;

type
  IInterfaceUnidadeMedidaListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

end.
