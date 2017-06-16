unit uInterfaceClienteModel;

interface

uses
  FireDAC.Comp.Client, uClienteDTO;

type
  IInterfaceClienteModel = interface
    function MontarGrid(aMenTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;

  end;

implementation

end.
