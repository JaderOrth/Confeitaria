unit uProdutoListagemModel;

interface


uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceProdutoListagemModel, uProdutoDTO, uClassConexaoSingleton,
  uProdutoListaHash;

type
  TProdutoListagemModel = class(TInterfacedObject, IInterfaceProdutoListagemModel)
  public
    function MontarGrid(AMemTable: TFDMemTable): Boolean;
    function ValdiarExcluir(const aID: Integer): Boolean;
    function Excluir(const iID: Integer): Boolean;
    function ComboBoxProduto(out aLista: TProdutoListaHash): Boolean;
  end;

implementation

{ TBairroListagemModel }

function TProdutoListagemModel.ComboBoxProduto(
  out aLista: TProdutoListaHash): Boolean;
var
  oQuery: TFDQuery;
  oProdutoDTO: TProdutoDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idprodutos, descricao FROM produtos');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oProdutoDTO :=  TProdutoDTO.Create;
        oProdutoDTO.idProduto := oQuery.FieldByName('idprodutos').AsInteger;
        oProdutoDTO.descricao := oQuery.FieldByName('descricao').AsString;
        aLista.Add(oProdutoDTO.descricao, oProdutoDTO);
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TProdutoListagemModel.Excluir(const iID: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM produto WHERE idprodutos = '+ IntToStr(iID);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TProdutoListagemModel.MontarGrid(AMemTable: TFDMemTable): Boolean;
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

function TProdutoListagemModel.ValdiarExcluir(const aID: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT ipe.iditens_pedido FROM  itens_pedido as ipe'+
                ' INNER JOIN produtos as pro'+
                ' ON pro.idprodutos  = ipe.idprodutos'+
                ' WHERE pro.idprodutos = '+ IntToStr(aID)+' limit 2');
    if (oQuery.IsEmpty) then
    begin
      oQuery.Open('SELECT sp.idprodutos FROM produtos as pr'+
                  ' INNER JOIN sabores_produto as sp'+
                  ' ON sp.idprodutos = pr.idprodutos'+
                  ' WHERE pr.idprodutos =  '+ IntToStr(aID)+' limit 2');
      if (not(oQuery.IsEmpty)) then
        Result := true;
    end
    else
      Result := True;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
