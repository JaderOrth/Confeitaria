unit uUsuarioCadastroController;

interface

uses
  System.Classes, System.SysUtils, System.UITypes, Vcl.Dialogs,
  uUsuarioCadastro, uInterfaceCadastrocontroller, uUsuarioCadastroRegra,
  uUsuarioCadastroModel, uUsuarioDTO;

type
  TUsuarioCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oUsuarioDTO: TUsuarioDTO;
    oUsuarioModel: TUsuarioCadastroModel;
    oUsuarioRegra: TUsuarioCadastroRegra;
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
  oUsuarioCadastroController: IInterfaceCadastroController;

implementation

{ TUsuarioCadastroController }

procedure TUsuarioCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmUsuarioCadastro))) then
    exit;
  frmUsuarioCadastro.Close;
  FreeAndNil(frmUsuarioCadastro);
  oUsuarioRegra.LimparDTO(oUsuarioDTO);
end;

constructor TUsuarioCadastroController.Create;
begin
  oUsuarioDTO := TUsuarioDTO.Create;
  oUsuarioModel := TUsuarioCadastroModel.Create;
  oUsuarioRegra := TUsuarioCadastroRegra.Create;
end;

procedure TUsuarioCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmUsuarioCadastro))) then
    frmUsuarioCadastro := TfrmUsuarioCadastro.Create(AOwner);
  frmUsuarioCadastro.oInterfaceCadastroController := oUsuarioCadastroController;
  frmUsuarioCadastro.Show;
  frmUsuarioCadastro.btnSalvar.Enabled := True;
  frmUsuarioCadastro.btnNovo.Enabled := False;

  if (iId > 0) then
  begin
    oUsuarioDTO.idUsuario := iId;
    RetornarValorEdit(Sender);
  end;

end;

destructor TUsuarioCadastroController.Destroy;
begin
  if (Assigned(oUsuarioDTO)) then
    FreeAndNil(oUsuarioDTO);

  if (Assigned(oUsuarioModel)) then
    FreeAndNil(oUsuarioModel);

  if (Assigned(oUsuarioRegra)) then
    FreeAndNil(oUsuarioRegra);
  inherited;
end;

procedure TUsuarioCadastroController.Novo(Sender: TObject);
begin
  oUsuarioRegra.LimparDTO(oUsuarioDTO);
  frmUsuarioCadastro.edtUsuario.SetFocus;
  frmUsuarioCadastro.btnSalvar.Enabled := True;
  frmUsuarioCadastro.btnNovo.Enabled := False;
end;

procedure TUsuarioCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TUsuarioCadastroController.RetornarValorEdit(Sender: TObject);
begin
  if (oUsuarioRegra.BuscarUpdate(oUsuarioDTO, oUsuarioModel)) then
  begin
    frmUsuarioCadastro.edtUsuario.Text := oUsuarioDTO.usuario;
    frmUsuarioCadastro.edtSenha.Text := oUsuarioDTO.senha;
  end
  else
  begin
    MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TUsuarioCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oUsuarioDTO.usuario := frmUsuarioCadastro.edtUsuario.Text;
  oUsuarioDTO.senha := frmUsuarioCadastro.edtSenha.Text;

  iValidar := oUsuarioRegra.Validar(oUsuarioDTO);
  // usuario
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo USU�RIO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  // senha
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo SENHA com mais de 6 caracteres!', mtWarning,
      [mbOK], 0);
    exit;
  end;

  // iSalvar = oUsuarioRegra
  iSalvar := oUsuarioRegra.Salvar(oUsuarioDTO, oUsuarioModel);
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
    frmUsuarioCadastro.btnSalvar.Enabled := False;
    frmUsuarioCadastro.btnNovo.Enabled := True;
  end;
end;

end.
