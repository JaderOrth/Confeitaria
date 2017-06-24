unit uInterfaceUsuarioListagemModel;

interface

uses
  FireDAC.Comp.Client,
  uUsuarioDTO;

type
  IInterfaceUsuarioListagemModel = interface
    function BuscarGrid(aMemTable: TFDMemTable): Boolean;
    function Excluir(aID: Integer): Boolean;
  end;

implementation

end.
