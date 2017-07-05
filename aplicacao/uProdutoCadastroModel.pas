unit uProdutoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceProdutoCadastroModel, uProdutoDTO, uClassConexaoSingleton;

type
  TProdutoCadastroModel = class(TInterfacedObject,
    IInterfaceProdutoCadastroModel)
  public
    function BuscarID: Integer;
    function Update(const aProdutoDTO: TProdutoDTO): Boolean;
    function Insert(const aProdutoDTO: TProdutoDTO): Boolean;
    function BuscarUpdate(var aProdutoDTO: TProdutoDTO): Boolean;
    function SalvarCheck(const aCheck: array of Integer;
      const aIdProduto: Integer): Boolean;
    function RetornarIdSAbor(var aSabor: TArray<Integer>;
      const aId: Integer): Boolean;
    function ExcluiCheck(const aId: Integer): Boolean;
  end;

implementation

{ TProdutoCadastroModel }

function TProdutoCadastroModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idprodutos) as id FROM produtos');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TProdutoCadastroModel.BuscarUpdate(var aProdutoDTO
  : TProdutoDTO): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT descricao, preco, sabor, idunidade_medida,' +
      'idcategorias FROM produtos where idprodutos = ' +
      IntToStr(aProdutoDTO.idProduto));
    if (not(oQuery.IsEmpty)) then
    begin
      aProdutoDTO.descricao := oQuery.FieldByName('descricao').AsString;
      aProdutoDTO.preco := oQuery.FieldByName('preco').AsCurrency;
      aProdutoDTO.sabor := oQuery.FieldByName('sabor').AsString;
      aProdutoDTO.idCategoria := oQuery.FieldByName('idcategorias').AsInteger;
      aProdutoDTO.unidadeMedida := oQuery.FieldByName('idunidade_medida')
        .AsInteger;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TProdutoCadastroModel.ExcluiCheck(const aId: Integer): Boolean;
begin
  Result := TConexaoSingleton.GetInstancia.ExecSQL
    ('DELETE FROM sabores_produto WHERE idprodutos = ' + IntToStr(aId)) > 0;
end;

function TProdutoCadastroModel.Insert(const aProdutoDTO: TProdutoDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO produtos(idprodutos, descricao, preco, sabor,' +
    ' idcategorias, idunidade_medida) VALUES(' + IntToStr(aProdutoDTO.idProduto)
    + ', ' + QuotedStr(aProdutoDTO.descricao) + ', ' +
    StringReplace(CurrToStr(aProdutoDTO.preco), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ' +
     QuotedStr(aProdutoDTO.sabor) + ', ' +
    IntToStr(aProdutoDTO.idCategoria) + ', ' +
    IntToStr(aProdutoDTO.unidadeMedida) + ')';

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TProdutoCadastroModel.RetornarIdSAbor(var aSabor: TArray<Integer>;
  const aId: Integer): Boolean;
var
  oQuery: TFDQuery;
  icont: Integer;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idsabores FROM sabores_produto' + ' WHERE idprodutos = '
      + IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      SetLength(aSabor, 0);
      while (not(oQuery.Eof)) do
      begin
        icont := Length(aSabor);
        SetLength(aSabor, icont + 1);
        aSabor[icont] := oQuery.FieldByName('idsabores').AsInteger;
        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;

end;

function TProdutoCadastroModel.SalvarCheck(const aCheck: array of Integer;
  const aIdProduto: Integer): Boolean;
var
  sSql: String;
  iCount: Integer;
begin
  Result := False;
  for iCount := 0 to (Length(aCheck) - 1) do
  begin
    sSql := 'INSERT INTO sabores_produto(idprodutos, idsabores) VALUES(' +
      IntToStr(aIdProduto) + ',' + IntToStr(aCheck[iCount]) + ')';
    Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
  end;
end;

function TProdutoCadastroModel.Update(const aProdutoDTO: TProdutoDTO): Boolean;
var
  sSql: String;
  sValor: String;
begin

  sSql := 'UPDATE produtos SET descricao = ' + QuotedStr(aProdutoDTO.descricao)
    + ', preco = ' + CurrToStr(aProdutoDTO.preco) + ', sabor = ' +
    QuotedStr(aProdutoDTO.sabor) + ', idcategorias = ' +
    IntToStr(aProdutoDTO.idCategoria) + ', idunidade_medida = ' +
    IntToStr(aProdutoDTO.unidadeMedida) + ' WHERE idprodutos = ' +
    IntToStr(aProdutoDTO.idProduto);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
