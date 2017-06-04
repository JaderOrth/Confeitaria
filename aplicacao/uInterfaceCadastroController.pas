unit uInterfaceCadastroController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  IInterfaceCadastroController = interface
    procedure CreateFormCadastro(AOwner: TComponent; const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);

  end;

implementation

end.
