unit uUsuarioListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes,
  uUsuario, uInterfaceListagemController, uUsuarioCadastroController,
  uUsuarioListagemRegra, uUsuarioDTO,
  uUsuarioListagemModel;

type
  TUsuarioListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oUsuarioDTO: TUsuarioDTO;
    oUsuarioModel: TUsuarioListagemModel;
    oUsuarioRegra: TUsuarioListagemRegra;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemTable: TFDMemTable);
    procedure Excluir(oMemTable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oUsuarioListagemController: IInterfaceListagemController;

implementation

{ TUsuarioListagemController }

procedure TUsuarioListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'usuario like ''%' + APesquisa + '%''';
  aMemTable.Filtered := true;
end;

procedure TUsuarioListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmUsuario))) then
    Exit;
  oUsuarioCadastroController.CloseFormCadastro(Sender);
  frmUsuario.Close;
  FreeAndNil(frmUsuario);
end;

procedure TUsuarioListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oUsuarioCadastroController))) then
    oUsuarioCadastroController := TUsuarioCadastroController.Create;
  oUsuarioCadastroController.CreateFormCadastro(frmUsuario, Sender, 0);
end;

constructor TUsuarioListagemController.Create;
begin
  oUsuarioDTO := TUsuarioDTO.Create;
  oUsuarioModel := TUsuarioListagemModel.Create;
  oUsuarioRegra := TUsuarioListagemRegra.Create;
end;

procedure TUsuarioListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iId: Integer;
begin
  if (not(Assigned(oUsuarioCadastroController))) then
    oUsuarioCadastroController := TUsuarioCadastroController.Create;
  iId := oMemTable.FieldByName('idusuario').AsInteger;
  oUsuarioCadastroController.CreateFormCadastro(frmUsuario, Sender, iId);
end;

procedure TUsuarioListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmUsuario))) then
    frmUsuario := TfrmUsuario.Create(AOwner);

  frmUsuario.oListagemBase := oUsuarioListagemController;
  frmUsuario.OnActivate(nil);
  frmUsuario.Show;
end;

destructor TUsuarioListagemController.Destroy;
begin
  if (Assigned(oUsuarioDTO)) then
    FreeAndNil(oUsuarioDTO);

  if (Assigned(oUsuarioModel)) then
    FreeAndNil(oUsuarioModel);

  if (Assigned(oUsuarioRegra)) then
    FreeAndNil(oUsuarioRegra);
  inherited;
end;

procedure TUsuarioListagemController.Excluir(oMemTable: TFDMemTable);
var
  iId, iValidar: Integer;
begin
  if (messageDlg('Deseja realmente deletar esse registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    iId := oMemTable.FieldByName('idusuario').AsInteger;
    iValidar := oUsuarioRegra.Excluir(iId, oUsuarioModel);
    if (iValidar = 1) then
    begin
      messageDlg('Registro deletado com sucesso!', mtInformation, [mbOK], 0);
      oMemTable.Locate('idusuario', iId);
      oMemTable.Delete;
    end;

    if (iValidar = 2) then
    begin
      messageDlg('Erro ao deletar este Registro', mtWarning, mbOKCancel, 0);
      Exit;
    end;

    if (iValidar = 3) then
    begin
      messageDlg('Erro ao deletar este registro, está associado ao MUNICÍPIO',
        mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
end;

procedure TUsuarioListagemController.Help(Sender: TObject);
begin

end;

procedure TUsuarioListagemController.MontarGrid(oMemTable: TFDMemTable);
begin
  oMemTable.Close;
  if (oUsuarioRegra.BuscarGrid(oMemTable, oUsuarioModel)) then
  begin
    oMemTable.Open;
    frmUsuario.bClick := true;
    frmUsuario.btnEditar.Enabled := true;
    frmUsuario.btnExcluir.Enabled := true;
  end
  else
  begin
    frmUsuario.bClick := False;
    frmUsuario.btnEditar.Enabled := False;
    frmUsuario.btnExcluir.Enabled := False;
  end;
end;

end.
