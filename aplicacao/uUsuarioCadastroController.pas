unit uUsuarioCadastroController;

interface

uses
  System.Classes, System.SysUtils, System.UITypes, Vcl.Dialogs,
  uUsuarioCadastro, uInterfaceCadastrocontroller, uUsuarioCadastroRegra,
  uUsuarioCadastroModel, uUsuarioDTO;


type
  TMontarGrid = procedure of object;

  TUsuarioCadastroController = class(
    TInterfacedObject, IInterfaceCadastroController)
  private
    oUsuarioDTO: TUsuarioDTO;
    oUsuarioModel: TUsuarioCadastroModel;
    oUsuarioRegra: TUsuarioCadastroRegra;

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

constructor TUsuarioCadastroController.Create(const AProcedimentoMontarGrid: TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
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

  if (iId > 0) then
  begin
    oUsuarioDTO.idUsuario := iId;
    oUsuarioRegra.BuscarUpdate(oUsuarioDTO, oUsuarioModel);
    frmUsuarioCadastro.edtUsuario.Text := oUsuarioDTO.usuario;
    frmUsuarioCadastro.edtSenha.Text := oUsuarioDTO.senha;
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
  frmUsuarioCadastro.btnSalvar.Enabled := True;
  frmUsuarioCadastro.btnNovo.Enabled := False;
end;

procedure TUsuarioCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TUsuarioCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oUsuarioDTO.usuario := frmUsuarioCadastro.edtUsuario.Text;
  oUsuarioDTO.senha := frmUsuarioCadastro.edtSenha.Text;

  iValidar := oUsuarioRegra.Validar(oUsuarioDTO);
  //usuario
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo USUÁRIO corretamente!', mtWarning, [mbOK], 0);
    exit;
  end;
  //senha
  if (iValidar = 2) then
  begin
    MessageDlg('Preencha o campo SENHA com mais de 6 caracteres!',
      mtWarning, [mbOK], 0);
    exit;
  end;

  //iSalvar = oUsuarioRegra
  iSalvar := oUsuarioRegra.Salvar(oUsuarioDTO, oUsuarioModel);
  // Update True
  if (iSalvar = 1) then
  begin
    messageDlg('Registro alterado com sucesso!', mtInformation, [mbOK], 0);
    oMontarGrid;
    frmUsuarioCadastro.btnSalvar.Enabled := False;
    frmUsuarioCadastro.btnNovo.Enabled := True;
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
    frmUsuarioCadastro.btnSalvar.Enabled := False;
    frmUsuarioCadastro.btnNovo.Enabled := True;
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
