unit uProdutoListagemModel;

interface


uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceProdutoListagemModel,uProdutoDTO;

type
  TBairroListagemModel = class(TInterfacedObject, IInterfaceProdutoListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TBairroListagemModel }

function TBairroListagemModel.Excluir(const iID: Integer): Boolean;
begin

end;

function TBairroListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
begin

end;

end.
