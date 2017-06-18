unit uClienteCadastroRegra;

interface

uses
  System.classes, System.SysUtils, Vcl.StdCtrls,
  uInterfaceClienteCadastroModel, uClienteDTO, uEstadoListaHash,
  uInterfaceListagemModel, uInterfaceMunicipioListagemModel,
  uMunicipioListaHash, uInterfaceBairroListagemModel, uBairroListaHash;

type
  TClienteCadastroRegra = class
  public
    function ComboBox(var ALista: TEstadoListaHash;
      const AModel: IInterfaceListagemModel): Boolean;
    function ComboBomMunicipio(var aListaMunicipio: TMunicipioListaHash;
      const aID: Integer;
      const AModel: IInterfaceMunicipioListagemModel): Boolean;
    function ComboBoxBairro(var aListaBairro: TBairroListaHash;
      const aID: Integer; const AModel: IInterfaceBairroListagemModel): Boolean;
    procedure LimparDTO(const aClienteDTO: TClienteDTO);
    function Validar(const aClienteDTO: TClienteDTO): Integer;
    function Salvar(const aClienteDTO: TClienteDTO;
      const AModel: IInterfaceClienteCadastroModel): Integer;
    function BuscarUpdate(var aClienteDTO: TClienteDTO;
      out aIdMunicipio: Integer; out aIdEstado: Integer;
      const AModel: IInterfaceClienteCadastroModel): Boolean;
  end;

implementation

{ TClienteCadastroRegra }

{ TClienteCadastroRegra }

function TClienteCadastroRegra.BuscarUpdate(var aClienteDTO: TClienteDTO;
  out aIdMunicipio, aIdEstado: Integer;
  const AModel: IInterfaceClienteCadastroModel): Boolean;
begin
  Result := AModel.BuscarUpdate(aClienteDTO, aIdMunicipio, aIdEstado);
end;

function TClienteCadastroRegra.ComboBomMunicipio(var aListaMunicipio
  : TMunicipioListaHash; const aID: Integer;
  const AModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := AModel.ComboBox(aListaMunicipio, aID);
end;

function TClienteCadastroRegra.ComboBox(var ALista: TEstadoListaHash;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.ComboBox(ALista);
end;

function TClienteCadastroRegra.ComboBoxBairro(var aListaBairro
  : TBairroListaHash; const aID: Integer;
  const AModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := AModel.ComboBoxBairro(aListaBairro, aID);
end;

procedure TClienteCadastroRegra.LimparDTO(const aClienteDTO: TClienteDTO);
begin
  aClienteDTO.IdCliente := 0;
  aClienteDTO.Endereco := EmptyStr;
  aClienteDTO.Nome := EmptyStr;
  aClienteDTO.Numero := EmptyStr;
  aClienteDTO.Complemento := EmptyStr;
  aClienteDTO.Observacao := EmptyStr;
  aClienteDTO.CPF_CNPJ := 0;
  aClienteDTO.Telefone := 0;
  aClienteDTO.Celular := 0;
  aClienteDTO.IdBairro := -1;
end;

function TClienteCadastroRegra.Salvar(const aClienteDTO: TClienteDTO;
  const AModel: IInterfaceClienteCadastroModel): Integer;
begin
  if (aClienteDTO.IdCliente > 0) then
  begin
    if (AModel.Update(aClienteDTO)) then
      Result := 1
    else
      Result := 2;
  end
  else
  begin
    aClienteDTO.IdCliente := AModel.BuscarId;
    if (AModel.Insert(aClienteDTO)) then
      Result := 3
    else
      Result := 4;
  end;
end;

function TClienteCadastroRegra.Validar(const aClienteDTO: TClienteDTO): Integer;
begin
  Result := 0;
  if (Trim(aClienteDTO.Endereco).IsEmpty) then
  begin
    Result := 1;
    exit;
  end;

  if (aClienteDTO.Nome.IsEmpty) then
  begin
    Result := 2;
    exit;
  end;

  if (Trim(aClienteDTO.Numero).IsEmpty) then
  begin
    Result := 3;
    exit;
  end;

  if (Trim(aClienteDTO.Observacao).IsEmpty) then
  begin
    Result := 4;
    exit;
  end;

  if (Length(CurrToStr(aClienteDTO.Telefone)) < 6) AND
    (Length(CurrToStr(aClienteDTO.Celular)) < 6) then
  begin
    Result := 5;
    exit;
  end;

  if (aClienteDTO.IdBairro = -1) then
  begin
    Result := 6;
    exit;
  end;
end;

end.
