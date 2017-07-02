unit uUnidadeMedidaCadastroController;

interface

uses
  System.Classes, System.SysUtils, System.StrUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uUnidadeMedidaCadastro, uUnidadeMedidaDTO, uUnidadeMedidaCadastroRegra, uUnidadeMedidaCadastroModel;

type
  TMontarGrid = procedure of object;

  TUnidadeMedidaCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oUnidadeMedidaModel: TUnidadeMedidaCadastroModel;
    oUnidadeMedidaRegra: TUnidadeMedidaCadastroRegra;
    oUnidadeMedidaDTO: TUnidadeMedidaDTO;
    iIdAlterar: Integer;

    oMontarGrid: TMontarGrid;
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create(const AProcedimentoMontarGrid: TMontarGrid);
    destructor Destroy; override;
  end;

var
  oUnidadeMedidaCadastroController: IInterfaceCadastroController;

implementation

{ TUnidadeMedidaCadastroController }

procedure TUnidadeMedidaCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmUnidadeMedidaCadastro))) then
    exit;
  frmUnidadeMedidaCadastro.Close;
  FreeAndNil(frmUnidadeMedidaCadastro);
  oUnidadeMedidaRegra.LimparDTO(oUnidadeMedidaDTO);
end;

constructor TUnidadeMedidaCadastroController.Create(const AProcedimentoMontarGrid: TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
  oUnidadeMedidaDTO := TUnidadeMedidaDTO.Create;
  oUnidadeMedidaModel := TUnidadeMedidaCadastroModel.Create;
  oUnidadeMedidaRegra := TUnidadeMedidaCadastroRegra.Create;
end;

procedure TUnidadeMedidaCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmUnidadeMedidaCadastro))) then
    frmUnidadeMedidaCadastro := TfrmUnidadeMedidaCadastro.Create(AOwner);
  frmUnidadeMedidaCadastro.oInterfaceCadastroController := oUnidadeMedidaCadastroController;

  frmUnidadeMedidaCadastro.Show;

  if (iId > 0) then
  begin
    oUnidadeMedidaDTO.idunidade_medida := iId;
    iIdAlterar := iId;
    oUnidadeMedidaRegra.SelectUpdate(oUnidadeMedidaDTO, oUnidadeMedidaModel);
    frmUnidadeMedidaCadastro.edtDescricao.Text := oUnidadeMedidaDTO.descricao;
    frmUnidadeMedidaCadastro.edtSigla.Text := oUnidadeMedidaDTO.sigla;

    if oUnidadeMedidaRegra.CheckBox(oUnidadeMedidaDTO.permite_decimal) then
    begin
      frmUnidadeMedidaCadastro.chkbDecimal.State := cbChecked;
    end
    else
    begin
      frmUnidadeMedidaCadastro.chkbDecimal.State := cbUnchecked;
    end;
  end;
end;

destructor TUnidadeMedidaCadastroController.Destroy;
begin
  if (Assigned(oUnidadeMedidaDTO)) then
    FreeAndNil(oUnidadeMedidaDTO);

  if (Assigned(oUnidadeMedidaModel)) then
    FreeAndNil(oUnidadeMedidaModel);

  if (Assigned(oUnidadeMedidaRegra)) then
    FreeAndNil(oUnidadeMedidaRegra);
  inherited;
end;

procedure TUnidadeMedidaCadastroController.Novo(Sender: TObject);
begin
  oUnidadeMedidaRegra.LimparDTO(oUnidadeMedidaDTO);
end;

procedure TUnidadeMedidaCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TUnidadeMedidaCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oUnidadeMedidaDTO.descricao := frmUnidadeMedidaCadastro.edtDescricao.Text;
  oUnidadeMedidaDTO.sigla := frmUnidadeMedidaCadastro.edtSigla.Text;
  oUnidadeMedidaDTO.permite_decimal := ifthen(frmUnidadeMedidaCadastro.chkbDecimal.Checked, 'S', 'N');
  iValidar := oUnidadeMedidaRegra.ValidarEdit(oUnidadeMedidaDTO);
  // descrição
  if (iValidar = 1) then
  begin
    messageDlg('Preencha o campo Unidade Medida corretamente!', mtWarning,
      [mbOK], 0);
    frmUnidadeMedidaCadastro.edtDescricao.SetFocus;
    exit;
  end;

  //sigla
  if (iValidar = 2) then
  begin
    messageDlg('Preencha o campo Sigla corretamente!', mtWarning,
      [mbOK], 0);
    frmUnidadeMedidaCadastro.edtSigla.SetFocus;
    exit;
  end;

  iSalvar := oUnidadeMedidaRegra.Salvar(oUnidadeMedidaDTO, oUnidadeMedidaModel);
  // Update True
  if (iSalvar = 1) then
  begin
    messageDlg('Registro alterado com sucesso!', mtInformation, [mbOK], 0);
    oMontarGrid;
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
    oMontarGrid;
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
