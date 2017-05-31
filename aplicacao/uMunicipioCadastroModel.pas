unit uMunicipioCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uMunicipioDTO, uInterfaceMunicipioModel, uMunicipioListaHash,
  uClassConexaoSingleton;

type
  TMunicipioCadastroModel = class(TInterfacedObject, IInterfaceMunicipioModel)
  public
    function BuscarUpdate(AMunicipio: TMunicipioDTO): Boolean;
    function ComboBox(ALista: TMunicipioListaHash): Boolean;
  end;

implementation

{ TMunicipioCadastroModel }

function TMunicipioCadastroModel.BuscarUpdate(
  AMunicipio: TMunicipioDTO): Boolean;
begin

end;

function TMunicipioCadastroModel.ComboBox(ALista: TMunicipioListaHash): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
  finally

  end;

end;

end.
