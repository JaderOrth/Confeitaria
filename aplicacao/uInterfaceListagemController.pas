unit uInterfaceListagemController;

interface


uses
  System.Classes;

type
  IInterfaceListagemController = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
  end;

implementation

end.
