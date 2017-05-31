unit uMunicipioListagemRegra;

interface

uses
  Vcl.Controls, System.UITypes, Vcl.DBGrids, Data.DB,
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
  uMunicipioListagemModel;

type
  TMunicipioListagemRegra = class
  public
    function MontarGrid(AMemtable: TFDMemTable;
      AModel: TMunicipioListagemModel): Boolean;
    function Excluir(iId: Integer; AModel: TMunicipioListagemModel): Boolean;
    procedure ConfigGrid(AGrid: TDBGrid);
  end;

implementation

{ TMunicipioListagemRegra }

procedure TMunicipioListagemRegra.ConfigGrid(AGrid: TDBGrid);
begin
  AGrid.Columns[0].Title.Caption := 'ID';
  AGrid.Columns[0].Title.Alignment := taCenter;
  AGrid.Columns[0].Width := 50;
end;

function TMunicipioListagemRegra.Excluir(iId: Integer;
  AModel: TMunicipioListagemModel): Boolean;
begin
  Result := AModel.Excluir(iId);
end;

function TMunicipioListagemRegra.MontarGrid(AMemtable: TFDMemTable;
  AModel: TMunicipioListagemModel): Boolean;
begin
  Result := False;
  AModel.MontarGrid(AMemtable);
end;

end.
