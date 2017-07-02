unit uBairroCadastroRegra;

interface

uses
  System.SysUtils,
  uInterfaceBairroCadastroModel, uBairroDTO, uInterfaceListagemModel,
  uEstadoListaHash, uMunicipioListaHash, uInterfaceMunicipioListagemModel;

type
  TBairroCadastroRegra = class
  public
    procedure LimparDTO(aBairroDTO: TBairroDTO);
    function ComboBox(var aListaEstado: TEstadoListaHash;
      const aModel: IInterfaceListagemModel): Boolean;
    function ComboBomMunicipio(var aListaMunicipio: TMunicipioListaHash;
      const aID: Integer;
      const aModel: IInterfaceMunicipioListagemModel): Boolean;
    function SelectUpdate(var aBairroDTO: TBairroDTO; var aID: Integer;
      const aModel: IInterfaceBairroCadastroModel): Boolean;
    function ValidarEdit(const aBairroDTO: TBairroDTO): Integer;
    function Salvar(const aBairroDTO: TBairroDTO;
      const aModel: IInterfaceBairroCadastroModel): Integer;
  end;

implementation

{ TBairroCadastroRegra }

function TBairroCadastroRegra.ComboBomMunicipio(var aListaMunicipio
  : TMunicipioListaHash; const aID: Integer;
  const aModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aListaMunicipio, aID);
end;

function TBairroCadastroRegra.ComboBox(var aListaEstado: TEstadoListaHash;
  const aModel: IInterfaceListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aListaEstado);
end;

procedure TBairroCadastroRegra.LimparDTO(aBairroDTO: TBairroDTO);
begin
  aBairroDTO.idBairro := 0;
  aBairroDTO.Descricao := emptyStr;
  aBairroDTO.idMunicipio := -1;
end;

function TBairroCadastroRegra.Salvar(const aBairroDTO: TBairroDTO;
  const aModel: IInterfaceBairroCadastroModel): Integer;
begin
  if (aBairroDTO.idBairro > 0) then
  begin
    if (not(aModel.update(aBairroDTO))) then
      Result := 1;
  end
  else
  begin
    aBairroDTO.idBairro := aModel.BuscarID;
    if (not(aModel.Insert(aBairroDTO))) then
      Result := 2;
  end;
end;

function TBairroCadastroRegra.SelectUpdate(var aBairroDTO: TBairroDTO;
  var aID: Integer; const aModel: IInterfaceBairroCadastroModel): Boolean;
begin
  Result := aModel.SelectUpdate(aBairroDTO, aID);
end;

function TBairroCadastroRegra.ValidarEdit(
  const aBairroDTO: TBairroDTO): Integer;
begin
  Result := 0;
  if (Length(Trim(aBairroDTO.Descricao)) < 3) then
  begin
    Result := 1;
    exit;
  end;

  if (aBairroDTO.idMunicipio = -1) then
  begin
    Result := 2;
    exit;
  end;
end;

end.
