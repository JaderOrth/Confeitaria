unit uCategoriasListagemRegra;

interface

uses
  FireDAC.Comp.Client,
  uInterfaceCategoriaListagemModel, uCategoriasDTO;

type
  TCategoriasListagemRegra = class
  public
    function MontarGrid(AMemTable: TFDMemTable;
      const AModel: IInterfaceCategoriasListagemModel): Boolean;
    function Excluir(const iID: Integer;
      const AModel: IInterfaceCategoriasListagemModel): Boolean;
  end;

implementation

{ TCategoriasListagemRegra }

function TCategoriasListagemRegra.Excluir(const iID: Integer;
  const AModel: IInterfaceCategoriasListagemModel): Boolean;
begin
  Result := False;
  if (iID > 0) then
    Result := AModel.Excluir(iID);
end;

function TCategoriasListagemRegra.MontarGrid(AMemTable: TFDMemTable;
  const AModel: IInterfaceCategoriasListagemModel): Boolean;
begin
  Result := AModel.MontarGrid(AMemTable);
end;

end.
