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
      const  iID: Integer; const aModel: IInterfaceMunicipioListagemModel): Boolean;
  end;

implementation

{ TBairroCadastroRegra }

function TBairroCadastroRegra.ComboBomMunicipio(
  var aListaMunicipio: TMunicipioListaHash; const  iID: Integer;
  const aModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aListaMunicipio, iID);
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

end.
