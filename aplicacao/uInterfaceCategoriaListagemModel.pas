unit uInterfaceCategoriaListagemModel;

interface

uses
  FireDAC.Comp.Client, uCategoriaListaHash;

type
  IInterfaceCategoriasListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxCategoria(var aLista: TCategoriaListaHash): Boolean;
  end;

implementation

end.
