unit uMunicipioListagemRegra;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
  uMunicipioListagemModel;

type
  TMunicipioListagemRegra = class
  public
    function MontarGrid(AMemtable: TFDMemTable;
      AModel: TMunicipioListagemModel): Boolean;
  end;

implementation

{ TMunicipioListagemRegra }

function TMunicipioListagemRegra.MontarGrid(AMemtable: TFDMemTable;
  AModel: TMunicipioListagemModel): Boolean;
begin
  Result := False;
  AModel.MontarGrid(AMemtable);
end;

end.
