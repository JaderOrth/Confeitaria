unit uInterfaceBairroCadastroModel;

interface

uses
  uBairroDTO;

type
  IInterfaceBairroCadastroModel = interface
    function SelectUpdate(var aBairroDTO: TBairroDTO;
      var aID: Integer): Boolean;
    function BuscarID: Integer;
    function Insert(const aBairroDTO: TBairroDTO): Boolean;
    function update(const aBairroDTO: TBairroDTO): Boolean;
  end;

implementation

end.
