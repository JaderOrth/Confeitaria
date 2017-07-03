unit uPedidoListagemController;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs,
  System.UITypes, Data.DB,
  uInterfaceListagemController, uPedido, uPedidoCadastrocontroller, uPedidoDTO,
  uPedidoListagemRegra, uPedidoListagemModel;
type
  TPedidoListagemController = class(TInterfacedObject,
    IInterfaceListagemController)
  private
    oPedidoDTO: TPedidoDTO;
    oPedidoRegra: TPedidoListagemRegra;
    oPedidoModel: TPedidoListagemModel;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure ControlerCadastro(Sender: TObject);
    procedure CreateFormEdit(Sender: TObject; oMemTable: TFDMemTable);
    procedure MontarGrid(oMemtable: TFDMemTable);
    procedure Excluir(oMemtable: TFDMemTable);
    procedure BuscarGrid(aMemTable: TFDMemTable; const APesquisa: String);

    constructor Create;
    destructor Destroy; override;

  end;
var
  oPedidoListagemController: IInterfaceListagemController;

implementation

{ TPedidoListagemController }

procedure TPedidoListagemController.BuscarGrid(aMemTable: TFDMemTable;
  const APesquisa: String);
begin
  aMemTable.Filter := 'total_pedido like ''%'+ APesquisa +'%'''+
                      ' or datahora_entrega like ''%'+ APesquisa +'%'''+
                      ' or descricao like ''%'+ APesquisa +'%'''+
                      ' or entrega_endereco like ''%'+ APesquisa +'%'''+
                      ' or entrega_numero like ''%'+ APesquisa +'%'''+
                      ' or responsavel_pedido like ''%'+ APesquisa +'%''';
  aMemTable.Filtered := true;
end;

procedure TPedidoListagemController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmPedido))) then
    exit;
  frmPedido.Close;
  FreeAndNil(frmPedido);
end;

procedure TPedidoListagemController.ControlerCadastro(Sender: TObject);
begin
  if (not(Assigned(oPedidoCadastroController))) then
    oPedidoCadastroController := TPedidoCadastroController.Create;
  oPedidoCadastroController.CreateFormCadastro(frmPedido, Sender, 0);
end;

constructor TPedidoListagemController.Create;
begin
  oPedidoDTO := TPedidoDTO.Create;
  oPedidoRegra := TPedidoListagemRegra.Create;
  oPedidoModel := TPedidoListagemModel.Create;
end;

procedure TPedidoListagemController.CreateFormEdit(Sender: TObject;
  oMemTable: TFDMemTable);
var
  iID: Integer;
begin
  if (not(Assigned(oPedidoCadastroController))) then
    oPedidoCadastroController := TPedidoCadastroController.Create;

  iID := oMemTable.FieldByName('idpedido').AsInteger;
  oPedidoCadastroController.CreateFormCadastro(frmPedido, Sender, iID);
end;

procedure TPedidoListagemController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmPedido))) then
    frmPedido := TfrmPedido.Create(AOwner);

  frmPedido.oListagemBase := oPedidoListagemController;
  frmPedido.Show;
  frmPedido.OnActivate(nil);
end;

destructor TPedidoListagemController.Destroy;
begin
  if (Assigned(oPedidoDTO)) then
    FreeAndNil(oPedidoDTO);

  if (Assigned(oPedidoRegra)) then
    FreeAndNil(oPedidoRegra);

  if (Assigned(oPedidoModel)) then
    FreeAndNil(oPedidoModel);
  inherited;
end;

procedure TPedidoListagemController.Excluir(oMemtable: TFDMemTable);
begin
//var
//  iId: Integer;
//begin
//  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,
//    [mbYes, mbNo], 0) = mrYes) then
//  begin
//    iId := oMemTable.FieldByName('idbairro').AsInteger;
//    if (oPedidoRegra.Excluir(iId, oPedidoModel)) then
//    begin
//      MessageDlg('Excluido com sucesso!', mtInformation, [mbOK], 0);
//      oMemTable.Locate('idpedido', iId);
//      oMemTable.Delete;
//    end;
//  end;
//
//  if (oMemtable.IsEmpty) then
//  begin
//    frmPedido.btnEditar.Enabled := false;
//    frmPedido.btnExcluir.Enabled := false;
//  end;

end;

procedure TPedidoListagemController.Help(Sender: TObject);
begin

end;

procedure TPedidoListagemController.MontarGrid(oMemtable: TFDMemTable);
begin
  oMemTable.Close;
  if (oPedidoRegra.MontarGrid(oMemTable, oPedidoModel)) then
  begin
    oMemTable.Open;
    frmPedido.bClick := True;
    frmPedido.btnEditar.Enabled := True;
    frmPedido.btnExcluir.Enabled := True;
  end
  else
  begin
    frmPedido.bClick := False;
    frmPedido.btnEditar.Enabled := False;
    frmPedido.btnExcluir.Enabled := False;
  end;
end;

end.
