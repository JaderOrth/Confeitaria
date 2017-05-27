unit uInterfaceListagemModel;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type
  IInterfaceListagemModel = interface
  function MontarGrid (oMemTable : TFDMeMTable):Boolean;

  end;

implementation

end.
