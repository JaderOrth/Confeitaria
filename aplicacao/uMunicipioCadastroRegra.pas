unit uMunicipioCadastroRegra;

interface

uses
  System.classes, System.SysUtils, Vcl.StdCtrls,
  uInterfaceMunicipioModel, uMunicipioDTO, uEstadoListaHash,
  uInterfaceListagemModel;

type
  TMunicipioCadastroRegra = class
  public
    function ComboBox(var ALista: TEstadoListaHash;
      const AModel: IInterfaceListagemModel): Boolean;
    function BuscarUpdate(var AMunicipio: TMunicipioDTO;
      const AModel: IInterfaceMunicipioModel): Boolean;
    function Salvar(var AMunicipio: TMunicipioDTO;
      const AModel: IInterfaceMunicipioModel): Integer;
    function ValidarMunicipio(const AMunicipio: TMunicipioDTO): Integer;
  end;

implementation

{ TMunicipioCadastroRegra }

function TMunicipioCadastroRegra.BuscarUpdate(var AMunicipio: TMunicipioDTO;
  const AModel: IInterfaceMunicipioModel): Boolean;
begin
  Result := False;
  if (AMunicipio.IdMunicipio > 0) then
    Result := AModel.BuscarUpdate(AMunicipio);
end;

function TMunicipioCadastroRegra.ComboBox(var ALista: TEstadoListaHash;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.ComboBox(ALista);
end;

function TMunicipioCadastroRegra.Salvar(var AMunicipio: TMunicipioDTO;
  const AModel: IInterfaceMunicipioModel): Integer;
begin
  if (AMunicipio.IdMunicipio > 0) then
  begin
    if (AModel.Update(AMunicipio)) then
      Result := 1
    else
      Result := 2;
  end
  else
  begin
    AMunicipio.IdMunicipio := AModel.BuscarID;
    if (AMunicipio.IdMunicipio > 0) then
    begin
      if (AModel.Insert(AMunicipio)) then
        Result := 3
      else
        Result := 4;
    end;
  end;
end;

function TMunicipioCadastroRegra.ValidarMunicipio(
  const AMunicipio: TMunicipioDTO): Integer;
begin
  if (Trim(AMunicipio.Descricao).IsEmpty) then
  begin
    Result := 1;
    exit;
  end;

  if (AMunicipio.IdEstado = -1) then
  begin
    Result := 2;
    exit;
  end;

end;

end.
