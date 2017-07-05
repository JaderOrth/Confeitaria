unit uBairroCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Controls,
  uInterfaceCadastroController, uBairroCadastro, uBairroCadastroRegra,
  uBairroCadastroModel, uBairroDTO, uEstadoListaHash, uEstadoDTO,
  uEstadoListagemModel, uMunicipioListagemModel, uMunicipioDTO,
  uMunicipioListaHash;

type
  TMontarGrid = procedure of object;

  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oBairroModel: TBairroCadastroModel;
    oBairroRegra: TBairroCadastroRegra;
    oBairroDTO: TBairroDTO;
    iIDEstado: Integer;

    oMontarGrid: TMontarGrid;
    procedure ComboBox(Sender: TObject);
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
  oBairroCadastroController: IInterfaceCadastroController;

implementation

{ TBairroCadastroController }

procedure TBairroCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmBairroCadastro))) then
    exit;
  frmBairroCadastro.Close;
  FreeAndNil(frmBairroCadastro);
  oBairroRegra.LimparDTO(oBairroDTO);
end;

procedure TBairroCadastroController.ComboBox(Sender: TObject);
var
  oMunicipioLista: TMunicipioListaHash;
  oMunicipioModel: TMunicipioListagemModel;
  oMunicipioDTO: TMunicipioDTO;
  iId: Integer;
begin
  if (frmBairroCadastro.cbEstado.ItemIndex <> -1) then
  begin
    frmBairroCadastro.cbMunicipio.Items.Clear;
    frmBairroCadastro.cbMunicipio.Clear;
    // id do estado para poder fazer o select
    iId := Integer(frmBairroCadastro.cbEstado.Items.Objects
      [frmBairroCadastro.cbEstado.ItemIndex]);
    try
      oMunicipioLista := TMunicipioListaHash.Create([doOwnsValues]);
      oMunicipioModel := TMunicipioListagemModel.Create;

      if (oBairroRegra.ComboBomMunicipio(oMunicipioLista, iId, oMunicipioModel))
      then
      begin
        iIDEstado := iId;
        for oMunicipioDTO in oMunicipioLista.Values do
        begin
          frmBairroCadastro.cbMunicipio.Items.AddObject(oMunicipioDTO.Descricao,
            TObject(oMunicipioDTO.IdMunicipio));
        end
      end
    finally
      if (Assigned(oMunicipioModel)) then
        FreeAndNil(oMunicipioModel);

      if (Assigned(oMunicipioLista)) then
        FreeAndNil(oMunicipioLista);
    end;
  end
  else
    MessageDlg('Selecione um ESTADO primeiro!', mtWarning, [mbOK], 0);
end;

constructor TBairroCadastroController.Create(const AProcedimentoMontarGrid: TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
  oBairroDTO := TBairroDTO.Create;
  oBairroModel := TBairroCadastroModel.Create;
  oBairroRegra := TBairroCadastroRegra.Create;
end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmBairroCadastro))) then
    frmBairroCadastro := TfrmBairroCadastro.Create(AOwner);

  frmBairroCadastro.oInterfaceCadastroController := oBairroCadastroController;

  frmBairroCadastro.Show;
  frmBairroCadastro.OnActivate(nil);
  frmBairroCadastro.cbMunicipio.OnEnter := ComboBox;
  frmBairroCadastro.btnSalvar.Enabled := True;
  frmBairroCadastro.btnNovo.Enabled := False;

  if (iId > 0) then
  begin
    oBairroDTO.idBairro := iId;
    RetornarValorEdit(Sender);
  end;
end;

destructor TBairroCadastroController.Destroy;
begin
  if (Assigned(oBairroDTO)) then
    FreeAndNil(oBairroDTO);

  if (Assigned(oBairroModel)) then
    FreeAndNil(oBairroModel);

  if (Assigned(oBairroRegra)) then
    FreeAndNil(oBairroRegra);
  inherited;
end;

procedure TBairroCadastroController.Novo(Sender: TObject);
begin
  oBairroRegra.LimparDTO(oBairroDTO);
  frmBairroCadastro.cbEstado.ItemIndex := -1;
  frmBairroCadastro.cbMunicipio.Clear;
  frmBairroCadastro.btnSalvar.Enabled := True;
  frmBairroCadastro.btnNovo.Enabled := False;
end;

procedure TBairroCadastroController.Pesquisar(Sender: TObject);
var
  oListaEstado: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoModel: TEstadoListagemModel;
  iId: Integer;
begin
  if (frmBairroCadastro.cbEstado.ItemIndex <> -1) then
  begin
    iId := Integer(frmBairroCadastro.cbEstado.Items.Objects
      [frmBairroCadastro.cbEstado.ItemIndex]);
    frmBairroCadastro.cbEstado.SetFocus;
  end
  else
    iId := -1;

  frmBairroCadastro.cbEstado.Items.Clear;
  try
    oListaEstado := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoModel := TEstadoListagemModel.Create;
    if (oBairroRegra.ComboBox(oListaEstado, oEstadoModel)) then
    begin
      for oEstadoDTO in oListaEstado.Values do
        frmBairroCadastro.cbEstado.Items.AddObject(oEstadoDTO.Descricao,
          TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
    begin
      frmBairroCadastro.cbEstado.ItemIndex :=
        frmBairroCadastro.cbEstado.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oListaEstado)) then
      FreeAndNil(oListaEstado);

    if (Assigned(oEstadoModel)) then
      FreeAndNil(oEstadoModel);
  end;
end;

procedure TBairroCadastroController.RetornarValorEdit(Sender: TObject);
var
  iEstado: Integer;
begin
  if (oBairroRegra.SelectUpdate(oBairroDTO, iEstado, oBairroModel)) then
  begin
    frmBairroCadastro.edtBairro.Text := oBairroDTO.Descricao;
    frmBairroCadastro.cbEstado.ItemIndex :=
      frmBairroCadastro.cbEstado.Items.IndexOfObject(TObject(iEstado));
    ComboBox(Sender);
    frmBairroCadastro.cbMunicipio.ItemIndex :=
      frmBairroCadastro.cbMunicipio.Items.IndexOfObject
      (TObject(oBairroDTO.IdMunicipio));
  end
  else
  begin
    MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar, iIDValidarEstado: Integer;
begin
  if (frmBairroCadastro.cbEstado.ItemIndex <> -1) then
  begin
    iIDValidarEstado := Integer(frmBairroCadastro.cbEstado.Items.Objects
      [frmBairroCadastro.cbEstado.ItemIndex]);
  end
  else
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;

  if (iIDValidarEstado <> iIDEstado) then
  begin
    frmBairroCadastro.cbMunicipio.Clear;
    frmBairroCadastro.cbMunicipio.Items.Clear;
  end;

  oBairroDTO.Descricao := frmBairroCadastro.edtBairro.Text;

  if (frmBairroCadastro.cbMunicipio.ItemIndex = -1) then
    oBairroDTO.IdMunicipio := -1
  else
    oBairroDTO.IdMunicipio :=
      Integer(frmBairroCadastro.cbMunicipio.Items.Objects
      [frmBairroCadastro.cbMunicipio.ItemIndex]);

  iValidar := oBairroRegra.ValidarEdit(oBairroDTO);
  // descrição
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo DESCRICÃO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;
  // idMunicipio
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  iSalvar := oBairroRegra.Salvar(oBairroDTO, oBairroModel);
  // Update False
  if (iSalvar = 1) then
  begin
    MessageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    oMontarGrid;
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
    frmBairroCadastro.btnSalvar.Enabled := False;
    frmBairroCadastro.btnNovo.Enabled := True;
  end;
end;

end.
