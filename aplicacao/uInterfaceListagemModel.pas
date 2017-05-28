unit uInterfaceListagemModel;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type
  IInterfaceListagemModel = interface
    function Excluir(const iID: Integer):Boolean;
    function MontarGrid(oMemTable: TFDMemTable):Boolean;
    function BuscarGrid(aMemTable: TFDMemTable; aPesquisa: String): Boolean;

  end;

implementation

end.
