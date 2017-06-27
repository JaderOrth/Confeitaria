unit uSaborCadastroRegra;

interface

uses
  System.SysUtils,
  uInterfaceSaborCadastroModel, uSaborDTO, uInterfaceListagemModel;

type
  TSaborCadastroRegra = class
  public
    procedure LimparDTO(aSaborDTO: TSaborDTO);
    function SelectUpdate(var aSaborDTO: TSaborDTO;
      const aModel: IInterfaceSaborCadastroModel): Boolean;
    function ValidarEdit(const aSaborDTO: TSaborDTO): Integer;
    function Salvar(const aSaborDTO: TSaborDTO;
      const aModel: IInterfaceSaborCadastroModel): Integer;
  end;

implementation

{ TSaborCadastroRegra }

procedure TSaborCadastroRegra.LimparDTO(aSaborDTO: TSaborDTO);
begin
  aSaborDTO.idsabores := 0;
  aSaborDTO.descricao := emptyStr;
  aSaborDTO.ingredientes := EmptyStr;
end;

function TSaborCadastroRegra.Salvar(const aSaborDTO: TSaborDTO;
  const aModel: IInterfaceSaborCadastroModel): Integer;
begin
  if (aSaborDTO.idsabores > 0) then
  begin
    if (aModel.update(aSaborDTO)) then
    begin
      Result := 1;
      exit;
    end
    else
    begin
      Result := 2;
      exit;
    end;
  end
  else
  begin
    aSaborDTO.idsabores := aModel.BuscarID;
    if (aModel.Insert(aSaborDTO)) then
    begin
      Result := 3;
      exit;
    end
    else
    begin
      Result := 4;
      exit;
    end;
  end;
end;

function TSaborCadastroRegra.SelectUpdate(var aSaborDTO: TSaborDTO;
  const aModel: IInterfaceSaborCadastroModel): Boolean;
begin
  Result := aModel.SelectUpdate(aSaborDTO);
end;

function TSaborCadastroRegra.ValidarEdit(const aSaborDTO: TSaborDTO): Integer;
begin
  Result := 0;
  if (Length(Trim(aSaborDTO.descricao)) < 3) then
  begin
    Result := 1;
    exit;
  end;

  if (Length(Trim(aSaborDTO.ingredientes)) < 3) then
  begin
    Result := 2;
    exit;
  end;
end;

end.
