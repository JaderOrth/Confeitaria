unit uPedidoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfacePedidoCadastroModel, uClassConexaoSingleton, uPedidoDTO,
  uIntensPedidoDTO;

type
  TPedidoCadastroModel = class(TInterfacedObject, IInterfacePedidoCadastroModel)
  public
    function ValidarCamposItensPedido(const aId: Integer;
      out sSabor: String; out aValor: Double): Boolean;
    function BurscarIdPedido: Integer;
    function InsertPedido(const aPedidoDTO: TPedidoDTO): Boolean;
    function InsertItensPedido(const aPedido: TPedidoDTO): Boolean;
    function DeleteItensPedido(const aId: Integer): Boolean;
    function BuscarUpdate(out aPedidoDTO: TPedidoDTO; const aId: Integer): Boolean;
    function BuscarEstadoMunicipio(const aBairo: Integer;
      out aEstado, aMunicipio: Integer): Boolean;
    function BuscarItensPedido(const aId: Integer;
      out aPedidoDTO: TPedidoDTO): Boolean;
    function BuscarNomeEstado(const aID: Integer; out aNome: String): Boolean;
  end;

implementation

{ TPedidoCadastroModel }

function TPedidoCadastroModel.BurscarIdPedido: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idpedido) as id FROM pedido');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('id').AsInteger + 1;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TPedidoCadastroModel.BuscarEstadoMunicipio(const aBairo: Integer;
  out aEstado, aMunicipio: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT  mu.idmunicipio as idmunicipio, uf.iduf as iduf from bairro as ba'+
                ' INNER JOIN municipio mu ON mu.idmunicipio = ba.idmunicipio'+
                ' INNER JOIN uf ON uf.iduf = mu.iduf'+
                ' WHERE ba.idbairro ='+ IntToStr(aBairo));
    if (not(oQuery.IsEmpty)) then
    begin
      aEstado := oQuery.FieldByName('iduf').AsInteger;
      aMunicipio := oQuery.FieldByName('idmunicipio').AsInteger;
      Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

function TPedidoCadastroModel.BuscarItensPedido(const aId: Integer;
  out aPedidoDTO: TPedidoDTO): Boolean;
var
  oQuery: TFDQuery;
  oItens: TItensPedidoDTO;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT idprodutos, quantidade, observacao, valor_total'+
                ' FROM itens_pedido WHERE pedido_idpedido = '+ IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oItens := TItensPedidoDTO.Create;
        oItens.idProduto := oQuery.FieldByName('idprodutos').AsInteger;
        oItens.quantidade := oQuery.FieldByName('quantidade').AsFloat;
        oItens.valorTotal := oQuery.FieldByName('valor_total').AsFloat;
        oItens.observacao := oQuery.FieldByName('observacao').AsString;
        aPedidoDTO.ItensPedido.Add(oItens.valorTotal, oItens);
      end;
      Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

function TPedidoCadastroModel.BuscarNomeEstado(const aID: Integer;
  out aNome: String): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT p.descricao as nome FROM itens_pedido as ip'+
                ' inner join produtos as p on p.idprodutos = ip.idprodutos'+
                ' WHERE p.idprodutos = '+ IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      aNome := oQuery.FieldByName('nome').AsString;
      Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

function TPedidoCadastroModel.BuscarUpdate(out aPedidoDTO: TPedidoDTO;
  const aId: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT data_pedido, data_entrega, hora_entrega, observacao,'+
                ' total_pedido, idcliente, entrega_endereco,'+
                ' entrega_numero, entrega_complemento, idbairro,'+
                ' responsavel_pedido FROM pedido WHERE idpedido = '+
               IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      aPedidoDTO.dataPedido := oQuery.FieldByName('data_pedido').AsDateTime;
      aPedidoDTO.dataEntrega := oQuery.FieldByName('data_entrega').AsDateTime;
      aPedidoDTO.horaEntrega := oQuery.FieldByName('hora_entrega').AsDateTime;
      aPedidoDTO.observacao := oQuery.FieldByName('observacao').AsString;
      aPedidoDTO.totalPedido := oQuery.FieldByName('total_pedido').AsFloat;
      aPedidoDTO.idCliente := oQuery.FieldByName('idcliente').AsInteger;
      aPedidoDTO.entregaEndereco := oQuery.FieldByName('entrega_endereco').AsString;
      aPedidoDTO.entregaNumero := oQuery.FieldByName('entrega_numero').AsString;
      aPedidoDTO.entregaComplemento := oQuery.FieldByName('entrega_complemento').AsString;
      aPedidoDTO.idBairro := oQuery.FieldByName('idbairro').AsInteger;
      aPedidoDTO.responsavelPedido := oQuery.FieldByName('responsavel_pedido').AsString;
      Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

function TPedidoCadastroModel.DeleteItensPedido(const aId: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DELETE FROM itens_pedido where pedido_idpedido= '+ IntToStr(aId);
   Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TPedidoCadastroModel.InsertItensPedido(
  const aPedido: TPedidoDTO): Boolean;
var
  sSql: String;
  aItensDTO: TItensPedidoDTO;
begin
  Result := False;
  aItensDTO := TItensPedidoDTO.Create;
  try
     for aItensDTO in aPedido.ItensPedido.Values do
  begin
    sSql := 'INSERT INTO itens_pedido(pedido_idpedido, idprodutos, quantidade, '+
          'observacao, valor_total) VALUES('+
          IntToStr(aPedido.idPedido)+', '+
          IntToStr(aItensDTO.idProduto)+', '+
          FloatToStr(aItensDTO.quantidade)+', '+
          QuotedStr(aItensDTO.observacao)+', '+
          FloatToStr(aItensDTO.valorTotal)+')';
    Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
  end;
  finally
    if (Assigned(aItensDTO)) then
      FreeAndNil(aItensDTO);
  end;
end;

function TPedidoCadastroModel.InsertPedido(
  const aPedidoDTO: TPedidoDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO pedido(idpedido, data_pedido, data_entrega,'+
          ' hora_entrega, observacao, total_pedido, idcliente,'+
          ' entrega_endereco, entrega_numero, entrega_complemento,'+
          ' idbairro, responsavel_pedido, idusuario) VALUES('+
          IntToStr(aPedidoDTO.idPedido)+', '+
          QuotedStr(FormatDateTime('yyyy/mm/dd', aPedidoDTO.dataPedido))+', '+
          QuotedStr(FormatDateTime('yyyy/mm/dd', aPedidoDTO.dataEntrega))+', '+
          QuotedStr(FormatDateTime('HH:MM:SS', aPedidoDTO.horaEntrega)) +', '+
          QuotedStr(aPedidoDTO.observacao)+', '+
          CurrToStr(aPedidoDTO.totalPedido)+', '+
          IntToStr(aPedidoDTO.idCliente)+', '+
          QuotedStr(aPedidoDTO.entregaEndereco)+', '+
          QuotedStr(aPedidoDTO.entregaNumero)+', '+
          QuotedStr(aPedidoDTO.entregaComplemento)+', '+
          IntToStr(aPedidoDTO.idBairro)+', '+
          QuotedStr(aPedidoDTO.responsavelPedido)+', '+
          IntToStr(aPedidoDTO.idUsuario)+')';

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TPedidoCadastroModel.ValidarCamposItensPedido
  (const aId: Integer; out sSabor: String; out aValor: Double): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT sabor, preco FROM produtos WHERE idprodutos = '+ IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
      sSabor := oQuery.FieldByName('sabor').AsString;
      aValor := oQuery.FieldByName('preco').AsFloat;
      Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

end.
