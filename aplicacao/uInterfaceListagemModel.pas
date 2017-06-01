unit uInterfaceListagemModel;

interface

uses
  System.Classes, FireDAC.Comp.Client, uMunicipioListaHash;

type
  IInterfaceListagemModel = interface
    function Excluir(const iID: Integer):Boolean;
    function MontarGrid(oMemTable: TFDMemTable):Boolean;
    function BuscarGrid(aMemTable: TFDMemTable; const aPesquisa: String): Boolean;
    function ComboBox(ALista: TMunicipioListaHash): Boolean;

  end;

implementation

end.
