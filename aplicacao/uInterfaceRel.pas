unit uInterfaceRel;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.DBGrids;

type
  IInterfaceRel = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure ComboBoxCliente(Sender: TObject);
    procedure ComboBoxEstado(Sender: TObject);
    procedure ComboBoxMunicipio(Sender: TObject);
    procedure ComboBoxProduto(Sender: TObject);
    //procedure ControlerCadastro(Sender: TObject);
    //procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    //procedure MontarGrid;
    //procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);
  end;

implementation

end.
