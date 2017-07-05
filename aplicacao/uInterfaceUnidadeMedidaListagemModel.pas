unit uInterfaceUnidadeMedidaListagemModel;

interface
  uses
  FireDAC.Comp.Client, uUnidadeMedidaListaHash;

type
  IInterfaceUnidadeMedidaListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxUnidadeMedida(var aLista: TUnidadeMedidaListaHash): Boolean;
  end;

implementation

end.
