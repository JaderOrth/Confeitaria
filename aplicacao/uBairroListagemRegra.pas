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
      const AModel: IInterfaceBairroListagemModel): Boolean;
  end;

implementation

{ TBairroListagemRegra }

function TBairroListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := False;
  if (iID > 0) then
    Result := AModel.Excluir(iID);
end;

function TBairroListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
