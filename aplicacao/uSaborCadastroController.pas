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
    iIdAlterar: Integer;
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

  if (iId > 0) then
  begin
    oSaborDTO.idsabores := iId;
    iIdAlterar := iId;
    oSaborRegra.SelectUpdate(oSaborDTO, oSaborModel);
    frmSaborCadastro.edtSabor.Text := oSaborDTO.descricao;
    frmSaborCadastro.edtIngredientes.Text := oSaborDTO.ingredientes;
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
end;

procedure TSaborCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TSaborCadastroController.RetornarValorEdit(Sender: TObject);
begin

end;

procedure TSaborCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
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

  oSaborDTO.ingredientes := frmSaborCadastro.edtIngredientes.Text;
  iValidar := oSaborRegra.ValidarEdit(oSaborDTO);
  //ingredientes
  if (iValidar = 2) then
  begin
    messageDlg('Preencha o campo INGREDIENTES corretamente!', mtWarning,
      [mbOK], 0);
    frmSaborCadastro.edtIngredientes.SetFocus;
    exit;
  end;

  iSalvar := oSaborRegra.Salvar(oSaborDTO, oSaborModel);
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
