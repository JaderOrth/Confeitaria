unit uEstadoListagemController;

interface

uses
  System.SysUtils, Vcl.Dialogs, Controls, System.UITypes, FireDAC.Comp.Client,
  System.Classes, Vcl.DBGrids, Vcl.ExtCtrls,
  uInterfaceListagemController, uEstadoListagemModel, uEstadoDTO, uEstadoListagemRegra, uEstado, uEstadoCadastro;

type
  TEstadoController = class(TInterfacedObject, IInterfaceListagemController)
  private
    oEstadoModel: TEstadoListagemModel;
    oEstadoDTO: TEstadoDTO;
    oEstadoRegra: TEstadoListagemRegra;
    //oInterfaceController: IInterfaceController;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CreateFormCadastro(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure CloseFormCadastro(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

implementation


{ TEstadoControler }



procedure TEstadoController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmEstado))) then
    exit;
  FreeAndNil(frmEstado);
end;

procedure TEstadoController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    exit;
  FreeAndNil(frmEstadoCadastro);
end;

constructor TEstadoController.Create;
begin
  oEstadoModel := TEstadoListagemModel.Create;
  oEstadoDTO := TEstadoDTO.Create;
  oEstadoRegra := TEstadoListagemRegra.Create;
end;



procedure TEstadoController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmEstado))) then
    frmEstado := TfrmEstado.Create(AOwner);
  frmEstado.Show;

  frmEstado.btnSair.OnClick := CloseForm;


  oEstadoRegra.MontarGrid(frmEstado.FDMemTable_listagem, oEstadoModel);
  frmEstado.FDMemTable_listagem.Open
end;

procedure TEstadoController.CreateFormCadastro(AOwner: TComponent);
begin
  if (not(Assigned(frmEstadoCadastro))) then
    frmEstadoCadastro := TfrmEstadoCadastro.Create(AOwner);
  frmEstadoCadastro.Show;

  frmEstadoCadastro.btnSair.OnClick := CloseFormCadastro;
end;

destructor TEstadoController.Destroy;
begin
  if (Assigned(oEstadoModel)) then
    FreeAndNil(oEstadoModel);

  if (Assigned(oEstadoDTO)) then
    FreeAndNil(oEstadoDTO);

  if (Assigned(oEstadoRegra)) then
    FreeAndNil(oEstadoRegra);
  inherited;
end;


end.
