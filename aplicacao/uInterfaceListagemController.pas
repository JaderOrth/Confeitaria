unit uInterfaceListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.DBGrids;

type
  IInterfaceListagemController = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
    procedure Excluir(oMemtable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);
  end;

implementation

end.


