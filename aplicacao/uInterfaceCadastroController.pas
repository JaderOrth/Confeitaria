unit uInterfaceCadastroController;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type
  IInterfaceCadastroController = interface
    procedure CreateFormCadastro(AOwner: TComponent);
    procedure CloseFormCadastro(Sender: TObject);

  end;

implementation

end.
