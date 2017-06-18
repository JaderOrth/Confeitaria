unit uClienteCadastroModel;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  uInterfaceClienteCadastroModel, uClienteDTO, uClassConexaoSingleton;

type
  TClienteCadastroModel = class(TInterfacedObject,
    IInterfaceClienteCadastroModel)
  public
    function BuscarId: Integer;
    function Insert(const aClienteDTO: TClienteDTO): Boolean;
    function Update(const aClienteDTO: TClienteDTO): Boolean;
    function BuscarUpdate(var aClienteDTO: TClienteDTO;
      out aIdMunicipio: Integer; out aIdEstado: Integer): Boolean;
  end;

implementation

{ TClienteCadastroModel }

function TClienteCadastroModel.BuscarId: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT MAX(idcliente) as id FROM cliente');
    if (not(oQuery.IsEmpty)) then
    begin
      Result := oQuery.FieldByName('id').AsInteger + 1;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TClienteCadastroModel.BuscarUpdate(var aClienteDTO: TClienteDTO;
  out aIdMunicipio, aIdEstado: Integer): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  try
    oQuery := TFDQuery.Create(nil);
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('SELECT cli.nome, cli.endereco, cli.numero, cli.complemento,'+
                ' cli.observacao,cli.cpf_cnpj, cli.telefone, cli.celular,'+
                ' cli.idbairro, mu.idmunicipio, uf.iduf'+
                ' FROM cliente as cli'+
                ' INNER JOIN bairro as ba'+
                ' ON ba.idbairro = cli.idbairro'+
                ' INNER JOIN municipio  mu'+
                ' ON mu.idmunicipio = ba.idmunicipio'+
                ' INNER JOIN uf'+
                ' ON uf.iduf = mu.iduf'+
                ' WHERE cli.idcliente ='+ IntToStr(aClienteDTO.IdCliente));
    if (not(oQuery.IsEmpty)) then
    begin
      aClienteDTO.Endereco := oQuery.FieldByName('endereco').AsString;
      aClienteDTO.Nome := oQuery.FieldByName('nome').AsString;
      aClienteDTO.Numero := oQuery.FieldByName('numero').AsString;
      aClienteDTO.Complemento := oQuery.FieldByName('complemento').AsString;
      aClienteDTO.Observacao := oQuery.FieldByName('observacao').AsString;
      aClienteDTO.CPF_CNPJ := oQuery.FieldByName('cpf_cnpj').AsCurrency;
      aClienteDTO.Telefone := oQuery.FieldByName('telefone').AsCurrency;
      aClienteDTO.Celular := oQuery.FieldByName('celular').AsCurrency;
      aClienteDTO.IdBairro := oQuery.FieldByName('idbairro').AsInteger;
      aIdMunicipio := oQuery.FieldByName('idmunicipio').AsInteger;
      aIdEstado := oQuery.FieldByName('iduf').AsInteger;
      Result := true;
    end;
  finally
    if (Assigned(oQuery)) then
      FreeAndNil(oQuery);
  end;
end;

function TClienteCadastroModel.Insert(const aClienteDTO: TClienteDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'INSERT INTO cliente(idcliente, nome, endereco, numero,'+
          ' complemento, observacao, cpf_cnpj, telefone, celular, idbairro)'+
          ' VALUES(' + IntToStr(aClienteDTO.IdCliente)
                +', '+ QuotedStr(aClienteDTO.Nome)
                +', '+ QuotedStr(aClienteDTO.Endereco)
                +', '+ QuotedStr(aClienteDTO.Numero)
                +', '+ QuotedStr(aClienteDTO.Complemento)
                +', '+ QuotedStr(aClienteDTO.Observacao)
                +', '+ CurrToStr(aClienteDTO.CPF_CNPJ)
                +', '+ CurrToStr(aClienteDTO.Telefone)
                +', '+ CurrToStr(aClienteDTO.Celular)
                +', '+ IntToStr(aClienteDTO.IdBairro)
                +') ';
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TClienteCadastroModel.Update(const aClienteDTO: TClienteDTO): Boolean;
var
  sSql: String;
begin
  sSql := 'UPDATE cliente SET'
          +' nome = '+ QuotedStr(aClienteDTO.Nome)
          +', endereco = '+ QuotedStr(aClienteDTO.Endereco)
          +', numero = '+ QuotedStr(aClienteDTO.Numero)
          +', complemento = '+ QuotedStr(aClienteDTO.Complemento)
          +', observacao = '+ QuotedStr(aClienteDTO.Observacao)
          +', cpf_cnpj = '+ CurrToStr(aClienteDTO.CPF_CNPJ)
          +', telefone = '+ CurrToStr(aClienteDTO.Telefone)
          +', celular = '+ CurrToStr(aClienteDTO.Celular)
          +', idbairro ='+ IntToStr(aClienteDTO.IdBairro)
          +' WHERE idcliente = '+ IntToStr(aClienteDTO.IdCliente);
  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
