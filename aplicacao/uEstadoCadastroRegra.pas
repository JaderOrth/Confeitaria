unit uEstadoCadastroRegra;

interface

uses
  System.SysUtils,
  uEstadoDTO, uInterfaceCadastroModel;

type
  TEstadoCadastroRegra = class
  public
    function BuscarUpdate(var AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): boolean;
    function ValidarCampos(const AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): Integer;
    function Salvar(const AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): Integer;
    function ValidarUF(var aEstadoDTO: TEstadoDTO;
      const aModel: IIntrefaceCadastroModel): boolean;
    procedure LimparDTO(const aEstadoDTO: TEstadoDTO);
  end;

implementation

{ TEstadoCadastroRegra }

function TEstadoCadastroRegra.BuscarUpdate(var AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): boolean;
begin
  Result := AEstadoModel.BuscarUpdate(AEstado);
end;

procedure TEstadoCadastroRegra.LimparDTO(const aEstadoDTO: TEstadoDTO);
begin
  aEstadoDTO.ID := 0;
  aEstadoDTO.UF := EmptyStr;
  aEstadoDTO.Descricao := EmptyStr;
end;

function TEstadoCadastroRegra.Salvar(const AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): Integer;
begin
  Result := 0;
  if (AEstado.ID > 0) then
  begin
    if (not(AEstadoModel.Update(AEstado))) then
      Result := 1
  end
  else
  begin
    AEstado.ID := AEstadoModel.BuscarID;
    if (not(AEstadoModel.Salvar(AEstado))) then
      Result := 2;
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
end;

function TEstadoCadastroRegra.ValidarUF(var aEstadoDTO: TEstadoDTO;
  const aModel: IIntrefaceCadastroModel): boolean;
begin
  Result := False;
  if (Length(aEstadoDTO.UF) = 2) then
    Result := aModel.ValidarUF(aEstadoDTO);
end;

end.
