unit uInterfaceClienteModel;

interface

uses
  FireDAC.Comp.Client, uClienteDTO, uClienteListaHash;

type
  IInterfaceClienteModel = interface
    function MontarGrid(aMenTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ValidarExcluir(const aId: Integer): Boolean;
    function ComboBoxCliente(out aLista: TClienteListaHash): Boolean;
  end;

implementation

end.
