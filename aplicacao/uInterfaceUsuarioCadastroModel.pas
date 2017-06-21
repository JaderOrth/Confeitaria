unit uInterfaceUsuarioCadastroModel;

interface

uses
  uUsuarioDTO;

type
  IInterfaceUsuarioCadastroModel = interface
    function Insert(const aUsuarioDTO: TUsuarioDTO): boolean;
    function Update(const aUsuarioDTO: TUsuarioDTO): boolean;
    function BuscarID: Integer;
    function BuscarUpdate(var aUsuarioDTO: TUsuarioDTO): boolean;
  end;

implementation

end.
