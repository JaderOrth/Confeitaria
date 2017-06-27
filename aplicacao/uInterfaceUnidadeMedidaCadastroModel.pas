unit uInterfaceUnidadeMedidaCadastroModel;

interface

uses
  uUnidadeMedidaDTO;

type
  IInterfaceUnidadeMedidaCadastroModel = interface
    function SelectUpdate(var aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
    function update(const aUnidadeMedidaDTO: TUnidadeMedidaDTO): Boolean;
  end;

implementation

end.
