unit uRelListagemController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.ExtCtrls, Data.DB,
  uClienteDTO, uRelClientesListagemModel, uRelClientes;

type
  TRelClientesListagemController = class
  private
    oRelClientesModel: TRelClientesListagemModel;
    oRelClientesDTO: TClienteDTO;
  public
    procedure CreateFormListagem(AOwner: TComponent);
   { procedure CloseForm(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid;
    procedure Excluir(oMemTable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String); }

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRelClientesListagemController }

constructor TRelClientesListagemController.Create;
begin

end;

procedure TRelClientesListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmRelClientes))) then
    frmRelClientes := TfrmRelClientes.Create(AOwner);
  //frmRelClientes.oListagemBase := oEstadoListagemController;
  frmRelClientes.Show;
  frmRelClientes.FormActivate(nil);
end;

destructor TRelClientesListagemController.Destroy;
begin

  inherited;
end;

end.
