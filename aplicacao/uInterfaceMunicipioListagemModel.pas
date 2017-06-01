unit uInterfaceMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceMunicipioListagemModel = interface
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function BuscarGrid(aMemTable: TFDMemTable;
      const aPesquisa: String): Boolean;
  end;

implementation

end.
