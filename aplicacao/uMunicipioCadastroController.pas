unit uMunicipioCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls,
  uInterfaceCadastroController, uMunicipioCadastro, uMunicipioCadastroModel,
  uMunicipioCadastroRegra, uMunicipioDTO, uMunicipioListaHash;

type
  TMunicipioCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oMunicipioDTO: TMunicipioDTO;
    oMunicipioRegra: TMunicipioCadastroRegra;
    oMunicipioModel: TMunicipioCadastroModel;
  public
    procedure CreateFormCadastro(AOwner: TComponent; const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oMunicipioCadastroController: IInterfaceCadastroController;

implementation

{ TMunicipioCadastroController }

procedure TMunicipioCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (Assigned(frmMunicipioCadastro)) then
    frmMunicipioCadastro.Close;
  FreeandNil(frmMunicipioCadastro);
end;

procedure TMunicipioCadastroController.Pesquisar(Sender: TObject);
var
  oComBox: TComboBox;
    //oComBox := frmMunicipioCadastro.cbEstado;
begin
//var
//  oListaEstados: TListaEstados;
//  oEstadoModel: TEstadoModel;
//  oEstadoDTO: TEstadoDTO;
//begin
//  ACmbEstados.Items.Clear;
//  oEstadoModel:= TEstadoModel.Create;
//  try
//    oListaEstados:= TListaEstados.Create([doOwnsValues]);
//
//    if oEstadoModel.BuscarListaEstados(oListaEstados) then
//    begin
//      for oEstadoDTO in oListaEstados.Values do
//        ACmbEstados.Items.AddObject(oEstadoDTO.Nome, TObject(oEstadoDTO.ID));
//    end;
//  finally
//
//    if assigned(oEstadoModel) then
//      oEstadoModel.Free;
//
//   if (assigned(oListaEstados)) then
//      FreeAndNil(oListaEstados);
//  end;

end;

constructor TMunicipioCadastroController.Create;
begin
  oMunicipioDTO := TMunicipioDTO.Create;
  oMunicipioRegra := TMunicipioCadastroRegra.Create;
  oMunicipioModel := TMunicipioCadastroModel.Create;
end;

procedure TMunicipioCadastroController.CreateFormCadastro(AOwner: TComponent;
  const iId: Integer);
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.Show;

//  oMunicipioDTO.IdMunicipio := iId;
//  if (oMunicipioRegra.BuscarUpdate(oMunicipioDTO, oMunicipioModel)) then
//  begin
//    frmMunicipioCadastro.edtID.Text := IntToStr(oMunicipioDTO.IdMunicipio);
//    frmMunicipioCadastro.edtMunicipio.Text := oMunicipioDTO.Descrição;
//  end else
//    raise Exception.Create('Erro ao trazer o registro do Banco!');
end;

destructor TMunicipioCadastroController.Destroy;
begin
  if (Assigned(oMunicipioDTO)) then
    FreeAndNil(oMunicipioDTO);

  if (Assigned(oMunicipioRegra)) then
    FreeAndNil(oMunicipioRegra);

  if (Assigned(oMunicipioModel)) then
    FreeAndNil(oMunicipioModel);
  inherited;
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
begin

end;

end.
