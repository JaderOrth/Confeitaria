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
    function Salvar(var AEstado: TEstadoDTO;
      const AEstadoModel: IIntrefaceCadastroModel): boolean;
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

function TEstadoCadastroRegra.Salvar(var AEstado: TEstadoDTO;
  const AEstadoModel: IIntrefaceCadastroModel): boolean;
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
