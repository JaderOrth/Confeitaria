unit uMunicipioListagemRegra;

interface

uses
  Vcl.Controls, System.UITypes, Vcl.DBGrids, Data.DB,
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
  uInterfaceMunicipioListagemModel;

type
  TMunicipioListagemRegra = class
  public
    function MontarGrid(AMemtable: TFDMemTable;
      const AModel: IInterfaceMunicipioListagemModel): Boolean;
    function Excluir(const iId: Integer;
      const AModel: IInterfaceMunicipioListagemModel): Integer;
  end;

implementation

{ TMunicipioListagemRegra }

function TMunicipioListagemRegra.Excluir(const iId: Integer;
  const AModel: IInterfaceMunicipioListagemModel): Integer;
begin
  if (not(AModel.ValidarExcluir(iId))) then
  begin
    if (AModel.Excluir(iId)) then
      Result := 1
    else
      Result := 2;
  end
  else
    Result := 3;


end;

function TMunicipioListagemRegra.MontarGrid(AMemtable: TFDMemTable;
  const AModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemtable);
end;

end.
