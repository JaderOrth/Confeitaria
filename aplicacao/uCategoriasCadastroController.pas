unit uCategoriasCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uCategoriasDTO, uCategoriasCadastroModel,
  uCategoriasCadastroRegra,
  uCategoriasCadastro;

type
  TMontarGrid = procedure of object;

  TCategoriasCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oCategoriasModel: TCategoriasCadastroModel;
    oCategoriasRegra: TCategoriaCadastroRegra;
    oCategoriasDTO: TCategoriasDTO;
    oMontarGrid: TMontarGrid;
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
  oCategoriasCadastroController: IInterfaceCadastroController;

implementation

{ TCategoriasCadastroController }

constructor TCategoriasCadastroController.Create(const AProcedimentoMontarGrid: TMontarGrid);
begin
  oMontarGrid := AProcedimentoMontarGrid;
  oCategoriasDTO := TCategoriasDTO.Create;
  oCategoriasModel := TCategoriasCadastroModel.Create;
  oCategoriasRegra := TCategoriaCadastroRegra.Create;
end;

destructor TCategoriasCadastroController.Destroy;
begin
  if (Assigned(oCategoriasDTO)) then
    FreeAndNil(oCategoriasDTO);

  if (Assigned(oCategoriasModel)) then
    FreeAndNil(oCategoriasModel);

  if (Assigned(oCategoriasRegra)) then
    FreeAndNil(oCategoriasRegra);

  inherited;
end;

procedure TCategoriasCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmCategoriasCadastro))) then
    exit;
  frmCategoriasCadastro.Close;
  FreeAndNil(frmCategoriasCadastro);
  oCategoriasRegra.LimparDTO(oCategoriasDTO);
end;

procedure TCategoriasCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmCategoriasCadastro))) then
    frmCategoriasCadastro := TfrmCategoriasCadastro.Create(AOwner);
  frmCategoriasCadastro.oInterfaceCadastroController :=
    oCategoriasCadastroController;
  frmCategoriasCadastro.Show;
  frmCategoriasCadastro.btnSalvar.Enabled := True;
  frmCategoriasCadastro.btnNovo.Enabled := False;

  if (iId > 0) then
  begin
    oCategoriasDTO.idcategoria := iId;
    RetornarValorEdit(Sender);
  end;
end;

procedure TCategoriasCadastroController.Novo(Sender: TObject);
begin
  oCategoriasRegra.LimparDTO(oCategoriasDTO);
  frmCategoriasCadastro.btnSalvar.Enabled := True;
  frmCategoriasCadastro.btnNovo.Enabled := False;
end;

procedure TCategoriasCadastroController.Pesquisar(Sender: TObject);
begin
 {}
end;

procedure TCategoriasCadastroController.RetornarValorEdit(Sender: TObject);
begin
  if (oCategoriasRegra.SelectUpdate(oCategoriasDTO, oCategoriasModel)) then
  begin
    frmCategoriasCadastro.edtCategoria.Text := oCategoriasDTO.descricao;
  end
  else
  begin
    MessageDlg('Erro ao trazer o Registro do banco!', mtError, [mbOK], 0);
    exit;
  end;

end;

procedure TCategoriasCadastroController.Salvar(Sender: TObject);
var
  iValidar, iSalvar: Integer;
begin
  oCategoriasDTO.descricao := frmCategoriasCadastro.edtCategoria.Text;
  iValidar := oCategoriasRegra.ValidarEdit(oCategoriasDTO);
  // descrição
  if (iValidar = 1) then
  begin
    MessageDlg('Preencha o campo CATEGORIA corretamente!', mtWarning,
      [mbOK], 0);
    frmCategoriasCadastro.edtCategoria.SetFocus;
    exit;
  end;

  iSalvar := oCategoriasRegra.Salvar(oCategoriasDTO, oCategoriasModel);
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
    frmCategoriasCadastro.btnSalvar.Enabled := False;
    frmCategoriasCadastro.btnNovo.Enabled := True;
  end;
end;

end.
