unit uInterfaceClienteCadastroModel;

interface

uses
  uClienteDTO;

type
  IInterfaceClienteCadastroModel = interface
    function BuscarId: Integer;
    function Insert(const aClienteDTO: TClienteDTO): Boolean;
    function Update(const aClienteDTO: TClienteDTO): Boolean;
    function BuscarUpdate(var aClienteDTO: TClienteDTO;
      out aIdMunicipio: Integer; out aIdEstado: Integer): Boolean;
  end;

implementation

end.
