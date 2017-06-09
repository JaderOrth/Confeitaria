unit uMunicipioCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.Generics.Collections,
  Vcl.Dialogs, System.UITypes,
  uInterfaceCadastroController, uMunicipioCadastro, uMunicipioCadastroModel,
  uMunicipioCadastroRegra, uMunicipioDTO, uEstadoListaHash,
  uEstadoDTO, uEstadoListagemModel;

type
  TMunicipioCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oMunicipioDTO: TMunicipioDTO;
    oMunicipioRegra: TMunicipioCadastroRegra;
    oMunicipioModel: TMunicipioCadastroModel;
    oEstadoListagemModel: TEstadoListagemModel;
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
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
  oListaEstados: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oComBox: TComboBox;
begin
  oComBox := frmMunicipioCadastro.cbEstado;
  oComBox.Items.Clear;
  try
    oListaEstados:= TEstadoListaHash.Create([doOwnsValues]);

    if oMunicipioRegra.ComboBox(oListaEstados, oEstadoListagemModel) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        oComBox.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;
  finally
   if (assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);
  end;

end;

constructor TMunicipioCadastroController.Create;
begin
  oMunicipioDTO := TMunicipioDTO.Create;
  oMunicipioRegra := TMunicipioCadastroRegra.Create;
  oMunicipioModel := TMunicipioCadastroModel.Create;
  oEstadoListagemModel := TEstadoListagemModel.Create;
end;

procedure TMunicipioCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);

  frmMunicipioCadastro.OnActivate := Pesquisar;
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.Show;
  frmMunicipioCadastro.OnActivate(nil);

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

  if (Assigned(oEstadoListagemModel)) then
    FreeAndNil(oEstadoListagemModel);
  inherited;
end;

procedure TMunicipioCadastroController.Novo(Sender: TObject);
begin
  ShowMessage('Help');
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
var
  oComboBox: TComboBox;
  iValidar, iSalvar: Integer;
begin
  oComboBox := frmMunicipioCadastro.cbEstado;
  //oMunicipioDTO.IdMunicipio
  oMunicipioDTO.Descricao := frmMunicipioCadastro.edtMunicipio.Text;
  oMunicipioDTO.IdEstado := Integer(oComboBox.Items.Objects[oComboBox.ItemIndex]);

  iValidar := oMunicipioRegra.ValidarMunicipio(oMunicipioDTO);
  //Descrição do Município
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo DESCRIÇÃO corretamente!',
      mtWarning, [mbOK], 0);
    exit;
  end;
  //Estado Selecionado no comboBox
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  iSalvar := oMunicipioRegra.Salvar(oMunicipioDTO, oMunicipioModel);

  //update true
  if (iSalvar = 1) then
  begin
    MessageDlg('Resgistro alterado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  //update false
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao ALTERAR o registro!', mtError, [mbOK], 0);
    exit;
  end;
  //insert true
  if (iSalvar = 3) then
  begin
    MessageDlg('Resgistro salvo com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  //insert false
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao SALVAR o registro!', mtError, [mbOK], 0);
    exit;
  end;
end;

end.
