unit uInterfaceListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.DBGrids;

type
  IInterfaceListagemController = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure ConfigurarGrid(AGrid: TDBGrid);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemtable: TFDMemTable; AGrid: TDBGrid);
    procedure Excluir(oMemtable: TFDMemTable; AGrid: TDBGrid);
    procedure BuscarGrid(aMemTable: TFDMemTable; AGrid: TDBGrid;
      const APesquisa: String);
    //procedure CaracterEspecial(Key: Char);
  end;

implementation

end.


