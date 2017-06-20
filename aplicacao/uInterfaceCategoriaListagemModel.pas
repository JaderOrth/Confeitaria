unit uInterfaceCategoriaListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceCategoriasListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

end.
