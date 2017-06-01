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
    function ComboBox(AComboBox: TComboBox): Boolean;
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

function TMunicipioCadastroRegra.ComboBox(AComboBox: TComboBox): Boolean;
begin

end;

end.
