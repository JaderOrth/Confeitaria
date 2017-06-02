unit uEstadoCadastroController;

interface

uses
  Vcl.Controls,
  System.Classes,
  System.SysUtils, Vcl.ExtCtrls, Vcl.StdCtrls,
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
    procedure CreateFormCadastro(AOwner: TComponent; const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Pesquisar(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oEstadoCadastroController: IInterfaceCadastroController;

implementation

procedure TEstadoCadastroController.Pesquisar(Sender: TObject);
begin
{}
end;

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

  frmEstadoCadastro.edtSigla.OnExit := oEstadoCadastroController.Pesquisar();
  frmEstadoCadastro.Show;


  if (iId > 0) then
  begin
    oEstadoDTO.ID := iId;
    oEstadoRegra.BuscarUpdate(oEstadoDTO, oEstadoModel);
    frmEstadoCadastro.edtSigla.Enabled := False;
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
  //oEstadoDTO.ID := StrToIntDef(frmEstadoCadastro.edtID.Text, 0);
  oEstadoDTO.UF := frmEstadoCadastro.edtSigla.Text;
  oEstadoDTO.Descricao := frmEstadoCadastro.edtEstado.Text;

  oEstadoRegra.Salvar(oEstadoDTO, oEstadoModel);
  oEstadoRegra.LimparDTO(oEstadoDTO);
end;

procedure TEstadoCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    exit;
  FreeAndNil(frmEstadoCadastro);
end;

end.
