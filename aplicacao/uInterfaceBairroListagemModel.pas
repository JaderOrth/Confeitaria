unit uInterfaceBairroListagemModel;

interface

uses
  FireDAC.Comp.Client, uBairroListaHash;

type
  IInterfaceBairroListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxBairro(var aLista: TBairroListaHash;
      const aId: Integer): Boolean;
  end;

implementation

end.
