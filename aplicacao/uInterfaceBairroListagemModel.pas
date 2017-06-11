unit uInterfaceBairroListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceBairroListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

end.
