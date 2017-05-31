unit uMunicipioCadastroRegra;

interface

uses
  System.classes, System.SysUtils, Vcl.StdCtrls,
  uMunicipioCadastroModel, uMunicipioDTO, uMunicipioListaHash;

type
  TMunicipioCadastroRegra = class
  public
    function BuscarUpdate(AMunicipio: TMunicipioDTO;
      AModel: TMunicipioCadastroModel): Boolean;
    function ComboBox(AComboBox: TComboBox): Boolean;
  end;

implementation

{ TMunicipioCadastroRegra }

function TMunicipioCadastroRegra.BuscarUpdate(AMunicipio: TMunicipioDTO;
  AModel: TMunicipioCadastroModel): Boolean;
begin
  Result := False;
  if (AMunicipio.IdMunicipio > 0) then
    Result := AModel.BuscarUpdate(AMunicipio);
end;

function TMunicipioCadastroRegra.ComboBox(AComboBox: TComboBox): Boolean;
begin

end;

end.
