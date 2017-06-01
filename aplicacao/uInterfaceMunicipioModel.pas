unit uInterfaceMunicipioModel;

interface

uses
  uMunicipioDTO;

type
  IInterfaceMunicipioModel = interface
    function BuscarUpdate(var AMunicipio: TMunicipioDTO): Boolean;
  end;

implementation

end.
