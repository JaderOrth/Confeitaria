unit uInterfaceListagemRegra;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type
  IInterfaceListagemRegra = interface
  function MontarGrid (oMemTable : TFDMeMTable):Boolean;

  end;

implementation

end.
