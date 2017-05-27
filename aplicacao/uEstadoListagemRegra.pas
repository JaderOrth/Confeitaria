unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.DBGrids, System.Classes, Vcl.Dialogs,
  Vcl.Controls, System.UITypes,
  uEstadoDTO, uEstadoListagemModel;
type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      AModel: TEstadoListagemModel): Boolean;
   // procedure configurarGrid(AGrid: TDBGrid);
    function Excluir(const iId: Integer;
      const AModel: TEstadoListagemModel): Boolean;
  end;

implementation

{ TEstadoListagemRegra }

//procedure TEstadoListagemRegra.configurarGrid(AGrid: TDBGrid);
//begin
//    AGrid.Columns[0].Title.Caption := 'ID';
//    AGrid.Columns[0].Title.Alignment := taCenter;
//    AGrid.Columns[0].Width := 40;
//
//    AGrid.Columns[1].Title.Caption := 'Estado';
//    AGrid.Columns[1].Title.Alignment := taCenter;
//    AGrid.Columns[1].Width := 200;
//
//    AGrid.Columns[2].Title.Caption := 'Sigla';
//    AGrid.Columns[2].Title.Alignment := taCenter;
//    AGrid.Columns[2].Width := 40;
//end;

function TEstadoListagemRegra.Excluir(const iId: Integer;
  const AModel: TEstadoListagemModel): Boolean;
begin
   if (MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
    [mbYes,mbNo], 0)= mrYes) then
    AModel.Excluir(iId);
  Result := True;
end;

function TEstadoListagemRegra.MontarGrid(oMemTable: TFDMeMTable;
  AModel: TEstadoListagemModel): Boolean;
begin
  AModel.MontarGrid(oMemTable);
  Result := true;
end;

end.
