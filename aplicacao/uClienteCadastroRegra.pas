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
      const aModel: IInterfaceMunicipioListagemModel): Boolean;
    function ComboBoxBairro(var aListaBairro: TBairroListaHash;
      const aID: Integer; const aModel: IInterfaceBairroListagemModel): Boolean;

  end;

implementation

{ TClienteCadastroRegra }


{ TClienteCadastroRegra }

function TClienteCadastroRegra.ComboBomMunicipio(
  var aListaMunicipio: TMunicipioListaHash; const aID: Integer;
  const aModel: IInterfaceMunicipioListagemModel): Boolean;
begin
  Result := aModel.ComboBox(aListaMunicipio, aID);
end;

function TClienteCadastroRegra.ComboBox(var ALista: TEstadoListaHash;
  const AModel: IInterfaceListagemModel): Boolean;
begin
  Result := AModel.ComboBox(ALista);
end;

function TClienteCadastroRegra.ComboBoxBairro(
  var aListaBairro: TBairroListaHash; const aID: Integer;
  const aModel: IInterfaceBairroListagemModel): Boolean;
begin
  Result := aModel.ComboBoxBairro(aListaBairro, aID);
end;

end.
