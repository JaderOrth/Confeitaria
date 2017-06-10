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
    iIdAlterar: Integer;
    procedure Pesquisar(Sender: TObject);
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);

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
  oMunicipioRegra.LimparDTO(oMunicipioDTO);
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
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);

    if oMunicipioRegra.ComboBox(oListaEstados, oEstadoListagemModel) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        oComBox.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;
  finally
    if (Assigned(oListaEstados)) then
      FreeandNil(oListaEstados);
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
var
  oComboBox: TComboBox;
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);

  frmMunicipioCadastro.OnActivate := Pesquisar;
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.Show;
  frmMunicipioCadastro.OnActivate(nil);

  if (iId > 0) then
  begin
    oMunicipioDTO.IdMunicipio := iId;
    iIdAlterar := iId;
    oComboBox := frmMunicipioCadastro.cbEstado;
    if (oMunicipioRegra.BuscarUpdate(oMunicipioDTO, oMunicipioModel)) then
    begin
      frmMunicipioCadastro.edtMunicipio.Text := oMunicipioDTO.Descricao;
      oComboBox.ItemIndex := oComboBox.Items.IndexOfObject
        (TObject(oMunicipioDTO.IdEstado));
    end
    else
      raise Exception.Create('Erro ao trazer o registro do Banco!');
  end;
end;

destructor TMunicipioCadastroController.Destroy;
begin
  if (Assigned(oMunicipioDTO)) then
    FreeandNil(oMunicipioDTO);

  if (Assigned(oMunicipioRegra)) then
    FreeandNil(oMunicipioRegra);

  if (Assigned(oMunicipioModel)) then
    FreeandNil(oMunicipioModel);

  if (Assigned(oEstadoListagemModel)) then
    FreeandNil(oEstadoListagemModel);
  inherited;
end;

procedure TMunicipioCadastroController.Novo(Sender: TObject);
begin
  oMunicipioRegra.LimparDTO(oMunicipioDTO);
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
var
  oComboBox: TComboBox;
  iValidar, iSalvar: Integer;
begin
  oComboBox := frmMunicipioCadastro.cbEstado;
  oMunicipioDTO.Descricao := frmMunicipioCadastro.edtMunicipio.Text;
  // verefica se o ComboBox já foi selecionado ou não
  if (oComboBox.ItemIndex = -1) then
    oMunicipioDTO.IdEstado := -1
  else
    oMunicipioDTO.IdEstado :=
      Integer(oComboBox.Items.Objects[oComboBox.ItemIndex]);

  iValidar := oMunicipioRegra.ValidarMunicipio(oMunicipioDTO);
  // Descrição do Município
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo DESCRIÇÃO corretamente!', mtWarning,
      [mbOK], 0);
    frmMunicipioCadastro.edtMunicipio.SetFocus;
    exit;
  end;
  // Estado Selecionado no comboBox
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    frmMunicipioCadastro.cbEstado.SetFocus;
    exit;
  end;

  iSalvar := oMunicipioRegra.Salvar(oMunicipioDTO, oMunicipioModel);

  // update true
  if (iSalvar = 1) then
  begin
    MessageDlg('Resgistro alterado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // update false
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao ALTERAR o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // insert true
  if (iSalvar = 3) then
  begin
    MessageDlg('Resgistro salvo com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // insert false
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao SALVAR o registro!', mtError, [mbOK], 0);
    exit;
  end;
end;

end.
