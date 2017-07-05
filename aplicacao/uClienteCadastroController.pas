unit uClienteCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, Generics.Collections,
  Vcl.Dialogs, System.UITypes,
  uClienteCadastro, uInterfaceCadastroController, uClienteDTO,
  uClienteCadastroRegra, uClienteCadastroModel, uEstadoListaHash, uEstadoDTO,
  uEstadoListagemModel, uMunicipioListaHash, uMunicipioDTO,
  uMunicipioListagemModel, uBairroListagemModel, uBairroDTO, uBairroListaHash;

type
  TMontarGrid = procedure of object;

  TClienteCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oClienteDTO: TClienteDTO;
    oClienteModel: TClienteCadastroModel;
    oClienteRegra: TClienteCadastroRegra;
    iIdEstado: Integer;
    oMontarGrid: TMontarGrid;
    procedure ComboBox(Sender: TObject);
    procedure ComboBoxBairro(Sender: TObject);
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure RetornarValorEdit(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create(const AProcedimentoMontarGrid: TMontarGrid);
    destructor Destroy; override;
  end;

var
  oClienteCadastroController: IInterfaceCadastroController;

implementation

{ TClienteCadastroController }

procedure TClienteCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmCadastroCliente))) then
    exit;
  frmCadastroCliente.Close;
  FreeAndNil(frmCadastroCliente);
  oClienteRegra.LimparDTO(oClienteDTO);
end;

procedure TClienteCadastroController.ComboBox(Sender: TObject);
var
  oMunicipioDTO: TMunicipioDTO;
  oListaMunicipio: TMunicipioListaHash;
  oMunicipioModel: TMunicipioListagemModel;
  iId: Integer;
begin
  if (frmCadastroCliente.cbEstado.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  try
    if (frmCadastroCliente.cbMunicipio.ItemIndex <> -1) then
    begin
      frmCadastroCliente.cbBairro.Items.Clear;
      frmCadastroCliente.cbBairro.Clear;
    end;
    frmCadastroCliente.cbMunicipio.Items.Clear;
    frmCadastroCliente.cbMunicipio.Clear;
    iId := Integer(frmCadastroCliente.cbEstado.Items.Objects
      [frmCadastroCliente.cbEstado.ItemIndex]);
    oListaMunicipio := TMunicipioListaHash.Create([doOwnsValues]);
    oMunicipioModel := TMunicipioListagemModel.Create;

    if (oClienteRegra.ComboBomMunicipio(oListaMunicipio, iId, oMunicipioModel))
    then
    begin
      iIdEstado := iId;
      for oMunicipioDTO in oListaMunicipio.Values do
      begin
        frmCadastroCliente.cbMunicipio.Items.AddObject(oMunicipioDTO.Descricao,
          TObject(oMunicipioDTO.IdMunicipio));
      end;
    end;
  finally
    if (Assigned(oMunicipioModel)) then
      FreeAndNil(oMunicipioModel);

    if (Assigned(oListaMunicipio)) then
      FreeAndNil(oListaMunicipio);
  end;

end;

procedure TClienteCadastroController.ComboBoxBairro(Sender: TObject);
var
  oBairroLista: TBairroListaHash;
  oBairroDTO: TBairroDTO;
  oBairroModel: TBairroListagemModel;
  oComboBox: TComboBox;
  iId: Integer;
begin
  oComboBox := frmCadastroCliente.cbBairro;

  if (frmCadastroCliente.cbMunicipio.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  try
    oComboBox.Items.Clear;
    oComboBox.Clear;

    oBairroLista := TBairroListaHash.Create([doOwnsValues]);
    oBairroModel := TBairroListagemModel.Create;
    iId := Integer(frmCadastroCliente.cbMunicipio.Items.Objects
      [frmCadastroCliente.cbMunicipio.ItemIndex]);

    if (oClienteRegra.ComboBoxBairro(oBairroLista, iId, oBairroModel)) then
    begin
      for oBairroDTO in oBairroLista.Values do
      begin
        oComboBox.Items.AddObject(oBairroDTO.Descricao,
          TObject(oBairroDTO.idBairro));
      end;
    end;

  finally
    if (Assigned(oBairroLista)) then
      FreeAndNil(oBairroLista);

    if (Assigned(oBairroModel)) then
      FreeAndNil(oBairroModel);
  end;
end;

constructor TClienteCadastroController.Create(const AProcedimentoMontarGrid: TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
  oClienteDTO := TClienteDTO.Create;
  oClienteModel := TClienteCadastroModel.Create;
  oClienteRegra := TClienteCadastroRegra.Create;
end;

procedure TClienteCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmCadastroCliente))) then
    frmCadastroCliente := TfrmCadastroCliente.Create(AOwner);
  frmCadastroCliente.oInterfaceCadastroController := oClienteCadastroController;
  frmCadastroCliente.Show;

  frmCadastroCliente.OnActivate := Pesquisar;
  frmCadastroCliente.OnActivate(nil);
  frmCadastroCliente.cbMunicipio.OnEnter := ComboBox;
  frmCadastroCliente.cbBairro.OnEnter := ComboBoxBairro;
  frmCadastroCliente.btnSalvar.Enabled := True;
  frmCadastroCliente.btnNovo.Enabled := False;

  if (iId > 0) then
  begin
    oClienteDTO.IdCliente := iId;
    RetornarValorEdit(Sender);
  end;
end;

destructor TClienteCadastroController.Destroy;
begin
  if (Assigned(oClienteDTO)) then
    FreeAndNil(oClienteDTO);

  if (Assigned(oClienteModel)) then
    FreeAndNil(oClienteModel);

  if (Assigned(oClienteRegra)) then
    FreeAndNil(oClienteRegra);
  inherited;
end;

procedure TClienteCadastroController.Novo(Sender: TObject);
begin
  oClienteRegra.LimparDTO(oClienteDTO);
  frmCadastroCliente.btnSalvar.Enabled := True;
  frmCadastroCliente.btnNovo.Enabled := False;
end;

procedure TClienteCadastroController.Pesquisar(Sender: TObject);
var
  oEstadoDTO: TEstadoDTO;
  oListaEstados: TEstadoListaHash;
  oEstadoListagem: TEstadoListagemModel;
  oComboBox: TComboBox;
  iId: Integer;
begin
  try
    oComboBox := frmCadastroCliente.cbEstado;

    if (oComboBox.ItemIndex <> -1) then
    begin
      iId := Integer(oComboBox.Items.Objects[oComboBox.ItemIndex]);
      oComboBox.SetFocus;
    end
    else
      iId := -1;

    oComboBox.Items.Clear;
    oEstadoListagem := TEstadoListagemModel.Create;
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);
    if oClienteRegra.ComboBox(oListaEstados, oEstadoListagem) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        oComboBox.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
      oComboBox.ItemIndex := oComboBox.Items.IndexOfObject(TObject(iId));

  finally
    if (Assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);

    if (Assigned(oEstadoListagem)) then
      FreeAndNil(oEstadoListagem);
  end;
end;

procedure TClienteCadastroController.RetornarValorEdit(Sender: TObject);
var
  iIdMunicipio, iIdEstado: Integer;
begin
  if (oClienteRegra.BuscarUpdate(oClienteDTO, iIdMunicipio, iIdEstado,
    oClienteModel)) then
  begin
    frmCadastroCliente.edtNome.Text := oClienteDTO.Nome;
    frmCadastroCliente.edtEndereco.Text := oClienteDTO.Endereco;
    frmCadastroCliente.edtNumero.Text := oClienteDTO.Numero;
    frmCadastroCliente.edtObservacao.Text := oClienteDTO.Observacao;
    frmCadastroCliente.edtComplemento.Text := oClienteDTO.Complemento;
    frmCadastroCliente.edtCPFCNPJ.Text := CurrToStr(oClienteDTO.CPF_CNPJ);
    frmCadastroCliente.edtTelefone.Text := CurrToStr(oClienteDTO.Telefone);
    frmCadastroCliente.edtCelular.Text := CurrToStr(oClienteDTO.Celular);
    // selecione o estado no comboBox
    frmCadastroCliente.cbEstado.ItemIndex :=
      frmCadastroCliente.cbEstado.Items.IndexOfObject(TObject(iIdEstado));
    // monta a grid Municipio
    ComboBox(Sender);
    // seleciona o município no comboBox
    frmCadastroCliente.cbMunicipio.ItemIndex :=
      frmCadastroCliente.cbMunicipio.Items.IndexOfObject(TObject(iIdMunicipio));
    ComboBoxBairro(Sender);
    frmCadastroCliente.cbBairro.ItemIndex :=
      frmCadastroCliente.cbBairro.Items.IndexOfObject
      (TObject(oClienteDTO.idBairro));
  end
  else
  begin
    MessageDlg('Erro ao trazer o Registro do banco!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TClienteCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar, iIdEstadoValidar: Integer;
  sCpfCnopj: String;
begin
  oClienteDTO.Endereco := frmCadastroCliente.edtEndereco.Text;
  oClienteDTO.Numero := frmCadastroCliente.edtNumero.Text;
  oClienteDTO.Nome := frmCadastroCliente.edtNome.Text;
  oClienteDTO.Complemento := frmCadastroCliente.edtComplemento.Text;
  oClienteDTO.Observacao := frmCadastroCliente.edtObservacao.Text;
  oClienteDTO.CPF_CNPJ := StrToCurrDef(frmCadastroCliente.edtCPFCNPJ.Text, 0);
  oClienteDTO.Telefone := StrToCurrDef(frmCadastroCliente.edtTelefone.Text, 0);
  oClienteDTO.Celular := StrToCurrDef(frmCadastroCliente.edtCelular.Text, 0);
  iIdEstadoValidar := 0;
  if (frmCadastroCliente.cbEstado.ItemIndex <> -1) then
    iIdEstadoValidar := Integer(frmCadastroCliente.cbEstado.Items.Objects
      [frmCadastroCliente.cbEstado.ItemIndex]);

  if (iIdEstado <> iIdEstadoValidar) then
  begin
    frmCadastroCliente.cbMunicipio.Items.Clear;
    frmCadastroCliente.cbMunicipio.Clear;
    frmCadastroCliente.cbBairro.Items.Clear;
    frmCadastroCliente.cbBairro.Clear;
  end;

  if (frmCadastroCliente.cbBairro.ItemIndex = -1) then
    oClienteDTO.idBairro := -1
  else
    oClienteDTO.idBairro := Integer(frmCadastroCliente.cbBairro.Items.Objects
      [frmCadastroCliente.cbBairro.ItemIndex]);
  //validação dos campos obrigatórios
  iValidar := oClienteRegra.Validar(oClienteDTO);
  sCpfCnopj := CurrToStr(oClienteDTO.CPF_CNPJ);
  if (not(oClienteRegra.ValidarCPF(sCpfCnopj))) then
  begin
    if (not(oClienteRegra.ValidarCNPJ(sCpfCnopj))) then
    begin
      MessageDlg('CPF_CNPJ inválido!', mtWarning, [mbOK], 0);
      frmCadastroCliente.edtCPFCNPJ.SetFocus;
      exit;
    end;
  end;
  // Nome
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo NOME corretamente!', mtWarning, [mbOK], 0);
    frmCadastroCliente.edtNome.SetFocus;
    exit;
  end;
  // Numero
  if (iValidar = 3) then
  begin
    MessageDlg('Preencha o campo NÚMERO corretamente!', mtWarning, [mbOK], 0);
    frmCadastroCliente.edtNumero.SetFocus;
    exit;
  end;
  // Endereço
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo ENDEREÇO corretamente!', mtWarning, [mbOK], 0);
    frmCadastroCliente.edtEndereco.SetFocus;
    exit;
  end;
  // Observação
  if (iValidar = 4) then
  begin
    MessageDlg('Preencha o campo OBSERVAÇÃO corretamente!', mtWarning,
      [mbOK], 0);
    frmCadastroCliente.edtObservacao.SetFocus;
    exit;
  end;
  // Telefone ou Celular
  if (iValidar = 5) then
  begin
    MessageDlg('Preencha o campo TELEFONE ou CELULAR corretamente!', mtWarning,
      [mbOK], 0);
    frmCadastroCliente.edtCelular.SetFocus;
    exit;
  end;
  // idBairro
  if (iValidar = 6) then
  begin
    MessageDlg('Preencha o campo BAIRRO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  iSalvar := oClienteRegra.Salvar(oClienteDTO, oClienteModel);
  // Update False
  if (iSalvar = 1) then
  begin
    MessageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // Insert False
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao salvar o registro!', mtError, [mbOK], 0);
    exit;
  end;

  if (iSalvar = 0) then
  begin
    frmCadastroCliente.btnSalvar.Enabled := False;
    frmCadastroCliente.btnNovo.Enabled := True;
  end;

end;

end.
