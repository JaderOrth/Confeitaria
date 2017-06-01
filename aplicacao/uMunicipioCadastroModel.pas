unit uMunicipioCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uMunicipioDTO, uInterfaceMunicipioModel, uClassConexaoSingleton;

type
  TMunicipioCadastroModel = class(TInterfacedObject, IInterfaceMunicipioModel)
  public
    function BuscarUpdate(var AMunicipio: TMunicipioDTO): Boolean;
  end;

implementation

{ TMunicipioCadastroModel }

function TMunicipioCadastroModel.BuscarUpdate(
  var AMunicipio: TMunicipioDTO): Boolean;
begin

end;



end.
