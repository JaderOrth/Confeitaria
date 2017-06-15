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
  end;
implementation

{ TClienteListagemRegra }

function TClienteListagemRegra.MontarGrid(aMenTable: TFDMemTable;
  const aModel: IInterfaceClienteModel): Boolean;
begin
  Result := aModel.MontarGrid(aMenTable);
end;

end.
