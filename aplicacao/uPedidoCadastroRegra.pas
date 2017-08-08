unit uPedidoCadastroRegra;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
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
    function ValidarCamposItensPedido(const aId: Integer; out aValor: Double;
      const aModel: IInterfacePedidoCadastroModel): Boolean;
    function ValidarSalvar(const aPedidoDTO: TPedidoDTO): Integer;
    function SalvarPedido(const aPedidoDTO: TPedidoDTO; 
      const aModel: IInterfacePedidoCadastroModel): Integer;
    procedure LimparDTO(const aPedido: TPedidoDTO);
    function BuscarUpdate(out aPedidoDTO: TPedidoDTO; const aId: Integer;
      const aModel: IInterfacePedidoCadastroModel): Boolean;
    function BuscarEstadoMunicipio(const aBairo: Integer;
      out aEstado, aMunicipio: Integer;
      const aModel: IInterfacePedidoCadastroModel): Boolean;
    function BuscarItensPedido(const aId: Integer; out aPedido: TPedidoDTO;
      const aModel: IInterfacePedidoCadastroModel): Boolean;
    function BuscarNomeProduto(const aId: Integer; out aNome: String;
      const aModel: IInterfacePedidoCadastroModel): boolean;
    function BuscarCliente(var aProduto: TPedidoDTO; out aMunicipio,
  aEstado: Integer; const aModel: IInterfacePedidoCadastroModel): Boolean;
  end;

implementation

{ TPedidoCadastroRegra }


function TPedidoCadastroRegra.BuscarCliente(var aProduto: TPedidoDTO; out aMunicipio,
  aEstado: Integer; const aModel: IInterfacePedidoCadastroModel): Boolean;
begin
  Result := aModel.BuscarCliente(aProduto, aMunicipio, aEstado);
end;

function TPedidoCadastroRegra.BuscarEstadoMunicipio(const aBairo: Integer;
  out aEstado, aMunicipio: Integer;
  const aModel: IInterfacePedidoCadastroModel): Boolean;
begin
  Result := aModel.BuscarEstadoMunicipio(aBairo, aEstado, aMunicipio);
end;

function TPedidoCadastroRegra.BuscarItensPedido(const aId: Integer;
  out aPedido: TPedidoDTO;
  const aModel: IInterfacePedidoCadastroModel): Boolean;
begin
  Result := aModel.BuscarItensPedido(aId, aPedido);
end;

function TPedidoCadastroRegra.buscarNomeProduto(const aId: Integer; out aNome: String;
  const aModel: IInterfacePedidoCadastroModel): boolean;
begin
  Result := aModel.BuscarNomeProduto(aId, aNome);
end;

function TPedidoCadastroRegra.BuscarUpdate(out aPedidoDTO: TPedidoDTO;
  const aId: Integer; const aModel: IInterfacePedidoCadastroModel): Boolean;
begin
  Result := aModel.BuscarUpdate(aPedidoDTO, aId);
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

function TPedidoCadastroRegra.ComboBoxMunicipio(out aLista: TMunicipioListaHash;
  const aId: Integer; const aModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aLista, aId);
end;

function TPedidoCadastroRegra.ComboBoxProduto(out aLista: TProdutoListaHash;
  const aModel: IInterfaceProdutoListagemModel): Boolean;
begin
  Result := aModel.ComboBoxProduto(aLista);
end;

procedure TPedidoCadastroRegra.LimparDTO(const aPedido: TPedidoDTO);
begin
  aPedido.idPedido := 0;
  aPedido.observacao := EmptyStr;
  aPedido.totalPedido := 0;
  aPedido.idCliente := -1;
  aPedido.entregaEndereco := EmptyStr;
  aPedido.entregaNumero := EmptyStr;
  aPedido.entregaComplemento := EmptyStr;
  aPedido.idBairro := -1;
  aPedido.responsavelPedido := EmptyStr;
  aPedido.idUsuario := 0;
end;

function TPedidoCadastroRegra.SalvarPedido(const aPedidoDTO: TPedidoDTO;
  const aModel: IInterfacePedidoCadastroModel): Integer;
begin
  Result := 0;
  if (aPedidoDTO.idPedido > 0) then
  begin
    if (aModel.DeleteItemPedidoSabores(aPedidoDTO.idPedido)) then
    begin
     if (aModel.DeleteItensPedido(aPedidoDTO.idPedido)) then
     begin
       if (not(aModel.InsertItensPedido(aPedidoDTO))) then
         result := 1;
     end
     else
      Result := 2;
    end
  end
  else
  begin
    aPedidoDTO.idPedido := aModel.BurscarIdPedido;
    if (aModel.InsertPedido(aPedidoDTO)) then
    begin
      if (not(aModel.InsertItensPedido(aPedidoDTO))) then
        result := 1;
    end
    else
      Result := 3;
  end;
end;

function TPedidoCadastroRegra.ValidarCamposItensPedido(const aId: Integer;
  out aValor: Double; const aModel: IInterfacePedidoCadastroModel): Boolean;
var
  sSabor: String;
begin
  Result := False;
  if (aModel.ValidarCamposItensPedido(aId, sSabor, aValor)) then
  begin
    if (sSabor = 'S') then
      Result := True;
  end;

end;

function TPedidoCadastroRegra.ValidarSalvar(const aPedidoDTO
  : TPedidoDTO): Integer;
begin
  Result := 0;
  if (aPedidoDTO.idCliente = -1) then
  begin
    Result := 1;
    exit;
  end;
  if (Length(Trim(aPedidoDTO.responsavelPedido)) = 0) then
  begin
    Result := 2;
    exit;
  end;
  if (aPedidoDTO.idBairro = -1) then
  begin
    Result := 3;
    exit;
  end;
  if (Length(Trim(aPedidoDTO.entregaEndereco)) = 0) then
  begin
    Result := 4;
    exit;
  end;
  if (Length(Trim(aPedidoDTO.entregaNumero)) = 0) then
  begin
    Result := 5;
    exit;
  end;

end;

end.
