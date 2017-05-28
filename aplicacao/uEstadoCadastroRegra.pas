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
    procedure LimparDTO(AEstadoDTO: TEstadoDTO);
  end;

implementation

{ TEstadoCadastroRegra }

function TEstadoCadastroRegra.BuscarSelect(AEstado: TEstadoDTO;
  AEstadoModel: TEstadoCadastroModel): boolean;
begin
  AEstadoModel.BuscarSelect(AEstado);
  Result := true;
end;

procedure TEstadoCadastroRegra.LimparDTO(AEstadoDTO: TEstadoDTO);
begin
  AEstadoDTO.ID := 0;
  AEstadoDTO.UF := EmptyStr;
  AEstadoDTO.Descricao := EmptyStr;
end;

function TEstadoCadastroRegra.Salvar(AEstado: TEstadoDTO;
  AEstadoModel: TEstadoCadastroModel): boolean;
begin
  if (AEstado.ID > 0) then
  begin
    if (AEstadoModel.BuscarEditUF(AEstado)) then
      Result := AEstadoModel.Update(AEstado)
    else
      raise Exception.Create('Uf '+QuotedStr(AEstado.UF)+' já esta cadastrado!');
  end else
  begin
    if (AEstadoModel.BuscarUF(AEstado)) then
      raise Exception.Create('UF '+QuotedStr(AEstado.UF)+' já esta cadastrado!');
    AEstado.ID := AEstadoModel.BuscarID;
    Result := AEstadoModel.Salvar(AEstado);
  end;
end;

end.
