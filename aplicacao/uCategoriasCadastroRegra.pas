unit uCategoriasCadastroRegra;

interface

uses
  System.SysUtils,
  uInterfaceCategoriaCadastroModel, uCategoriasDTO, uInterfaceListagemModel;

type
  TCategoriaCadastroRegra = class
  public
    procedure LimparDTO(aCategoriaDTO: TCategoriasDTO);
    function SelectUpdate(var aCategoriaDTO: TCategoriasDTO;
      const aModel: IInterfaceCategoriaCadastroModel): Boolean;
    function ValidarEdit(const aCategoriaDTO: TCategoriasDTO): Integer;
    function Salvar(const aCategoriaDTO: TCategoriasDTO;
      const aModel: IInterfaceCategoriaCadastroModel): Integer;
  end;

implementation

{ TCategoriaCadastroRegra }

procedure TCategoriaCadastroRegra.LimparDTO(aCategoriaDTO: TCategoriasDTO);
begin
  aCategoriaDTO.idcategoria := 0;
  aCategoriaDTO.descricao := emptyStr;
end;

function TCategoriaCadastroRegra.Salvar(const aCategoriaDTO: TCategoriasDTO;
  const aModel: IInterfaceCategoriaCadastroModel): Integer;
begin
  if (aCategoriaDTO.idcategoria > 0) then
  begin
    if (aModel.update(aCategoriaDTO)) then
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
    aCategoriaDTO.idcategoria := aModel.BuscarID;
    if (aModel.Insert(aCategoriaDTO)) then
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

function TCategoriaCadastroRegra.SelectUpdate(var aCategoriaDTO: TCategoriasDTO;
  const aModel: IInterfaceCategoriaCadastroModel): Boolean;
begin
  Result := aModel.SelectUpdate(aCategoriaDTO);
end;

function TCategoriaCadastroRegra.ValidarEdit(
  const aCategoriaDTO: TCategoriasDTO): Integer;
begin
  if (Length(Trim(aCategoriaDTO.descricao)) < 3) then
  begin
    Result := 1;
    exit;
  end;
end;

end.
