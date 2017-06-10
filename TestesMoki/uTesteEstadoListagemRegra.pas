unit uTesteEstadoListagemRegra;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TMyTestEstadoListagemRegra = class(TObject)
  public
    [Test]
    procedure Test1;
  end;

implementation

uses
  Delphi.Mocks,
  uEstadoListagemRegra,
  uInterfaceListagemModel,
  DUnitX.Utils,
  System.SysUtils,
  System.Rtti;

procedure TMyTestEstadoListagemRegra.Test1;
var
  oEstadoListagemRegra: TEstadoListagemRegra;
  oModelMock : TMock<IInterfaceListagemModel>;
  iExclusao: Integer;
  bResultado: Boolean;
begin
  oEstadoListagemRegra:= TEstadoListagemRegra.Create;
  oModelMock := TMock<IInterfaceListagemModel>.Create;

  oModelMock.Setup.WillExecute(
    function (const args : TArray<TValue>; const ReturnType : TRttiType): TValue
    begin
      Result := iExclusao > 0;
    end
  ).When.Excluir(iExclusao);

  iExclusao := 0;
  bResultado := oEstadoListagemRegra.Excluir(iExclusao, oModelMock);
  Assert.IsFalse(bResultado);

  iExclusao := 1;
  bResultado := oEstadoListagemRegra.Excluir(iExclusao, oModelMock);
  Assert.IsTrue(bResultado);
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestEstadoListagemRegra);
end.