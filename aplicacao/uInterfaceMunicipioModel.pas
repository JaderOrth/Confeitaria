unit uInterfaceMunicipioModel;

interface

uses
  uMunicipioDTO;

type
  IInterfaceMunicipioModel = interface
    function BuscarUpdate(AMunicipio: TMunicipioDTO): Boolean;
  end;

implementation

end.
