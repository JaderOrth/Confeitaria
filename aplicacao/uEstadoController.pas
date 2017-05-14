unit uEstadoController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.DBGrids,
  uEstadoModel, uEstadoDTO;

type
  TEstadoController = class
  private
    oEstadoModel: TEstadoModel;
  public
    function Salvar(const aEstado:TEstadoDTO):Boolean;
    function Excluir(const aEstado:TEstadoDTO):Boolean;
    function MontarGrid(aMemTable:TFDMemTable):Boolean;
    function BuscarSelect(var aEstado: TEstadoDTO): Boolean;

    procedure LimparDTO(aEstado:TEstadoDTO);
    procedure CriarFormulario(AOwner: TComponent; AidEstado : Integer);
    procedure OrdenarGrid(aGrid: TDBGrid);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  uEstadoCadastro;

{ TEstadoControler }

function TEstadoController.BuscarSelect(var aEstado: TEstadoDTO): Boolean;
begin
  Result := true;
  oEstadoModel.BuscarSelect(aEstado)
end;

constructor TEstadoController.Create;
begin
  oEstadoModel := TEstadoModel.Create;
end;

procedure TEstadoController.CriarFormulario(AOwner: TComponent; AidEstado: Integer);
begin
  if (not(Assigned(frmEstadoCadastro))) then
  begin
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner, AidEstado);
    frmEstadoCadastro.Show;
  end;
end;

destructor TEstadoController.Destroy;
begin
  if (Assigned(oEstadoModel)) then
    FreeAndNil(oEstadoModel);
  inherited;
end;

function TEstadoController.Excluir(const aEstado: TEstadoDTO): Boolean;
begin
  Result := False;
  if aEstado.ID > 0 then
  begin
    if MessageDlg('Deseja excluir este registro?', mtConfirmation,
      [mbYes,mbNo], 0) = mrYes then
    begin
      if oEstadoModel.Excluir(aEstado) then
      begin
        MessageDlg('Registro excluído com sucesso!', mtInformation, [mbOK], 0);
        Result := True;
      end else
      begin
        MessageDlg('Ocorreu um erro ao tentar excluir o registro!',
          mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TEstadoController.LimparDTO(aEstado: TEstadoDTO);
begin
  aEstado.ID := 0;
  aEstado.Descricao := '';
  aEstado.UF := '';
end;

function TEstadoController.MontarGrid(aMemTable: TFDMemTable): Boolean;
begin
  if (oEstadoModel.MontarGrid(aMemTable)) then
  begin
    Result := true;
  end else
  begin
    Result := False;
    MessageDlg('Nenhum Estado cadastrado!', mtInformation, [mbYes], 0);
  end;
end;

procedure TEstadoController.OrdenarGrid(aGrid: TDBGrid);
begin
  aGrid.Columns[0].Width := 40;
  aGrid.Columns[0].Title.Alignment := taCenter;
  aGrid.Columns[1].Width := 260;
  aGrid.Columns[1].Title.Alignment := taCenter;
  aGrid.Columns[2].Width := 50;
  aGrid.Columns[2].Title.Alignment := taCenter;
end;

function TEstadoController.Salvar(const aEstado: TEstadoDTO): Boolean;
begin
  {Result := false;
  if Length(Trim(aEstado.Descricao)) >= 4 then
  begin
    if Length(Trim(aEstado.UF)) = 2 then
    begin
      if aEstado.ID > 0 then
      begin
        if oEstadoModel.Update(aEstado) = True then
        begin
          MessageDlg('Registro alterado com sucesso!', mtInformation, [mbOK], 0);
        end else
        begin
          raise Exception.Create('Falaha ao alterar o registro!');
        end;
      end else
      begin
        aEstado.ID := oEstadoModel.BuscarID;
        if oEstadoModel.Salvar(aEstado) = True then
        begin
          MessageDlg('Registro cadastrado com sucesso!', mtInformation, [mbOK], 0);
          Result := True;
        end else
        begin
          raise Exception.Create('Falha ao inserir o registro!');
        end;
      end;
    end else
    begin
      MessageDlg('Preencha a Sigla da UF corretamente!', mtError, [mbOK], 0);
    end;
  end else
  begin
    MessageDlg('Preencha a Descrição da UF corretamente!', mtError, [mbOK], 0)
  end; }
  Result := false;

  if Length(Trim(aEstado.Descricao)) <= 3 then
  begin
    MessageDlg('Preencha a Descrição da UF corretamente!', mtError, [mbOK], 0);
    exit;
  end;

  if Length(Trim(aEstado.UF)) <> 2 then
  begin
    MessageDlg('Preencha a Sigla da UF corretamente!', mtError, [mbOK], 0);
    exit;
  end;

  if (aEstado.ID = 0) then
  begin
    if(oEstadoModel.BuscarUF(aEstado)) then
    begin
      MessageDlg('UF  '+QuotedStr(aEstado.UF)+' já cadastrado!',
        mtInformation, [mbNo], 0);
      exit;
    end;
  end;

  if aEstado.ID > 0 then
  begin
    if oEstadoModel.Update(aEstado) = false then
    begin
      raise Exception.Create('Falha ao alterar o registro!');
    end;
  end else
  begin
    aEstado.ID := oEstadoModel.BuscarID;
    if oEstadoModel.Salvar(aEstado) = False then
    begin
      raise Exception.Create('Falha ao inserir o registro!');
    end;
  end;
end;

end.
