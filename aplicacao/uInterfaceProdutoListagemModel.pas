unit uInterfaceProdutoListagemModel;

interface

uses
  FireDAC.Comp.Client, uProdutoListaHash;

type
  IInterfaceProdutoListagemModel = interface
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValdiarExcluir(const aID: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxProduto(out aLista: TProdutoListaHash): Boolean;
  end;

implementation

end.
