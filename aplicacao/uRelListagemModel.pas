unit uRelListagemModel;

interface
uses
  uEstadoDTO, uClassConexaoSingleton, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, FireDAC.DApt;

type
  TRelClientesListagemModel = class
  public
    function MontarGrid(oMemTable: TFDMemTable): Boolean;
  end;

implementation

{ TRelClientesListagemModel }

function TRelClientesListagemModel.MontarGrid(oMemTable: TFDMemTable): Boolean;
begin

end;

end.
