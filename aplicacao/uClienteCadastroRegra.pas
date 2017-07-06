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
    function ValidarCPF(var aCpf: String): Boolean;
    function ValidarCNPJ(var aCnpj: String): Boolean;
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
  Result := 0;
  if (aClienteDTO.IdCliente > 0) then
  begin
    if (not(AModel.Update(aClienteDTO))) then
      Result := 1;
  end
  else
  begin
    aClienteDTO.IdCliente := AModel.BuscarId;
    if (not(AModel.Insert(aClienteDTO))) then
      Result := 2;
  end;
end;

function TClienteCadastroRegra.Validar(const aClienteDTO: TClienteDTO): Integer;
begin
  Result := 0;
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

  if (Trim(aClienteDTO.Endereco).IsEmpty) then
  begin
    Result := 1;
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

function TClienteCadastroRegra.ValidarCNPJ(var aCnpj: String): Boolean;
var
  iContador1, iContador2, iSoma, iDigito: Integer;
  iMultiplicacao, iPosicao: Integer;
  sCNPJ, sCNPJValidado: string;

begin

  sCNPJ := '00000000000000' + Trim(aCnpj);
  sCNPJ := copy(sCNPJ, Length(sCNPJ) - 13, 14);
  if (sCNPJ = '00000000000000') or (sCNPJ = '11111111111111') or
    (sCNPJ = '22222222222222') or (sCNPJ = '33333333333333') or
    (sCNPJ = '44444444444444') or (sCNPJ = '55555555555555') or
    (sCNPJ = '66666666666666') or (sCNPJ = '77777777777777') or
    (sCNPJ = '88888888888888') or (sCNPJ = '99999999999999') then
  begin
    Result := False;
    exit;
  end;
  sCNPJValidado := copy(sCNPJ, 1, 12);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 6 - iContador1;
    iPosicao := 1;
    for iContador2 := 1 to (12 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCNPJ, iPosicao, 1)) * iMultiplicacao);
      begin
        if (iContador2 = 4 + iContador1) then
          iMultiplicacao := 2
        else
          iMultiplicacao := iMultiplicacao + 1;
      end;
      Inc(iPosicao);

    end;
    iDigito := iSoma mod 11;
    begin
      if iDigito < 2 then
        iDigito := 0
    end;
    sCNPJValidado := sCNPJValidado + IntToStr(iDigito);
  end;
  if (sCNPJ = sCNPJValidado) then
    Result := True
  else
    Result := False;
end;

function TClienteCadastroRegra.ValidarCPF(var aCpf: String): Boolean;
var
  iContador1, iContador2, iSoma, iMultiplicacao: Integer;
  iDigito: Integer;
  sCPF, sCPFValidado: String;
begin
  sCPF := '00000000000' + Trim(aCpf);
  sCPF := copy(sCPF, Length(sCPF) - 10, 11);
  if (sCPF = '00000000000') or (sCPF = '11111111111') or (sCPF = '22222222222')
    or (sCPF = '33333333333') or (sCPF = '44444444444') or
    (sCPF = '55555555555') or (sCPF = '66666666666') or (sCPF = '77777777777')
    or (sCPF = '88888888888') or (sCPF = '99999999999') then
  begin
    Result := False;
    exit;
  end;
  sCPFValidado := copy(sCPF, 1, 9);

  for iContador1 := 0 to 1 do
  begin
    iSoma := 0;
    iMultiplicacao := 10 + iContador1;
    for iContador2 := 1 to (9 + iContador1) do
    begin
      iSoma := iSoma + (StrToInt(copy(sCPF, iContador2, 1)) * iMultiplicacao);
      iMultiplicacao := iMultiplicacao - 1;
    end;
    iDigito := iSoma mod 11;
    if iDigito < 2 then
      iDigito := 0
    else
      iDigito := 11 - iDigito;
    sCPFValidado := sCPFValidado + IntToStr(iDigito);
  end;
  if (sCPF = sCPFValidado) then
    Result := True
  else
    Result := False;
end;

end.
