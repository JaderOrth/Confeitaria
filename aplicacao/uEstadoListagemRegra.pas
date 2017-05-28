unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.DBGrids, System.Classes,
  Vcl.Dialogs,
  Vcl.Controls, System.UITypes,
  uEstadoDTO, uEstadoListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      out AModel: TEstadoListagemModel): Boolean;
    procedure ConfigGrid(AGrid: TDBGrid);
    function Excluir(iId: Integer; AModel: TEstadoListagemModel): Boolean;
    function BuscarGrid(aMemTable: TFDMeMTable; AModel: TEstadoListagemModel;
      var aPesquisa: String): Boolean;
  end;

implementation

{ TEstadoListagemRegra }

function TEstadoListagemRegra.BuscarGrid(aMemTable: TFDMeMTable;
  AModel: TEstadoListagemModel; var aPesquisa: String): Boolean;
begin
  Result := AModel.BuscarGrid(aMemTable, aPesquisa);
end;

procedure TEstadoListagemRegra.ConfigGrid(AGrid: TDBGrid);
begin
  AGrid.Columns[0].Title.Caption := 'ID';
  AGrid.Columns[0].Title.Alignment := taCenter;
  AGrid.Columns[0].Width := 50;

  AGrid.Columns[1].Title.Caption := 'Estado';
  AGrid.Columns[1].Title.Alignment := taCenter;
  AGrid.Columns[1].Width := 230;

  AGrid.Columns[2].Title.Caption := 'Sigla';
  AGrid.Columns[2].Title.Alignment := taCenter;
  AGrid.Columns[2].Width := 50;
end;

function TEstadoListagemRegra.Excluir(iId: Integer;
  AModel: TEstadoListagemModel): Boolean;
begin
  Result := False;
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    if (AModel.Excluir(iId)) then
    begin
      MessageDlg('Registro excluido com sucesso!', mtInformation, [mbYes], 0);
      Result := True;
    end
    else
      raise Exception.Create('Erro ao excluir o registro!');
  end;
end;

function TEstadoListagemRegra.MontarGrid(oMemTable: TFDMeMTable;
  out AModel: TEstadoListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(oMemTable);
end;

end.
