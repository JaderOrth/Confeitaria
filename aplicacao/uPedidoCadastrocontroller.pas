unit uPedidoCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, data.db, System.Rtti, FireDAC.Comp.Client,
  Winapi.Windows,
  uInterfaceCadastroController, uPedidoCadastro, uPedidoCadastroRegra,
  uPedidoCadastroModel, uPedidoDTO, uProdutoListaHash, uProdutoListagemModel,
  uProdutoDTO, uEstadoDTO, uEstadoListaHash, uEstadoListagemModel,
  uMunicipioDTO,uMunicipioListagemModel, uMunicipioListaHash, uBairroDTO,
  uBairroListagemModel, uBairroListaHash;

type
  TPedidoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoCadastroRegra;
    oPedidoModel: TPedidoCadastroModel;
    iIdEstado: Integer;
    procedure SalvarItens(Sender: TObject);
    procedure OnActivateForm(Sender: TObject);
    procedure ComboBoxProduto(Sender: TObject);
    procedure ComboBoxMunicipio(Sender: TObject);
    procedure ComboBoxBairro(Sender: TObject);
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
  oPedidoCadastroController: IInterfaceCadastroController;

implementation

{ TPedidoCadastroController }

procedure TPedidoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmPedidoCadastro))) then
    exit;
  frmPedidoCadastro.Close;
  FreeAndNil(frmPedidoCadastro);
end;

procedure TPedidoCadastroController.ComboBoxBairro(Sender: TObject);
var
  oBairroLista: TBairroListaHash;
  oBairroDTO: TBairroDTO;
  oBairroModel: TBairroListagemModel;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbMunicipio.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  try
    frmPedidoCadastro.cbBairro.Items.Clear;
    frmPedidoCadastro.cbBairro.Clear;

    oBairroLista := TBairroListaHash.Create([doOwnsValues]);
    oBairroModel := TBairroListagemModel.Create;
    iId := Integer(frmPedidoCadastro.cbMunicipio.Items.Objects
      [frmPedidoCadastro.cbMunicipio.ItemIndex]);

    if (oPedidoRegra.ComboBoxBairro(oBairroLista, iId, oBairroModel)) then
    begin
      for oBairroDTO in oBairroLista.Values do
      begin
        frmPedidoCadastro.cbBairro.Items.AddObject(oBairroDTO.Descricao,
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

procedure TPedidoCadastroController.ComboBoxMunicipio(Sender: TObject);
var
  oMunicipioDTO: TMunicipioDTO;
  oListaMunicipio: TMunicipioListaHash;
  oMunicipioModel: TMunicipioListagemModel;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbEstado.ItemIndex = -1) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  try
    if (frmPedidoCadastro.cbMunicipio.ItemIndex <> -1) then
    begin
      frmPedidoCadastro.cbBairro.Items.Clear;
      frmPedidoCadastro.cbBairro.Clear;
    end;
    frmPedidoCadastro.cbMunicipio.Items.Clear;
    frmPedidoCadastro.cbMunicipio.Clear;
    iId := Integer(frmPedidoCadastro.cbEstado.Items.Objects
      [frmPedidoCadastro.cbEstado.ItemIndex]);
    oListaMunicipio := TMunicipioListaHash.Create([doOwnsValues]);
    oMunicipioModel := TMunicipioListagemModel.Create;

    if (oPedidoRegra.ComboBoxMunicipio(oListaMunicipio, iId, oMunicipioModel))
    then
    begin
      iIdEstado := iId;
      for oMunicipioDTO in oListaMunicipio.Values do
      begin
        frmPedidoCadastro.cbMunicipio.Items.AddObject(oMunicipioDTO.Descricao,
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

procedure TPedidoCadastroController.ComboBoxProduto(Sender: TObject);
var
  oProdutoDTO: TProdutoDTO;
  oProdutoModel: TProdutoListagemModel;
  oProdutoLista: TProdutoListaHash;
  iId: Integer;
begin
  if (frmPedidoCadastro.cbProduto.ItemIndex <> -1) then
  begin
    iId := Integer(frmPedidoCadastro.cbProduto.Items.Objects
      [frmPedidoCadastro.cbProduto.ItemIndex]);
  end
  else
    iId := -1;

  frmPedidoCadastro.cbProduto.Items.Clear;
  try
    oProdutoLista := TProdutoListaHash.Create([doOwnsValues]);
    oProdutoModel := TProdutoListagemModel.Create;

    if oPedidoRegra.ComboBoxProduto(oProdutoLista, oProdutoModel) then
    begin
      for oProdutoDTO in oProdutoLista.Values do
      begin
        frmPedidoCadastro.cbProduto.Items.AddObject(oProdutoDTO.Descricao,
          TObject(oProdutoDTO.idProduto));
      end;
    end;

    if (iId <> -1) then
    begin
      frmPedidoCadastro.cbProduto.ItemIndex :=
        frmPedidoCadastro.cbProduto.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oProdutoLista)) then
      FreeAndNil(oProdutoLista);

    if (Assigned(oProdutoModel)) then
      FreeAndNil(oProdutoModel);
  end;
end;

constructor TPedidoCadastroController.Create;
begin
  oPedidoDTO := TPedidoDTO.Create;
  oPedidoRegra := TPedidoCadastroRegra.Create;
  oPedidoModel := TPedidoCadastroModel.Create;
end;

procedure TPedidoCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmPedidoCadastro))) then
    frmPedidoCadastro := TfrmPedidoCadastro.Create(AOwner);

  frmPedidoCadastro.oInterfaceCadastroController := oPedidoCadastroController;
  frmPedidoCadastro.Show;

  frmPedidoCadastro.btnSalvarItens.OnClick := SalvarItens;
  frmPedidoCadastro.OnActivate := OnActivateForm;
  frmPedidoCadastro.OnActivate(nil);
  frmPedidoCadastro.cbMunicipio.OnEnter := ComboBoxMunicipio;
  frmPedidoCadastro.cbBairro.OnEnter := ComboBoxBairro;

  if (iId > 0) then
  begin
    oPedidoDTO.idPedido := iId;
    RetornarValorEdit(Sender);
  end;
end;

destructor TPedidoCadastroController.Destroy;
begin
  if (Assigned(oPedidoDTO)) then
    FreeAndNil(oPedidoDTO);

  if (Assigned(oPedidoRegra)) then
    FreeAndNil(oPedidoRegra);

  if (Assigned(oPedidoModel)) then
    FreeAndNil(oPedidoModel);
  inherited;
end;

procedure TPedidoCadastroController.Novo(Sender: TObject);
begin

end;

procedure TPedidoCadastroController.OnActivateForm(Sender: TObject);
begin
  // comboBox do Produto
  ComboBoxProduto(Sender);
  // ComboBox do Estado
  Pesquisar(Sender);

  //Mostrar da data e horas atualizadas
  frmPedidoCadastro.dtDataHoraEntrega.DateTime := now;
end;

procedure TPedidoCadastroController.Pesquisar(Sender: TObject);
var
  oEstadoDTO: TEstadoDTO;
  oListaEstados: TEstadoListaHash;
  oEstadoListagem: TEstadoListagemModel;
  iId: Integer;
begin
  try

    if (frmPedidoCadastro.cbEstado.ItemIndex <> -1) then
    begin
      iId := Integer(frmPedidoCadastro.cbEstado.Items.Objects
        [frmPedidoCadastro.cbEstado.ItemIndex]);
      frmPedidoCadastro.cbEstado.SetFocus;
    end
    else
      iId := -1;

    frmPedidoCadastro.cbEstado.Items.Clear;
    oEstadoListagem := TEstadoListagemModel.Create;
    oListaEstados := TEstadoListaHash.Create([doOwnsValues]);
    if oPedidoRegra.ComboBoxEstado(oListaEstados, oEstadoListagem) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        frmPedidoCadastro.cbEstado.Items.AddObject(oEstadoDTO.Descricao,
          TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
      frmPedidoCadastro.cbEstado.ItemIndex :=
        frmPedidoCadastro.cbEstado.Items.IndexOfObject(TObject(iId));

  finally
    if (Assigned(oListaEstados)) then
      FreeAndNil(oListaEstados);

    if (Assigned(oEstadoListagem)) then
      FreeAndNil(oEstadoListagem);
  end;
end;

procedure TPedidoCadastroController.RetornarValorEdit(Sender: TObject);
begin

end;

procedure TPedidoCadastroController.Salvar(Sender: TObject);
var
  iIdEstadoValidar: Integer;
begin
  oPedidoDTO.responsavelPedido := frmPedidoCadastro.edtResponsavelPedido.Text;
  iIdEstadoValidar := Integer(frmPedidoCadastro.cbEstado.Items.Objects
    [frmPedidoCadastro.cbEstado.ItemIndex]);
  if (iIdEstado <> iIdEstadoValidar) then
  begin
    frmPedidoCadastro.cbMunicipio.Items.Clear;
    frmPedidoCadastro.cbMunicipio.Clear;
    frmPedidoCadastro.cbBairro.Items.Clear;
    frmPedidoCadastro.cbBairro.Clear;
  end;

  if (frmPedidoCadastro.cbBairro.ItemIndex <> -1) then
  begin
    oPedidoDTO.idBairro := Integer(frmPedidoCadastro.cbBairro.Items.Objects
    [frmPedidoCadastro.cbBairro.ItemIndex]);
  end
  else
    oPedidoDTO.idBairro :=  -1;
  oPedidoDTO.dataPedido := frmPedidoCadastro.dtDataPedido.Date;
  oPedidoDTO.dataHoraEntrega := frmPedidoCadastro.dtDataHoraEntrega.DateTime;
  oPedidoDTO.observacao := frmPedidoCadastro.mObservacao.Text;
  oPedidoDTO.totalPedido := StrToCurrDef(frmPedidoCadastro.edtTotalPedido.Text, 0);
  oPedidoDTO.idCliente
end;

procedure TPedidoCadastroController.SalvarItens(Sender: TObject);
begin
  // adiciona valor no memTable e irá mostrar na grid
  frmPedidoCadastro.fdMemTable.CreateDataSet;
  frmPedidoCadastro.fdMemTable.insert;
  frmPedidoCadastro.fdMemTableidproduto.AsInteger :=
    Integer(frmPedidoCadastro.cbEstado.Items.Objects
    [frmPedidoCadastro.cbEstado.ItemIndex]);
  frmPedidoCadastro.fdMemTablequantidade.AsFloat :=
    StrToFloat(frmPedidoCadastro.edtQuantidade.Text);
  frmPedidoCadastro.fdMemTableobservacao :=
    TStringField(frmPedidoCadastro.mObservacaoItensPedido.Text);

  frmPedidoCadastro.fdMemTable.Post;
end;

end.
