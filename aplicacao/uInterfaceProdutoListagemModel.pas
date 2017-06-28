unit uInterfaceProdutoListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceProdutoListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

end.
