unit uEstadoCadastroRegra;

interface

uses
  System.SysUtils,
  uEstadoDTO, uInterfaceCadastroModel;

type
  TEstadoCadastroRegra = class
  private

  public
    function BuscarUpdate(var AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): boolean;
    function ValidarCampos(const AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): Integer;
    function Salvar(const AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): Integer;
    procedure LimparDTO(const AEstadoDTO: TEstadoDTO);
  end;

implementation

{ TEstadoCadastroRegra }

function TEstadoCadastroRegra.BuscarUpdate(var AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): boolean;
begin
  Result := AEstadoModel.BuscarUpdate(AEstado);
end;

procedure TEstadoCadastroRegra.LimparDTO(const AEstadoDTO: TEstadoDTO);
begin
  AEstadoDTO.ID := 0;
  AEstadoDTO.UF := EmptyStr;
  AEstadoDTO.Descricao := EmptyStr;
end;

function TEstadoCadastroRegra.Salvar(const AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): Integer;
begin
  if (AEstado.ID > 0) then
  begin
    if (AEstadoModel.Update(AEstado)) then
      Result := 1
    else
      Result := 2;
  end
  else
  begin
    AEstado.ID := AEstadoModel.BuscarID;
   if (AEstadoModel.Salvar(AEstado)) then
    Result := 3
   else
    Result := 4;
  end;
end;

function TEstadoCadastroRegra.ValidarCampos(const AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): Integer;
begin
  Result := 0;
    if (Length(Trim(AEstado.UF)) <> 2) then
  begin
    Result := 1;
    exit;
  end;
  if (Length(Trim(AEstado.Descricao)) <= 3) then
  begin
    Result := 2;
    exit;
  end;
  if (AEstadoModel.ValidarUF(AEstado)) then
  begin
    Result := 3;
    exit;
  end;
end;

end.
