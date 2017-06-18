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
  TClienteCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oClienteDTO: TClienteDTO;
    oClienteModel: TClienteCadastroModel;
    oClienteRegra: TClienteCadastroRegra;
    iIDAlterar: Integer;
    procedure ComboBox(Sender: TObject);
    procedure ComboBoxBairro(Sender: TObject);
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
  oComboBox: TComboBox;
  iId: Integer;
begin
  if (frmCadastroCliente.cbEstado.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  oComboBox := frmCadastroCliente.cbMunicipio;
  oComboBox.Items.Clear;
  oComboBox.Clear;
  iId := Integer(frmCadastroCliente.cbEstado.Items.Objects
    [frmCadastroCliente.cbEstado.ItemIndex]);
  try
    oListaMunicipio := TMunicipioListaHash.Create([doOwnsValues]);
    oMunicipioModel := TMunicipioListagemModel.Create;

    if (oClienteRegra.ComboBomMunicipio(oListaMunicipio, iId, oMunicipioModel))
    then
    begin
      for oMunicipioDTO in oListaMunicipio.Values do
      begin
        oComboBox.Items.AddObject(oMunicipioDTO.Descricao,
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
  if (frmCadastroCliente.cbMunicipio.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;
  oComboBox := frmCadastroCliente.cbBairro;
  oComboBox.Items.Clear;
  try
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
    end
  finally
    if (Assigned(oBairroLista)) then
      FreeAndNil(oBairroLista);

    if (Assigned(oBairroModel)) then
      FreeAndNil(oBairroModel);
  end;
end;

constructor TClienteCadastroController.Create;
begin
  oClienteDTO := TClienteDTO.Create;
  oClienteModel := TClienteCadastroModel.Create;
  oClienteRegra := TClienteCadastroRegra.Create;
end;

procedure TClienteCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
var
  iIdMunicipio, iIdEstado: Integer;
  oCbEstado, oCbMunicipio, oCbBairro: TComboBox;
begin
  if (not(Assigned(frmCadastroCliente))) then
    frmCadastroCliente := TfrmCadastroCliente.Create(AOwner);
  frmCadastroCliente.oInterfaceCadastroController := oClienteCadastroController;
  frmCadastroCliente.Show;

  frmCadastroCliente.OnActivate := Pesquisar;
  frmCadastroCliente.OnActivate(nil);
  frmCadastroCliente.cbMunicipio.OnEnter := ComboBox;
  frmCadastroCliente.cbBairro.OnEnter := ComboBoxBairro;

  if (iId > 0) then
  begin
    iIDAlterar := iId;
    oClienteDTO.IdCliente := iId;
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
      oCbEstado := frmCadastroCliente.cbEstado;
      oCbEstado.ItemIndex := oCbEstado.Items.IndexOfObject(TObject(iIdEstado));
      // monta a grid Municipio
      ComboBox(Sender);
      oCbMunicipio := frmCadastroCliente.cbMunicipio;
      oCbMunicipio.ItemIndex := oCbMunicipio.Items.IndexOfObject
        (TObject(iIdMunicipio));
      ComboBoxBairro(Sender);
      oCbBairro := frmCadastroCliente.cbBairro;
      oCbBairro.ItemIndex := oCbBairro.Items.IndexOfObject
        (TObject(oClienteDTO.idBairro));
    end
    else
      raise Exception.Create('Error ao retornar valor do banco de dados!');
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
end;

procedure TClienteCadastroController.Pesquisar(Sender: TObject);
var
  oEstadoDTO: TEstadoDTO;
  oListaEstados: TEstadoListaHash;
  oEstadoListagem: TEstadoListagemModel;
  oComboBox: TComboBox;
begin
  oComboBox := frmCadastroCliente.cbEstado;
  oComboBox.Items.Clear;
  try
    oEstadoListagem := TEstadoListagemModel.Create;
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);

    if oClienteRegra.ComboBox(oListaEstados, oEstadoListagem) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        oComboBox.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end
  finally
    if (Assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);

    if (Assigned(oEstadoListagem)) then
      FreeAndNil(oEstadoListagem);
  end;
end;

procedure TClienteCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oClienteDTO.Endereco := frmCadastroCliente.edtEndereco.Text;
  oClienteDTO.Numero := frmCadastroCliente.edtNumero.Text;
  oClienteDTO.Nome := frmCadastroCliente.edtNome.Text;
  oClienteDTO.Complemento := frmCadastroCliente.edtComplemento.Text;
  oClienteDTO.Observacao := frmCadastroCliente.edtObservacao.Text;
  oClienteDTO.CPF_CNPJ := StrToCurrDef(frmCadastroCliente.edtCPFCNPJ.Text, 0);
  oClienteDTO.Telefone := StrToCurrDef(frmCadastroCliente.edtTelefone.Text, 0);
  oClienteDTO.Celular := StrToCurrDef(frmCadastroCliente.edtCelular.Text, 0);
  if (frmCadastroCliente.cbBairro.ItemIndex = -1) then
    oClienteDTO.idBairro := -1
  else
    oClienteDTO.idBairro := Integer(frmCadastroCliente.cbBairro.Items.Objects
      [frmCadastroCliente.cbBairro.ItemIndex]);

  iValidar := oClienteRegra.Validar(oClienteDTO);
  // Endereço
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo ENDEREÇO corretamente!', mtWarning, [mbOK], 0);
    frmCadastroCliente.edtEndereco.SetFocus;
    exit;
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
  if (iSalvar = 1) then
  begin
    MessageDlg('Registro alterado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Update False
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // Insert True
  if (iSalvar = 3) then
  begin
    MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Insert False
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao salvar o registro!', mtError, [mbOK], 0);
    exit;
  end;

end;

end.
