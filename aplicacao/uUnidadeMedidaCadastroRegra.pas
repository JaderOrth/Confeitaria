unit uUnidadeMedidaCadastroRegra;

interface

uses
  System.SysUtils,
  uInterfaceUnidadeMedidaCadastroModel, uUnidadeMedidaDTO, uInterfaceListagemModel;

type
  TUnidadeMedidaCadastroRegra = class
  public
    procedure LimparDTO(aUnidadeMedidaDTO: TUnidadeMedidaDTO);
    function SelectUpdate(var aUnidadeMedidaDTO: TUnidadeMedidaDTO;
      const aModel: IInterfaceUnidadeMedidaCadastroModel): Boolean;
    function ValidarEdit(const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Integer;
    function Salvar(const aUnidadeMedidaDTO: TUnidadeMedidaDTO;
      const aModel: IInterfaceUnidadeMedidaCadastroModel): Integer;
    function CheckBox(const aCheck: string):Boolean;
  end;

implementation

{ TUnidadeMedidaCadastroRegra }

function TUnidadeMedidaCadastroRegra.CheckBox(const aCheck: string): Boolean;
begin
  Result := False;

  if aCheck = 'S' then
  begin
    Result := True;
  end;
  if aCheck = 'N' then
  begin
    Result := False;
  end;
end;

procedure TUnidadeMedidaCadastroRegra.LimparDTO(
  aUnidadeMedidaDTO: TUnidadeMedidaDTO);
begin
  aUnidadeMedidaDTO.idunidade_medida := 0;
  aUnidadeMedidaDTO.descricao := emptyStr;
  aUnidadeMedidaDTO.sigla := EmptyStr;
  aUnidadeMedidaDTO.permite_decimal := 'N';
end;

function TUnidadeMedidaCadastroRegra.Salvar(
  const aUnidadeMedidaDTO: TUnidadeMedidaDTO;
  const aModel: IInterfaceUnidadeMedidaCadastroModel): Integer;
begin
  Result := 0;
  if (aUnidadeMedidaDTO.idunidade_medida > 0) then
  begin
    if (not(aModel.update(aUnidadeMedidaDTO))) then
    begin
      Result := 1;
      exit;
    end;
  end
  else
  begin
    aUnidadeMedidaDTO.idunidade_medida := aModel.BuscarID;
    if (not(aModel.Insert(aUnidadeMedidaDTO))) then
    begin
      Result := 2;
      exit;
    end;
  end;
end;

function TUnidadeMedidaCadastroRegra.SelectUpdate(
  var aUnidadeMedidaDTO: TUnidadeMedidaDTO;
  const aModel: IInterfaceUnidadeMedidaCadastroModel): Boolean;
begin
  Result := aModel.SelectUpdate(aUnidadeMedidaDTO);
end;

function TUnidadeMedidaCadastroRegra.ValidarEdit(
  const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Integer;
begin
  Result := 0;
  if (Length(Trim(aUnidadeMedidaDTO.descricao)) < 3) then
  begin
    Result := 1;
    exit;
  end;

  if (Length(Trim(aUnidadeMedidaDTO.sigla)) <> 2) then
  begin
    Result := 2;
    exit;
  end;
end;

end.
