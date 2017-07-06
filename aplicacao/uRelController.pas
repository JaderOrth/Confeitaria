unit uRelController;

interface

uses
   System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Controls, FireDAC.Comp.Client,
  uInterfaceRel, uRel, uEstadoListaHash, uEstadoDTO, uEstadoListagemModel,
  uclienteDTO, uClienteListaHash, uClienteListagemModel, uMunicipioDTO,
  uMunicipioListaHash, uMunicipioListagemModel, uProdutoDTO, uProdutoListaHash,
  uProdutoListagemModel, uRelModel;

type
  TRelController = class(TInterfacedObject, IInterfaceRel)
  private
    oModel : TRelModel;
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure MontarGrid(Sender: TObject);
    procedure ComboBoxCliente(Sender: TObject);
    procedure ComboBoxEstado(Sender: TObject);
    procedure ComboBoxMunicipio(Sender: TObject);
    procedure ComboBoxProduto(Sender: TObject);

    constructor Create;
    destructor Destroy; override;

  end;

var
  oRelController: IInterfaceRel;

implementation

{ TRelController }

procedure TRelController.CloseForm(Sender: TObject);
begin
  if (not(Assigned(frmRel))) then
    exit;
  frmRel.Close;
  FreeAndNil(frmRel);
end;

procedure TRelController.ComboBoxCliente(Sender: TObject);
var
  oClienteDTO: TClienteDTO;
  oListacliente: TClienteListaHash;
  oClienteListagem: TClienteListagemModel;
  iId: Integer;
begin
  try
    if (frmRel.cbCliente.ItemIndex <> -1) then
    begin
      iId := Integer(frmRel.cbCliente.Items.Objects
        [frmRel.cbCliente.ItemIndex]);
    end
    else
      iId := -1;

    frmRel.cbCliente.Items.Clear;
    oClienteListagem := TClienteListagemModel.Create;
    oListacliente := TClienteListaHash.Create([doOwnsValues]);

    if oClienteListagem.ComboBoxCliente(oListacliente) then
    begin
      for oClienteDTO in oListacliente.Values do
        frmRel.cbCliente.Items.AddObject(oClienteDTO.Nome,
          TObject(oClienteDTO.IdCliente));
    end;

    if (iId <> -1) then
      frmRel.cbCliente.ItemIndex := frmRel.cbCliente.Items.IndexOfObject
        (TObject(iId));

  finally
    if (Assigned(oListacliente)) then
      FreeAndNil(oListacliente);

    if (Assigned(oClienteListagem)) then
      FreeAndNil(oClienteListagem);
  end;
end;

procedure TRelController.ComboBoxEstado(Sender: TObject);
var
  oListaEstado: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoModel: TEstadoListagemModel;
begin
  frmRel.cbEstado.Items.Clear;
  try
    oListaEstado := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoModel := TEstadoListagemModel.Create;
    if (oEstadoModel.ComboBox(oListaEstado)) then
    begin
      for oEstadoDTO in oListaEstado.Values do
        frmRel.cbEstado.Items.AddObject(oEstadoDTO.Descricao,
          TObject(oEstadoDTO.ID));
    end;
  finally
    if (Assigned(oListaEstado)) then
      FreeAndNil(oListaEstado);

    if (Assigned(oEstadoModel)) then
      FreeAndNil(oEstadoModel);
  end;
end;

procedure TRelController.ComboBoxMunicipio(Sender: TObject);
var
  oMunicipioLista: TMunicipioListaHash;
  oMunicipioModel: TMunicipioListagemModel;
  oMunicipioDTO: TMunicipioDTO;
  iId: Integer;
begin
  if (frmRel.cbEstado.ItemIndex <> -1) then
  begin
    frmRel.cbMunicipio.Items.Clear;
    frmRel.cbMunicipio.Clear;
    // id do estado para poder fazer o select
    iId := Integer(frmRel.cbEstado.Items.Objects[frmRel.cbEstado.ItemIndex]);
    try
      oMunicipioLista := TMunicipioListaHash.Create([doOwnsValues]);
      oMunicipioModel := TMunicipioListagemModel.Create;

      if (oMunicipioModel.ComboBox(oMunicipioLista, iId))
      then
      begin
        for oMunicipioDTO in oMunicipioLista.Values do
        begin
          frmRel.cbMunicipio.Items.AddObject(oMunicipioDTO.Descricao,
            TObject(oMunicipioDTO.IdMunicipio));
        end
      end
    finally
      if (Assigned(oMunicipioModel)) then
        FreeAndNil(oMunicipioModel);

      if (Assigned(oMunicipioLista)) then
        FreeAndNil(oMunicipioLista);
    end;
  end
  else
    MessageDlg('Selecione um ESTADO primeiro!', mtWarning, [mbOK], 0);
end;

procedure TRelController.ComboBoxProduto(Sender: TObject);
var
  oProdutoDTO: TProdutoDTO;
  oProdutoModel: TProdutoListagemModel;
  oProdutoLista: TProdutoListaHash;
begin
  frmRel.cbProduto.Items.Clear;
  try
    oProdutoLista := TProdutoListaHash.Create([doOwnsValues]);
    oProdutoModel := TProdutoListagemModel.Create;

    if oProdutoModel.ComboBoxProduto(oProdutoLista) then
    begin
      for oProdutoDTO in oProdutoLista.Values do
      begin
        frmRel.cbProduto.Items.AddObject(oProdutoDTO.descricao,
          TObject(oProdutoDTO.idProduto));
      end;
    end;
  finally
    if (Assigned(oProdutoLista)) then
      FreeAndNil(oProdutoLista);

    if (Assigned(oProdutoModel)) then
      FreeAndNil(oProdutoModel);
  end;
end;

constructor TRelController.Create;
begin
  oModel := TRelModel.Create;
end;

procedure TRelController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmRel))) then
    frmRel := TfrmRel.Create(AOwner);

  frmRel.oBase := oRelController;
  frmRel.Show;
end;

destructor TRelController.Destroy;
begin
  if Assigned(oModel) then
  FreeAndNil(oModel);
  inherited;
end;

procedure TRelController.MontarGrid(Sender: TObject);
var
  iIdEstado: Integer;
begin
  if (frmRel.cbEstado.ItemIndex <> -1) then
  begin
    iIdEstado := Integer(frmRel.cbEstado.Items.Objects
      [frmRel.cbEstado.ItemIndex]);
  end
  else
  begin
    iIdEstado := -1;
  end;
  oModel.SelectUpdate(-1,-1,-1,-1, frmRel.FDMemTable_listagem, '','' );
  {AidCliente, AidEstado, AidMunicipio,
  AidProduto: Integer; Amemtable: TFDMemTable; AdataInicio,
  AdataFim: String
  }
end;

end.
