unit uInterfaceListagemController;

interface


uses
  System.Classes;

type
  IInterfaceListagemController = interface
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CreateFormCadastro(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure CloseFormCadastro(Sender: TObject);
  end;

implementation

end.
