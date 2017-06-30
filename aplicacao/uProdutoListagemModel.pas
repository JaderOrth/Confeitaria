unit uProdutoListagemModel;

interface


uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceProdutoListagemModel, uProdutoDTO, uClassConexaoSingleton;

type
  TBairroListagemModel = class(TInterfacedObject, IInterfaceProdutoListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function Excluir(const iID: Integer): Boolean;
  end;

implementation

{ TBairroListagemModel }

function TBairroListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM produto WHERE idproduto = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TBairroListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
var
  oquery: TFDQuery;
begin
  Result := False;
  try
    oquery := TFDQuery.Create(nil);
    oquery.Connection := TConexaoSingleton.GetInstancia;
    oquery.Open('SELECT pro.idprodutos, pro.descricao, pro.preco,'+
                ' cat.descricao as tipo FROM produtos as pro'+
                ' INNER JOIN categorias as cat'+
                ' on cat.idcategorias = pro.idcategorias');
    AMemTable.Data := oquery.Data;
    if (not(oquery.IsEmpty)) then
      Result := true;
  finally
    if (Assigned(oquery)) then
      FreeAndNil(oquery);
  end;
end;

end.
