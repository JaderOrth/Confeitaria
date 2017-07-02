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
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure RetornarValorEdit(Sender: TObject);
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
  oMunicipioRegra.LimparDTO(oMunicipioDTO);
end;

procedure TMunicipioCadastroController.Pesquisar(Sender: TObject);
var
  oListaEstados: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoListagemModel: TEstadoListagemModel;
  iId: Integer;
begin
  if (frmMunicipioCadastro.cbEstado.ItemIndex <> -1) then
  begin
    iId := Integer(frmMunicipioCadastro.cbEstado.Items.Objects
      [frmMunicipioCadastro.cbEstado.ItemIndex]);
  end
  else
    iId := -1;

  frmMunicipioCadastro.cbEstado.Items.Clear;
  try
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoListagemModel := TEstadoListagemModel.Create;

    if oMunicipioRegra.ComboBox(oListaEstados, oEstadoListagemModel) then
    begin
      for oEstadoDTO in oListaEstados.Values do
      begin
        frmMunicipioCadastro.cbEstado.Items.AddObject
          (oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
      end;
    end;

    if (iId <> -1) then
    begin
      frmMunicipioCadastro.cbEstado.ItemIndex :=
        frmMunicipioCadastro.cbEstado.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oListaEstados)) then
      FreeandNil(oListaEstados);

    if (Assigned(oEstadoListagemModel)) then
      FreeandNil(oEstadoListagemModel);
  end;
end;

procedure TMunicipioCadastroController.RetornarValorEdit(Sender: TObject);
begiN
  if (oMunicipioRegra.BuscarUpdate(oMunicipioDTO, oMunicipioModel)) then
  begin
    frmMunicipioCadastro.edtMunicipio.Text := oMunicipioDTO.Descricao;
    frmMunicipioCadastro.cbEstado.ItemIndex :=
      frmMunicipioCadastro.cbEstado.Items.IndexOfObject
      (TObject(oMunicipioDTO.IdEstado));
  end
  else
  begin
    MessageDlg('Erro ao trazer o Registro do banco!', mtError, [mbOK], 0);
    exit;
  end;
end;

constructor TMunicipioCadastroController.Create;
begin
  oMunicipioDTO := TMunicipioDTO.Create;
  oMunicipioRegra := TMunicipioCadastroRegra.Create;
  oMunicipioModel := TMunicipioCadastroModel.Create;
end;

procedure TMunicipioCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmMunicipioCadastro))) then
    frmMunicipioCadastro := TfrmMunicipioCadastro.Create(AOwner);
  frmMunicipioCadastro.Show;

  frmMunicipioCadastro.btnSalvar.Enabled := True;
  frmMunicipioCadastro.btnNovo.Enabled := False;
  frmMunicipioCadastro.edtMunicipio.Clear;
  frmMunicipioCadastro.cbEstado.Clear;

  frmMunicipioCadastro.OnActivate := Pesquisar;
  frmMunicipioCadastro.oInterfaceCadastroController :=
    oMunicipioCadastroController;
  frmMunicipioCadastro.OnActivate(nil);

  if (iId > 0) then
  begin
    oMunicipioDTO.IdMunicipio := iId;
    RetornarValorEdit(Sender);
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
  inherited;
end;

procedure TMunicipioCadastroController.Novo(Sender: TObject);
begin
  oMunicipioRegra.LimparDTO(oMunicipioDTO);
  frmMunicipioCadastro.btnSalvar.Enabled := True;
  frmMunicipioCadastro.btnNovo.Enabled := False;
end;

procedure TMunicipioCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  if (frmMunicipioCadastro.cbEstado.ItemIndex <> -1) then
  begin
    oMunicipioDTO.IdEstado :=
      Integer(frmMunicipioCadastro.cbEstado.Items.Objects
      [frmMunicipioCadastro.cbEstado.ItemIndex]);
  end
  else
    oMunicipioDTO.IdEstado := -1;
  oMunicipioDTO.Descricao := frmMunicipioCadastro.edtMunicipio.Text;

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

  // update false
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao ALTERAR o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // insert false
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao SALVAR o registro!', mtError, [mbOK], 0);
    exit;
  end;

  frmMunicipioCadastro.btnSalvar.Enabled := False;
  frmMunicipioCadastro.btnNovo.Enabled := True;
end;

end.
