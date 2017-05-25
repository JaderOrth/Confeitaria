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
  end;

implementation

{ TEstadoCadastroRegra }

function TEstadoCadastroRegra.BuscarSelect(AEstado: TEstadoDTO;
  AEstadoModel: TEstadoCadastroModel): boolean;
begin
  AEstadoModel.BuscarSelect(AEstado);
  Result := true;
end;

end.
