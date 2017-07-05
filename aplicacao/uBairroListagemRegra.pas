unit uBairroListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uInterfaceBairroListagemModel, uBairroDTO;

type
  TBairroListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceBairroListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceBairroListagemModel): integer;
  end;

implementation

{ TBairroListagemRegra }

function TBairroListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceBairroListagemModel): integer;
begin
  Result := 0;
  if (iID > 0) then
  begin
    if (not(AModel.ValidarExcluir(iID))) then
    begin
      if (aModel.Excluir(iID)) then
        Result := 1
      else
        Result := 2;
    end
    else
      Result := 3;
  end;
end;

function TBairroListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
