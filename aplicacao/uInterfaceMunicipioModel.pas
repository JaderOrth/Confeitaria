unit uInterfaceMunicipioModel;

interface

uses
  uMunicipioDTO;

type
  IInterfaceMunicipioModel = interface
    function BuscarUpdate(var AMunicipio: TMunicipioDTO): Boolean;
    function Insert(const AMunicipio: TMunicipioDTO): Boolean;
    function Update(const AMunicipio: TMunicipioDTO): Boolean;

  end;

implementation

end.
