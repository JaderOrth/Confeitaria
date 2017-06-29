unit uInterfaceSaborListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceSaborListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
end;

implementation

end.
