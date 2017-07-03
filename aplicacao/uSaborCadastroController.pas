unit uSaborCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uSaborCadastro, uSaborDTO, uSaborCadastroRegra, uSaborCadastroModel;

type
  TSaborCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oSaborModel: TSaborCadastroModel;
    oSaborRegra: TSaborCadastroRegra;
    oSaborDTO: TSaborDTO;
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
  oSaborCadastroController: IInterfaceCadastroController;

implementation

{ TSaborCadastroController }

procedure TSaborCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmSaborCadastro))) then
    exit;
  frmSaborCadastro.Close;
  FreeAndNil(frmSaborCadastro);
  oSaborRegra.LimparDTO(oSaborDTO);
end;

constructor TSaborCadastroController.Create;
begin
  oSaborDTO := TSaborDTO.Create;
  oSaborModel := TSaborCadastroModel.Create;
  oSaborRegra := TSaborCadastroRegra.Create;
end;

procedure TSaborCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmSaborCadastro))) then
    frmSaborCadastro := TfrmSaborCadastro.Create(AOwner);
  frmSaborCadastro.oInterfaceCadastroController := oSaborCadastroController;

  frmSaborCadastro.Show;
  frmSaborCadastro.btnSalvar.Enabled := True;
  frmSaborCadastro.btnNovo.Enabled := False;
  if (iId > 0) then
  begin
    oSaborDTO.idsabores := iId;
    RetornarValorEdit(Sender);
  end;
end;

destructor TSaborCadastroController.Destroy;
begin
  if (Assigned(oSaborDTO)) then
    FreeAndNil(oSaborDTO);

  if (Assigned(oSaborModel)) then
    FreeAndNil(oSaborModel);

  if (Assigned(oSaborRegra)) then
    FreeAndNil(oSaborRegra);
  inherited;
end;

procedure TSaborCadastroController.Novo(Sender: TObject);
begin
  oSaborRegra.LimparDTO(oSaborDTO);
  frmSaborCadastro.btnSalvar.Enabled := True;
  frmSaborCadastro.btnNovo.Enabled := False;
end;

procedure TSaborCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TSaborCadastroController.RetornarValorEdit(Sender: TObject);
begin
  if (oSaborRegra.SelectUpdate(oSaborDTO, oSaborModel)) then
  begin
    frmSaborCadastro.edtSabor.Text := oSaborDTO.descricao;
    frmSaborCadastro.edtIngredientes.Text := oSaborDTO.ingredientes;
  end
  else
  begin
    MessageDlg('Erro ao retornar os valor do banco!', mtError, [mbOK], 0);
    Exit;
  end;
end;

procedure TSaborCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oSaborDTO.ingredientes := frmSaborCadastro.edtIngredientes.Text;
  oSaborDTO.descricao := frmSaborCadastro.edtSabor.Text;
  iValidar := oSaborRegra.ValidarEdit(oSaborDTO);
  // descrição
  if (iValidar = 1) then
  begin
    messageDlg('Preencha o campo SABOR corretamente!', mtWarning,
      [mbOK], 0);
    frmSaborCadastro.edtSabor.SetFocus;
    exit;
  end;
  //ingredientes
  if (iValidar = 2) then
  begin
    messageDlg('Preencha o campo INGREDIENTES corretamente!', mtWarning,
      [mbOK], 0);
    frmSaborCadastro.edtIngredientes.SetFocus;
    exit;
  end;

  iSalvar := oSaborRegra.Salvar(oSaborDTO, oSaborModel);
  // Update False
  if (iSalvar = 1) then
  begin
    messageDlg('Erro ao alterar o registro!', mtError, [mbOK], 0);
    exit;
  end;
  // Insert False
  if (iSalvar = 2) then
  begin
    messageDlg('Erro ao salvar o registro!', mtError, [mbOK], 0);
    exit;
  end;

  if (iSalvar = 0) then
  begin
    frmSaborCadastro.btnSalvar.Enabled := False;
    frmSaborCadastro.btnNovo.Enabled := True;;
  end;

end;

end.
