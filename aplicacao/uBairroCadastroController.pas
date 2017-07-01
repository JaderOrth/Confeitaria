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
  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oBairroModel: TBairroCadastroModel;
    oBairroRegra: TBairroCadastroRegra;
    oBairroDTO: TBairroDTO;
    iIDEstado: Integer;
    procedure ComboBox(Sender: TObject);
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
  oComboBox: TComboBox;
  iId: Integer;
begin
  if (frmBairroCadastro.cbEstado.ItemIndex <> -1) then
  begin
    oComboBox := frmBairroCadastro.cbMunicipio;
    oComboBox.Items.Clear;
    oComboBox.Clear;
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
          oComboBox.Items.AddObject(oMunicipioDTO.Descricao,
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
    raise Exception.Create('Selecione um ESTADO primeiro!');
end;

constructor TBairroCadastroController.Create;
begin
  oBairroDTO := TBairroDTO.Create;
  oBairroModel := TBairroCadastroModel.Create;
  oBairroRegra := TBairroCadastroRegra.Create;
end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
var
  iIdEstado: Integer;
  oCbEstado: TComboBox;
  oCbMunicipio: TComboBox;
begin
  if (not(Assigned(frmBairroCadastro))) then
    frmBairroCadastro := TfrmBairroCadastro.Create(AOwner);

  frmBairroCadastro.oInterfaceCadastroController := oBairroCadastroController;

 // frmBairroCadastro.OnActivate := Pesquisar;
  frmBairroCadastro.Show;
  frmBairroCadastro.OnActivate(nil);
  frmBairroCadastro.cbMunicipio.OnEnter := ComboBox;

  if (iId > 0) then
  begin
    oCbEstado := frmBairroCadastro.cbEstado;
    oCbMunicipio := frmBairroCadastro.cbMunicipio;
    iIdEstado := 0;
    oBairroDTO.idBairro := iId;
    if (oBairroRegra.SelectUpdate(oBairroDTO, iIdEstado, oBairroModel)) then
    begin
      frmBairroCadastro.edtBairro.Text := oBairroDTO.Descricao;
      oCbEstado.ItemIndex := oCbEstado.Items.IndexOfObject(TObject(iIdEstado));
      ComboBox(Sender);
      oCbMunicipio.ItemIndex := oCbMunicipio.Items.IndexOfObject
        (TObject(oBairroDTO.IdMunicipio));
    end
    else
    begin
      MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
      exit;
    end;
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
end;

procedure TBairroCadastroController.Pesquisar(Sender: TObject);
var
  oListaEstado: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoModel: TEstadoListagemModel;
  cbEstado: TComboBox;
  iId: Integer;
begin
 cbEstado := frmBairroCadastro.cbEstado;

  if (cbEstado.ItemIndex <> -1) then
  begin
    iId := Integer(cbEstado.Items.Objects[cbEstado.ItemIndex]);
    frmBairroCadastro.cbEstado.SetFocus;
  end
  else
    iId := -1;

  cbEstado.Items.Clear;
  try
    oListaEstado := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoModel := TEstadoListagemModel.Create;
    if (oBairroRegra.ComboBox(oListaEstado, oEstadoModel)) then
    begin
      for oEstadoDTO in oListaEstado.Values do
        cbEstado.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
    begin
      cbEstado.ItemIndex := cbEstado.Items.IndexOfObject(TObject(iId));
    end;
  finally
    if (Assigned(oListaEstado)) then
      FreeAndNil(oListaEstado);

    if (Assigned(oEstadoModel)) then
      FreeAndNil(oEstadoModel);
  end;
end;

procedure TBairroCadastroController.RetornarValorEdit(Sender: TObject);
begin

end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
var
  oComboBox: TComboBox;
  iValidar, iSalvar, iIDValidarEstado: Integer;
begin
  iIDValidarEstado := Integer(frmBairroCadastro.cbEstado.Items.Objects
    [frmBairroCadastro.cbEstado.ItemIndex]);
  if (iIDValidarEstado <> iIDEstado) then
  begin
    frmBairroCadastro.cbMunicipio.Items.Clear;
    frmBairroCadastro.cbMunicipio.Clear;
  end;
  oComboBox := frmBairroCadastro.cbMunicipio;
  oBairroDTO.Descricao := frmBairroCadastro.edtBairro.Text;
  if (oComboBox.ItemIndex = -1) then
    oBairroDTO.IdMunicipio := -1
  else
    oBairroDTO.IdMunicipio :=
      Integer(oComboBox.Items.Objects[oComboBox.ItemIndex]);

  iValidar := oBairroRegra.ValidarEdit(oBairroDTO);
  // descrição
  if (iValidar = 1) then
  begin
    messageDlg('Preencha o campo DESCRICÃO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;
  // idMunicipio
  if (iValidar = 2) then
  begin
    messageDlg('Preencha o campo MUNICÍPIO corretamente!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  iSalvar := oBairroRegra.Salvar(oBairroDTO, oBairroModel);
  // Update True
  if (iSalvar = 1) then
  begin
    messageDlg('Registro alterado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Update False
  if (iSalvar = 2) then
  begin
    messageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // Insert True
  if (iSalvar = 3) then
  begin
    messageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Insert False
  if (iSalvar = 4) then
  begin
    messageDlg('Erro ao salvar o registro!', mtError, [mbOK], 0);
    exit;
  end;
end;

end.
