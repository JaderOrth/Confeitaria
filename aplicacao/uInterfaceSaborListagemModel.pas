unit uInterfaceSaborListagemModel;

interface

uses
  FireDAC.Comp.Client, uSaborListaHash;

type
  IInterfaceSaborListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function CheckSabor(var aLista: TSaborListaHash): Boolean;
end;

implementation

end.
