unit uMunicipioCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uMunicipioDTO, uInterfaceMunicipioModel, uClassConexaoSingleton;

type
  TMunicipioCadastroModel = class(TInterfacedObject, IInterfaceMunicipioModel)
  public
    function BuscarUpdate(AMunicipio: TMunicipioDTO): Boolean;
  end;

implementation

{ TMunicipioCadastroModel }

function TMunicipioCadastroModel.BuscarUpdate(
  AMunicipio: TMunicipioDTO): Boolean;
begin

end;



end.
