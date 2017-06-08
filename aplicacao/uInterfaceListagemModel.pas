unit uInterfaceListagemModel;

interface

uses
  System.Classes, FireDAC.Comp.Client, uMunicipioListaHash;

type
{$M+}
  IInterfaceListagemModel = interface
  ['{20DC1C9C-1CAF-4311-8F2B-F30FE20D7472}']
    function Excluir(var iID: Integer):Boolean;
    function MontarGrid(oMemTable: TFDMemTable):Boolean;
    function ComboBox(ALista: TMunicipioListaHash): Boolean;

  end;
{$M-}

implementation

end.
