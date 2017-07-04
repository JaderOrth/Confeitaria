unit uPedidoCadastroRegra;

interface

uses
  uInterfacePedidoCadastroModel, uProdutoListaHash, uPedidoDTO,
  uInterfaceProdutoListagemModel, uInterfaceListagemModel, uEstadoListaHash,
  uMunicipioListaHash, uInterfaceMunicipioListagemModel, uBairroListaHash,
  uInterfaceBairroListagemModel, uInterfaceClienteModel, uClienteListaHash,
  uInterfaceSaborListagemModel, uSaborListaHash;

type
  TPedidoCadastroRegra = class
  public
    function ComboBoxProduto(out aLista: TProdutoListaHash;
      const aModel: IInterfaceProdutoListagemModel): Boolean;
    function ComboBoxEstado(out aLista: TEstadoListaHash;
      const aModel: IInterfaceListagemModel): Boolean;
    function ComboBoxMunicipio(out aLista: TMunicipioListaHash;
      const aId: Integer;
      const aModel: IInterfaceMunicipioListagemModel): Boolean;
    function ComboBoxBairro(out aLista: TBairroListaHash; const aId: Integer;
      const aModel: IInterfaceBairroListagemModel): Boolean;
    function ComboBoxCliente(out aLista: TClienteListaHash;
      const aModel: IInterfaceClienteModel): Boolean;
    function CheckSabor(var aLista: TSaborListaHash;
      const aModel: IInterfaceSaborListagemModel): Boolean;
    function ValidarCamposItensPedido(const aId: Integer;
      const aModel: IInterfacePedidoCadastroModel): Boolean;
    function ValidarSalvar(const aPedidoDTO: TPedidoDTO): Integer;
  end;

implementation

{ TPedidoCadastroRegra }

function TPedidoCadastroRegra.ComboBoxMunicipio(out aLista: TMunicipioListaHash;
  const aId: Integer; const aModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aLista, aId);
end;

function TPedidoCadastroRegra.CheckSabor(var aLista: TSaborListaHash;
  const aModel: IInterfaceSaborListagemModel): Boolean;
begin
  Result := aModel.CheckSabor(aLista);
end;

function TPedidoCadastroRegra.ComboBoxBairro(out aLista: TBairroListaHash;
  const aId: Integer; const aModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := aModel.ComboBoxBairro(aLista, aId);
end;

function TPedidoCadastroRegra.ComboBoxCliente(out aLista: TClienteListaHash;
  const aModel: IInterfaceClienteModel): Boolean;
begin
  Result := aModel.ComboBoxCliente(aLista);
end;

function TPedidoCadastroRegra.ComboBoxEstado(out aLista: TEstadoListaHash;
  const aModel: IInterfaceListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aLista);
end;

function TPedidoCadastroRegra.ComboBoxProduto(out aLista: TProdutoListaHash;
  const aModel: IInterfaceProdutoListagemModel): Boolean;
begin
  Result := aModel.ComboBoxProduto(aLista);
end;

function TPedidoCadastroRegra.ValidarCamposItensPedido(const aId: Integer;
  const aModel: IInterfacePedidoCadastroModel): Boolean;
var
  sSabor: String;
begin
  Result := False;
  if (aModel.ValidarCamposItensPedido(aId, sSabor)) then
  begin
    if (sSabor = 'S') then
      Result := True;
  end;

end;

function TPedidoCadastroRegra.ValidarSalvar(const aPedidoDTO
  : TPedidoDTO): Integer;
begin
  Result := 0;
  
end;

end.
