unit uInterfaceCadastroController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  IInterfaceCadastroController = interface
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    //procedure Pesquisar(Sender: TObject);
  end;

implementation

end.
