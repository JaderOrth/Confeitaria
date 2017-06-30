unit uInterfaceCadastroModel;

interface

uses
  uEstadoDTO;

type
  IIntrefaceCadastroModel = interface
    function BuscarUpdate(var aEstado: TEstadoDTO): Boolean;
    function Salvar(const aEstado: TEstadoDTO):Boolean;
    function Update(const aEstado: TEstadoDTO): Boolean;
    function ValidarUF(var aEstado: TEstadoDTO): Boolean;
    function BuscarID:Integer;
  end;
implementation

end.
