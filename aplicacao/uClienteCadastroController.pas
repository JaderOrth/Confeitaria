unit uClienteCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, Generics.Collections,
  Vcl.Dialogs,
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
      end
    end
    else
    begin
      MessageDlg('Nenhum MUNICÍPIO cadastrado!', mtWarning, [mbOK], 0);
      exit;
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

  try
    oBairroLista := TBairroListaHash.Create([doOwnsValues]);
    oBairroModel := TBairroListagemModel.Create;
    oComboBox := frmCadastroCliente.cbBairro;
    iId :=  Integer(frmCadastroCliente.cbMunicipio.Items.Objects
     [frmCadastroCliente.cbMunicipio.ItemIndex]);
    if (oClienteRegra.ComboBoxBairro(oBairroLista, iId, oBairroModel)) then
    begin
      for oBairroDTO in oBairroLista.Values do
      begin
        oComboBox.Items.AddObject(oBairroDTO.Descricao,
          TObject(oBairroDTO.idBairro));
      end;
    end
    else
    begin
      MessageDlg('Nenhum BAIRRO cadastrado!', mtWarning, [mbOK], 0);
      exit;
    end;
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
    else
    begin
      MessageDlg('Nenhum ESTADO cadastrado!', mtWarning, [mbOK], 0);
      exit;
    end;
  finally
    if (Assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);

    if (Assigned(oEstadoListagem)) then
      FreeAndNil(oEstadoListagem);
  end;
end;

procedure TClienteCadastroController.Salvar(Sender: TObject);
begin

end;

end.
