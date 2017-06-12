unit uInterfaceMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client, uMunicipioListaHash;

type
  IInterfaceMunicipioListagemModel = interface
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
    function ComboBox(var aLista: TMunicipioListaHash; iID: Integer): Boolean;
  end;

implementation

end.
