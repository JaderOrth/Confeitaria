unit uClienteListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uClienteDTO, uInterfaceClienteModel;

type
  TClienteListagemRegra = class
  public
    function MontarGrid(aMenTable: TFDMemTable;
      const aModel: IInterfaceClienteModel): Boolean;
    function Excluir(const aId: Integer;
      const aModel: IInterfaceClienteModel): Integer;
  end;

implementation

{ TClienteListagemRegra }

function TClienteListagemRegra.Excluir(const aId: Integer;
  const aModel: IInterfaceClienteModel): Integer;
begin
  Result := 0;
  if (aId > 0) then
  begin
    if (not(aModel.ValidarExcluir(aId))) then
    begin
      if (aModel.Excluir(aId)) then
        Result := 1
      else
        Result := 2;
    end
    else
      Result := 3;
  end;
end;

function TClienteListagemRegra.MontarGrid(aMenTable: TFDMemTable;
  const aModel: IInterfaceClienteModel): Boolean;
begin
  Result := aModel.MontarGrid(aMenTable);
end;

end.
