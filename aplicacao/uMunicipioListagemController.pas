unit uMunicipioListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, Vcl.DBGrids,
  System.SysUtils,
  uInterfaceListagemController, uMunicipio, uMunicipioCadastroController;

type
  TMunicipioListagemController = class
  (TInterfacedObject, IInterfaceListagemController)
  private

  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemtable: TFDMemTable; AGrid: TDBGrid);
    procedure Excluir(oMemtable: TFDMemTable; AGrid: TDBGrid);
    procedure BuscarGrid(aMemTable: TFDMemTable; AGrid: TDBGrid;
      APesquisa: String);

  end;
  var
    oMunicipioListagemController: IInterfaceListagemController;

implementation

{ TMunicipioListagemController }

procedure TMunicipioListagemController.BuscarGrid(aMemTable: TFDMemTable;
  AGrid: TDBGrid; APesquisa: String);
begin
{}
end;

procedure TMunicipioListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmMunicipio))) then
    exit;
  frmMunicipio.Close;
  FreeAndNil(frmMunicipio);
end;

procedure TMunicipioListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oMunicipioCadastroController))) then
    oMunicipioCadastroController := TMunicipioCadastroController.Create;
  oMunicipioCadastroController.CreateFormCadastro(frmMunicipio, 0);
end;

procedure TMunicipioListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
begin
      {}
end;

procedure TMunicipioListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmMunicipio))) then
    frmMunicipio := TfrmMunicipio.Create(AOwner);
  frmMunicipio.oListagemBase := oMunicipioListagemController;
  frmMunicipio.Show;
end;

procedure TMunicipioListagemController.Excluir(oMemtable: TFDMemTable;
  AGrid: TDBGrid);
begin
        {}
end;

procedure TMunicipioListagemController.Help(Sender: TObject);
begin
          {}
end;

procedure TMunicipioListagemController.MontarGrid(oMemtable: TFDMemTable;
  AGrid: TDBGrid);
begin
            {}
end;

end.
