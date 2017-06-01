unit uMunicipioCadastroRegra;

interface

uses
  System.classes, System.SysUtils, Vcl.StdCtrls,
  uInterfaceMunicipioModel, uMunicipioDTO, uMunicipioListaHash;

type
  TMunicipioCadastroRegra = class
  public
    function BuscarUpdate(var AMunicipio: TMunicipioDTO;
      const AModel: IInterfaceMunicipioModel): Boolean;
    function ComboBox(var ALista: TMunicipioListaHash;
      const AModel: IInterfaceMunicipioModel): Boolean;
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

function TMunicipioCadastroRegra.ComboBox(var ALista: TMunicipioListaHash;
  const AModel: IInterfaceMunicipioModel): Boolean;
begin

end;

end.
