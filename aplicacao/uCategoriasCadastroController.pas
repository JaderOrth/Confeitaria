unit uCategoriasCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uCategoriasDTO, uCategoriasCadastroModel, uCategoriasCadastroRegra,
  uCategoriasCadastro;

type
  TCategoriasCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oCategoriasModel: TCategoriasCadastroModel;
    oCategoriasRegra: TCategoriaCadastroRegra;
    oCategoriasDTO: TCategoriasDTO;
    iIdAlterar: Integer;
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oCategoriasCadastroController: IInterfaceCadastroController;

implementation

{ TCategoriasCadastroController }

constructor TCategoriasCadastroController.Create;
begin
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

  if (iId > 0) then
  begin
    oCategoriasDTO.idcategoria := iId;
    iIdAlterar := iId;
    oCategoriasRegra.SelectUpdate(oCategoriasDTO, oCategoriasModel);
    frmCategoriasCadastro.edtCategoria.Text := oCategoriasDTO.descricao;
  end;
end;

procedure TCategoriasCadastroController.Novo(Sender: TObject);
begin
  oCategoriasRegra.LimparDTO(oCategoriasDTO);
end;

procedure TCategoriasCadastroController.Pesquisar(Sender: TObject);
begin

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
    messageDlg('Preencha o campo CATEGORIA corretamente!', mtWarning,
      [mbOK], 0);
    frmCategoriasCadastro.edtCategoria.SetFocus;
    exit;
  end;

  iSalvar := oCategoriasRegra.Salvar(oCategoriasDTO, oCategoriasModel);
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
