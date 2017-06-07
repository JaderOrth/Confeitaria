unit uEstadoCadastroController;

interface

uses
  Vcl.Controls,
  System.Classes,
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

  if (iId > 0) then
  begin
    oEstadoDTO.ID := iId;
    oEstadoRegra.BuscarUpdate(oEstadoDTO, oEstadoModel);
    frmEstadoCadastro.edtSigla.Enabled := False;
    frmEstadoCadastro.edtEstado.SetFocus;
    frmEstadoCadastro.edtEstado.Text := oEstadoDTO.Descricao;
    frmEstadoCadastro.edtSigla.Text := oEstadoDTO.UF;
  end
  else
    frmEstadoCadastro.edtSigla.Enabled := True;
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
  frmEstadoCadastro.edtSigla.Enabled := true;
  frmEstadoCadastro.edtSigla.SetFocus;
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
  if (oEstadoDTO.ID = 0) then
  begin
    //Validar UF
    if (iValidar = 3) then
    begin
      MessageDlg('Estado '+ oEstadoDTO.UF+' já cadastrado!', mtWarning, [mbOK], 0);
      frmEstadoCadastro.edtSigla.SetFocus;
      exit;
    end;
  end;

  iSalvar := oEstadoRegra.Salvar(oEstadoDTO, oEstadoModel);

  // Alterar
  if (iSalvar = 1) then
  begin
    MessageDlg('Registro Alterado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Erro ao Alterar
  if (iSalvar = 2) then
  begin
    MessageDlg('Erro ao Alterar o regristro!', mtWarning, [mbOK], 0);
    exit;
  end;
  // Salvar
  if (iSalvar = 3) then
  begin
    MessageDlg('Registro Cadastrado com sucesso!', mtInformation, [mbOK], 0);
    exit;
  end;
  // Erro ao Salvar
  if (iSalvar = 4) then
  begin
    MessageDlg('Erro ao Salvar o regristro!', mtWarning, [mbOK], 0);
    exit;
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
