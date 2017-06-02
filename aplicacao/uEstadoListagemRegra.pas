unit uEstadoListagemRegra;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.DBGrids, System.Classes,
  Vcl.Dialogs,
  Vcl.Controls, System.UITypes,
  uEstadoDTO, uInterfaceListagemModel;

type
  TEstadoListagemRegra = class
  public
    function MontarGrid(oMemTable: TFDMeMTable;
      const AModel: IInterfaceListagemModel): Boolean;
    function Excluir(const iId: Integer; const AModel: IInterfaceListagemModel): Boolean;
    function BuscarGrid(aMemTable: TFDMeMTable; const AModel: IInterfaceListagemModel;
      const aPesquisa: String): Boolean;
  end;

implementation

{ TEstadoListagemRegra }

function TEstadoListagemRegra.BuscarGrid(aMemTable: TFDMeMTable;
  const AModel: IInterfaceListagemModel; const aPesquisa: String): Boolean;
begin
  Result := AModel.BuscarGrid(aMemTable, aPesquisa);
end;


function TEstadoListagemRegra.Excluir(const iId: Integer;
  const AModel: IInterfaceListagemModel): Boolean;
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
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(oMemTable);
end;

end.
