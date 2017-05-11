unit uEstadoController;

interface

uses
  System.SysUtils, Vcl.Dialogs,
  uEstadoModel, uEstadoDTO;

type
  TEstadoController = class
  private
    oEstadoModel: TEstadoModel;
  public
    function Salvar(aEstado:TEstadoDTO):Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEstadoControler }

constructor TEstadoController.Create;
begin
  oEstadoModel := TEstadoModel.Create;
end;

destructor TEstadoController.Destroy;
begin
  if (Assigned(oEstadoModel)) then
    FreeAndNil(oEstadoModel);
  inherited;
end;

function TEstadoController.Salvar(const aEstado: TEstadoDTO): Boolean;
begin
  aEstado.ID := oEstadoModel.BuscarID;

  if oEstadoModel.Salvar(aEstado) = True then
  begin
    MessageDlg('Registro cadastrado com sucesso!', mtInformation, [mbOK], 0);
  end else
      begin
        raise Exception.Create('Falha ao inserir o registro');
      end;

end;

end.
