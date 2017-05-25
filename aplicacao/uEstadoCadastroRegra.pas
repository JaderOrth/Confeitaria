unit uEstadoCadastroRegra;

interface

uses
  System.SysUtils,
  uEstadoDTO, uEstadoCadastroModel;

type
  TEstadoCadastroRegra = class
  private

  public
    function BuscarSelect(AEstado: TEstadoDTO;
      AEstadoModel: TEstadoCadastroModel): boolean;
    function Salvar(AEstado: TEstadoDTO;
      AEstadoModel: TEstadoCadastroModel): boolean;
  end;

implementation

{ TEstadoCadastroRegra }

function TEstadoCadastroRegra.BuscarSelect(AEstado: TEstadoDTO;
  AEstadoModel: TEstadoCadastroModel): boolean;
begin
  AEstadoModel.BuscarSelect(AEstado);
  Result := true;
end;

function TEstadoCadastroRegra.Salvar(AEstado: TEstadoDTO;
  AEstadoModel: TEstadoCadastroModel): boolean;
begin
  if (AEstado.ID > 0) then
  begin
    AEstadoModel.Update(AEstado);
  end else
  begin
    AEstado.ID := AEstadoModel.BuscarID;
    AEstadoModel.Salvar(AEstado);
  end;
end;

end.
