unit uPedidoCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfacePedidoCadastroModel, uClassConexaoSingleton;

type
  TPedidoCadastroModel = class(TInterfacedObject, IInterfacePedidoCadastroModel)
  public
    function ValidarCamposItensPedido(const aId: Integer;
      out sSabor: String): Boolean;

  end;

implementation

{ TPedidoCadastroModel }

{ TPedidoCadastroModel }

function TPedidoCadastroModel.ValidarCamposItensPedido
  (const aId: Integer; out sSabor: String): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT sabor FROM produtos WHERE idprodutos = '+ IntToStr(aId));
    if (not(oQuery.IsEmpty)) then
    begin
     sSabor := oQuery.FieldByName('sabor').AsString;
     Result := True;
    end;
  finally
    if (assigned(oQuery)) then
      FreeandNil(oQuery);
  end;
end;

end.
