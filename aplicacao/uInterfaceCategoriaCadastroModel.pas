unit uInterfaceCategoriaCadastroModel;

interface

uses
  uCategoriasDTO;

type
  IInterfaceCategoriaCadastroModel = interface
    function SelectUpdate(var aCategoriaDTO: TCategoriasDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aCategoriaDTO: TCategoriasDTO): Boolean;
    function update(const aCategoriaDTO: TCategoriasDTO): Boolean;
  end;

implementation

end.
