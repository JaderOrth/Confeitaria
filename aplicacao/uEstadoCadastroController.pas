unit uEstadoCadastroController;

interface

uses
  Vcl.Controls,
  System.Classes,
  System.SysUtils, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Dialogs,
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
    iIdAlterar: Integer;
  public
    procedure CreateFormCadastro(AOwner: TComponent; const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);

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
  const iId: Integer);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner);
  frmEstadoCadastro.oInterfaceCadastroController := oEstadoCadastroController;
  frmEstadoCadastro.Show;

  if (iId > 0) then
  begin
    iIdAlterar := iId;
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
    FreeAndNil(oEstadoModel);
  inherited;
end;

procedure TEstadoCadastroController.Salvar(Sender: TObject);
begin
  oEstadoDTO.ID := iIdAlterar;
  oEstadoDTO.UF := frmEstadoCadastro.edtSigla.Text;
  oEstadoDTO.Descricao := frmEstadoCadastro.edtEstado.Text;

 oEstadoRegra.Salvar(oEstadoDTO, oEstadoModel);


 // messageDlg('Registro foi salvo com sucesso!', mtInformation, [mbOK], 0);

  oEstadoRegra.LimparDTO(oEstadoDTO);
end;

procedure TEstadoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    exit;
  FreeAndNil(frmEstadoCadastro);
end;

end.
