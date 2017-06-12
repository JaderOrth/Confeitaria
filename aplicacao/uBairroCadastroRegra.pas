unit uBairroCadastroRegra;

interface

uses
  System.SysUtils,
  uInterfaceBairroCadastroModel, uBairroDTO, uInterfaceListagemModel,
  uEstadoListaHash;

type
  TBairroCadastroRegra = class
  public
    procedure LimparDTO(aBairroDTO: TBairroDTO);
    function ComboBox(var aListaEstado: TEstadoListaHash;
      const aModel: IInterfaceListagemModel): Boolean;
  end;

implementation

{ TBairroCadastroRegra }

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
