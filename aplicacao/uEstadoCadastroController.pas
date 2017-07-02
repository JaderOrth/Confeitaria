unit uEstadoCadastroController;

interface

uses
  Vcl.Controls,   System.Classes,
  System.SysUtils, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Dialogs, System.UITypes,
  uEstadoCadastro, uInterfaceCadastroController, uEstadoDTO,
  uEstadoCadastroRegra, uEstadoCadastroModel;

type
  TEstadoCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oEstadoDTO: TEstadoDTO;
    oEstadoRegra: TEstadoCadastroRegra;
    oEstadoModel: TEstadoCadastroModel;
    frmEstadoCadastro: TfrmEstadoCadastro;
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
  oEstadoCadastroController: IInterfaceCadastroController;

implementation

constructor TEstadoCadastroController.Create;
begin
  oEstadoRegra := TEstadoCadastroRegra.Create;
  oEstadoDTO := TEstadoDTO.Create;
  oEstadoModel := TEstadoCadastroModel.Create;
end;

procedure TEstadoCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner);
  frmEstadoCadastro.oInterfaceCadastroController := oEstadoCadastroController;
  frmEstadoCadastro.Show;

  frmEstadoCadastro.edtSigla.OnExit := Pesquisar;

  frmEstadoCadastro.btnSalvar.Enabled := True;
  frmEstadoCadastro.btnNovo.Enabled := False;

  if (iId > 0) then
  begin
    oEstadoDTO.ID := iId;
    RetornarValorEdit(Sender);
  end
  else
  begin
    frmEstadoCadastro.edtSigla.Enabled := True;
    frmEstadoCadastro.edtSigla.SetFocus
  end;
end;

destructor TEstadoCadastroController.Destroy;
begin
  if (Assigned(oEstadoDTO)) then
    FreeandNil(oEstadoDTO);

  if (Assigned(oEstadoRegra)) then
    FreeandNil(oEstadoRegra);

  if (Assigned(oEstadoModel)) then
    FreeandNil(oEstadoModel);
  inherited;
end;

procedure TEstadoCadastroController.Novo(Sender: TObject);
begin
  oEstadoRegra.LimparDTO(oEstadoDTO);
  frmEstadoCadastro.edtSigla.Enabled := True;
  frmEstadoCadastro.edtSigla.SetFocus;
  frmEstadoCadastro.btnSalvar.Enabled := True;
  frmEstadoCadastro.btnNovo.Enabled := False;
end;

procedure TEstadoCadastroController.Pesquisar(Sender: TObject);
begin
  if (oEstadoDTO.ID = 0) then
  begin
    oEstadoDTO.UF := frmEstadoCadastro.edtSigla.Text;
    if (oEstadoRegra.ValidarUF(oEstadoDTO, oEstadoModel)) then
    begin
      frmEstadoCadastro.edtEstado.Text := oEstadoDTO.Descricao;
    end;
  end;
end;

procedure TEstadoCadastroController.RetornarValorEdit(Sender: TObject);
begin
  frmEstadoCadastro.edtEstado.Clear;
  frmEstadoCadastro.edtSigla.Clear;

  if (oEstadoRegra.BuscarUpdate(oEstadoDTO, oEstadoModel)) then
  begin
    frmEstadoCadastro.edtEstado.Text := oEstadoDTO.Descricao;
    frmEstadoCadastro.edtSigla.Text := oEstadoDTO.UF;
    frmEstadoCadastro.edtSigla.Enabled := False;
    frmEstadoCadastro.edtEstado.SetFocus;
  end
  else
  begin
    MessageDlg('Erro ao trazer o Registro do banco!', mtError, [mbOK], 0);
    exit;
  end;

end;

procedure TEstadoCadastroController.Salvar(Sender: TObject);
var
  iSalvar, iValidar: Integer;
begin
  oEstadoDTO.UF := frmEstadoCadastro.edtSigla.Text;
  oEstadoDTO.Descricao := frmEstadoCadastro.edtEstado.Text;

  iValidar := oEstadoRegra.ValidarCampos(oEstadoDTO, oEstadoModel);
  // Valida o campo sigla do estado
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo SIGLA corretamente!', mtWarning, [mbOK], 0);
    frmEstadoCadastro.edtSigla.SetFocus;
    exit;
  end;
  // valida o campo Estado
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo ESTADO corretamente!', mtWarning, [mbOK], 0);
    frmEstadoCadastro.edtEstado.SetFocus;
    exit;
  end;

  iSalvar := oEstadoRegra.Salvar(oEstadoDTO, oEstadoModel);

  // Erro ao Alterar
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao Alterar o regristro!', mtWarning, [mbOK], 0);
    exit;
  end;
  // Erro ao Salvar
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao Salvar o regristro!', mtWarning, [mbOK], 0);
    exit;
  end;

  if (iSalvar = 0) then
  begin
    frmEstadoCadastro.btnSalvar.Enabled := False;
    frmEstadoCadastro.btnNovo.Enabled := True;
  end;
end;

procedure TEstadoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    exit;
  FreeandNil(frmEstadoCadastro);
  oEstadoRegra.LimparDTO(oEstadoDTO);
end;

end.
