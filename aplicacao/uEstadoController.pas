unit uEstadoController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client, System.Classes,
  uEstadoModel, uEstadoDTO;

type
  TEstadoController = class
  private
    oEstadoModel: TEstadoModel;
  public
    function Salvar(const aEstado:TEstadoDTO):Boolean;
    function Excluir(const aEstado:TEstadoDTO):Boolean;
    function MontarGrid(out aMemTable:TFDMemTable):Boolean;

    procedure LimparDTO(aEstado:TEstadoDTO);
    procedure CriarFormulario(AOwner: TComponent; AidEstado : Integer);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  uEstadoCadastro;

{ TEstadoControler }

constructor TEstadoController.Create;
begin
  oEstadoModel := TEstadoModel.Create;
end;

procedure TEstadoController.CriarFormulario(AOwner: TComponent; AidEstado: Integer);
begin
  if (not(Assigned(frmEstadoCadastro))) then
  begin
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner, 0);
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
    if MessageDlg('Deseja excluir este registro?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      if oEstadoModel.Excluir(aEstado) then
      begin
        MessageDlg('Registro excluído com sucesso!', mtInformation, [mbOK], 0);
        Result := True;
      end else
      begin
        MessageDlg('Ocorreu um erro ao tentar excluir o registro!', mtError, [mbOK], 0);
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

function TEstadoController.MontarGrid(out aMemTable: TFDMemTable): Boolean;
begin
  oEstadoModel.MontarGrid(aMemTable);
end;

function TEstadoController.Salvar(const aEstado: TEstadoDTO): Boolean;
begin
  if Length(Trim(aEstado.Descricao)) >= 4 then
  begin
    if Length(Trim(aEstado.UF)) = 2 then
    begin
      aEstado.ID := oEstadoModel.BuscarID;
      if oEstadoModel.Salvar(aEstado) = True then
      begin
        MessageDlg('Registro cadastrado com sucesso!', mtInformation, [mbOK], 0);
        Result := True;
      end else
          begin
            raise Exception.Create('Falha ao inserir o registro');
          end;
    end else
        begin
          MessageDlg('Preencha a Sigla da UF corretamente!', mtError, [mbOK], 0);
        end;
  end else
      begin
        MessageDlg('Preencha a Descrição da UF corretamente!', mtError, [mbOK], 0)
      end;
end;

end.
