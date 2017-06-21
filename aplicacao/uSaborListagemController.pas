unit uSaborListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uSabor, uInterfaceListagemController;
  //uBairro, uInterfaceListagemController, uBairroCadastroController,
  //uBairroListagemRegra, uBairroListagemModel, uBairroDTO;

type
  TSaborListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oSaborModel: TSaborListagemModel;
    oSaborRegra: TSaborListagemRegra;
    oSaborDTO: TSaborDTO;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemTable: TFDMemTable);
    procedure Excluir(oMemTable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oSaborListagemController: IInterfaceListagemController;

implementation

end.
