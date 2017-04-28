unit uEstadoControler;

interface

uses
  System.SysUtils,
  uEstadoModel, uEstadoDTO;

type
  TEstadoControler = class
  private
    oEstadoModel: TEstadoModel;
  public


    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEstadoControler }

constructor TEstadoControler.Create;
begin
  oEstadoModel := TEstadoModel.Create;
end;

destructor TEstadoControler.Destroy;
begin
  if (Assigned(oEstadoModel)) then
    FreeAndNil(oEstadoModel);
  inherited;
end;

end.
