unit uUnidadeMedidaCadastroController;

interface

uses
  System.Classes, System.SysUtils, System.StrUtils, Vcl.StdCtrls,
  System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uUnidadeMedidaCadastro, uUnidadeMedidaDTO,
  uUnidadeMedidaCadastroRegra, uUnidadeMedidaCadastroModel;

type
  TUnidadeMedidaCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oUnidadeMedidaModel: TUnidadeMedidaCadastroModel;
    oUnidadeMedidaRegra: TUnidadeMedidaCadastroRegra;
    oUnidadeMedidaDTO: TUnidadeMedidaDTO;
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

constructor TUnidadeMedidaCadastroController.Create;
begin
  oUnidadeMedidaDTO := TUnidadeMedidaDTO.Create;
  oUnidadeMedidaModel := TUnidadeMedidaCadastroModel.Create;
  oUnidadeMedidaRegra := TUnidadeMedidaCadastroRegra.Create;
end;

procedure TUnidadeMedidaCadastroController.CreateFormCadastro
  (AOwner: TComponent; Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmUnidadeMedidaCadastro))) then
    frmUnidadeMedidaCadastro := TfrmUnidadeMedidaCadastro.Create(AOwner);
  frmUnidadeMedidaCadastro.oInterfaceCadastroController :=
    oUnidadeMedidaCadastroController;

  frmUnidadeMedidaCadastro.Show;

  if (iId > 0) then
  begin
    oUnidadeMedidaDTO.idunidade_medida := iId;
    RetornarValorEdit(Sender);
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

procedure TUnidadeMedidaCadastroController.RetornarValorEdit(Sender: TObject);
begin
  if (oUnidadeMedidaRegra.SelectUpdate(oUnidadeMedidaDTO, oUnidadeMedidaModel))
  then
  begin
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
  end
  else
  begin
    MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TUnidadeMedidaCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oUnidadeMedidaDTO.descricao := frmUnidadeMedidaCadastro.edtDescricao.Text;
  oUnidadeMedidaDTO.sigla := frmUnidadeMedidaCadastro.edtSigla.Text;
  oUnidadeMedidaDTO.permite_decimal :=
    ifthen(frmUnidadeMedidaCadastro.chkbDecimal.Checked, 'S', 'N');
  iValidar := oUnidadeMedidaRegra.ValidarEdit(oUnidadeMedidaDTO);
  // descri��o
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo Unidade Medida corretamente!', mtWarning,
      [mbOK], 0);
    frmUnidadeMedidaCadastro.edtDescricao.SetFocus;
    exit;
  end;
  // sigla
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo Sigla corretamente!', mtWarning, [mbOK], 0);
    frmUnidadeMedidaCadastro.edtSigla.SetFocus;
    exit;
  end;

  iSalvar := oUnidadeMedidaRegra.Salvar(oUnidadeMedidaDTO, oUnidadeMedidaModel);
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
end;

end.
