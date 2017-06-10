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
      const AModel: IInterfaceMunicipioListagemModel): Boolean;
  end;

implementation

{ TMunicipioListagemRegra }

function TMunicipioListagemRegra.Excluir(const iId: Integer;
  const AModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := AModel.Excluir(iId);
end;

function TMunicipioListagemRegra.MontarGrid(AMemtable: TFDMemTable;
  const AModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemtable);
end;

end.
