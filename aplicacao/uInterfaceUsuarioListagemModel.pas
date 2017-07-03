unit uInterfaceUsuarioListagemModel;

interface

uses
  FireDAC.Comp.Client,
  uUsuarioDTO;

type
  IInterfaceUsuarioListagemModel = interface
    function BuscarGrid(aMemTable: TFDMemTable): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function Excluir(aID: Integer): Boolean;
  end;

implementation

end.
