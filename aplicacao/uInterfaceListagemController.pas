unit uInterfaceListagemController;

interface


uses
  System.Classes, FireDAC.Comp.Client;

type
  IInterfaceListagemController = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure MontarGrid(oMemtable: TFDMemTable);
  end;

implementation

end.


