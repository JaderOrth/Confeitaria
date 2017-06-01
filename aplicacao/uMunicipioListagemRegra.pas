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
    procedure ConfigGrid(AGrid: TDBGrid);
  end;

implementation

{ TMunicipioListagemRegra }

procedure TMunicipioListagemRegra.ConfigGrid(AGrid: TDBGrid);
begin
  //idMunicipio
  AGrid.Columns[0].Title.Caption := 'ID';
  AGrid.Columns[0].Title.Alignment := taCenter;
  AGrid.Columns[0].Width := 50;
  //descrição do municipio
  AGrid.Columns[1].Title.Caption := 'Município';
  AGrid.Columns[1].Title.Alignment := taCenter;
  AGrid.Columns[1].Width := 350;
  //estado
  AGrid.Columns[2].Title.Caption := 'Estado';
  AGrid.Columns[2].Title.Alignment := taCenter;
  AGrid.Columns[2].Width := 250;
end;

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
