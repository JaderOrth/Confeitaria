unit uClienteCadastroController;

interface

uses
  System.Classes, System.SysUtils,
  uClienteCadastro, uInterfaceCadastroController, uClienteDTO,
  uClienteCadastroRegra, uClienteCadastroModel;

type
  TClienteCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oClienteDTO: TClienteDTO;
    oClienteModel: TClienteCadastroModel;
    oClienteRegra: TClienteCadastroRegra;
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
  oClienteCadastroController: IInterfaceCadastroController;

implementation

{ TClienteCadastroController }

procedure TClienteCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmCadastroCliente))) then
    exit;
  frmCadastroCliente.Close;
  FreeAndNil(frmCadastroCliente);
end;

constructor TClienteCadastroController.Create;
begin
  oClienteDTO := TClienteDTO.Create;
  oClienteModel := TClienteCadastroModel.Create;
  oClienteRegra := TClienteCadastroRegra.Create;
end;

procedure TClienteCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmCadastroCliente))) then
    frmCadastroCliente := TfrmCadastroCliente.Create(AOwner);
  frmCadastroCliente.oInterfaceCadastroController := oClienteCadastroController;
  frmCadastroCliente.Show;

  if (iId > 0) then
  begin

  end;
end;

destructor TClienteCadastroController.Destroy;
begin
  if (Assigned(oClienteDTO)) then
    FreeAndNil(oClienteDTO);

  if (Assigned(oClienteModel)) then
    FreeAndNil(oClienteModel);

  if (Assigned(oClienteRegra)) then
    FreeAndNil(oClienteRegra);
  inherited;
end;

procedure TClienteCadastroController.Novo(Sender: TObject);
begin

end;

procedure TClienteCadastroController.Pesquisar(Sender: TObject);
begin

end;

procedure TClienteCadastroController.Salvar(Sender: TObject);
begin

end;

end.
