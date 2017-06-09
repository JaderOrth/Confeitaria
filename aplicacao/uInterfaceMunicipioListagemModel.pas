unit uInterfaceMunicipioListagemModel;

interface

uses
  FireDAC.Comp.Client;

type
  IInterfaceMunicipioListagemModel = interface
    function Excluir(const iID: Integer): Boolean;
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
  end;

implementation

end.
