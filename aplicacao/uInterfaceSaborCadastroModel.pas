unit uInterfaceSaborCadastroModel;

interface

uses
  uSaborDTO;

type
  IInterfaceSaborCadastroModel = interface
    function SelectUpdate(var aSaborDTO: TSaborDTO): Boolean;
    function BuscarID: Integer;
    function Insert(const aSaborDTO: TSaborDTO): Boolean;
    function update(const aSaborDTO: TSaborDTO): Boolean;
  end;

implementation

end.
