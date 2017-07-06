unit uRelModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uClassConexaoSingleton;

type
  TRelModel = class
  public
    function SelectUpdate(const AidCliente, AidEstado, AidMunicipio, AidProduto:Integer; Amemtable:TFDMemTable):Boolean;
  end;

implementation

{ TRelModel }

function TRelModel.SelectUpdate(const AidCliente, AidEstado, AidMunicipio,
  AidProduto: Integer; Amemtable: TFDMemTable): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT pe.idpedido, pe.data_pedido, pe.total_pedido, '+
                'ip.quantidade, ip.valor_total as valor_total_itens, pr.descricao as produto, pr.preco, ca.descricao as categoria, '+
                'um.sigla, cl.nome, cl.cpf_cnpj, cl.telefone, cl.celular, '+
                'mu.descricao as municipio, uf.descricao as estado '+
                'FROM pedido AS pe '+
                'left JOIN cliente AS cl ON pe.idcliente = cl.idcliente '+
                'left JOIN itens_pedido AS ip ON pe.idpedido = ip.pedido_idpedido '+
                'left JOIN produtos AS pr ON ip.idprodutos = pr.idprodutos '+
                'left JOIN categorias AS ca ON pr.idcategorias = ca.idcategorias '+
                'left JOIN unidade_medida AS um ON pr.idunidade_medida = um.idunidade_medida '+
                'left JOIN bairro AS br ON pe.idbairro = br.idbairro '+
                'left JOIN municipio AS mu ON br.idmunicipio = mu.idmunicipio '+
                'left JOIN uf ON mu.iduf = uf.iduf '+
                'WHERE pe.idpedido > 0');

    //oQuery.SQL.Add('');

    Amemtable.Data := oQuery.Data;
    if (not(oQuery.IsEmpty)) then
      Result := True;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

end.
