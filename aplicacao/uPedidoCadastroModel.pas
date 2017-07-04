unit uPedidoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfacePedidoCadastroModel, uClassConexaoSingleton, uPedidoDTO;

type
  TPedidoCadastroModel = class(TInterfacedObject, IInterfacePedidoCadastroModel)
  public
    function ValidarCamposItensPedido(const aId: Integer;
      out sSabor: String; out aValor: Double): Boolean;
    function BurscarIdPedido: Integer;
    function InsertPedido(const aPedidoDTO: TPedidoDTO): Boolean;
    //function InsertItensPedido(const aPedido: TPedidoDTO): Boolean;
    //function InsertSabores(const aPedido: TPedidoDTO): Boolean;
  end;

implementation

{ TPedidoCadastroModel }

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
          DateToStr(aPedidoDTO.dataPedido)+', '+
          DateToStr(aPedidoDTO.dataEntrega)+', '+
          TimeToStr(aPedidoDTO.horaEntrega)+', '+
          QuotedStr(aPedidoDTO.observacao)+', '+
          CurrToStr(aPedidoDTO.totalPedido)+', '+
          IntToStr(aPedidoDTO.idCliente)+', '+
          QuotedStr(aPedidoDTO.entregaEndereco)+', '+
          QuotedStr(aPedidoDTO.entregaNumero)+', '+
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
