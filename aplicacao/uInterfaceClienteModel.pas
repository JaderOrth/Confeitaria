unit uInterfaceClienteModel;

interface

uses
  FireDAC.Comp.Client, uClienteDTO;

type
  IInterfaceClienteModel = interface
    function MontarGrid(aMenTable: TFDMemTable): Boolean;
  end;

implementation

end.
