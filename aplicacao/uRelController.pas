unit uRelController;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections,
  uInterfaceRel, uRel, uEstadoListaHash, uEstadoDTO, uEstadoListagemModel;

type
  TRelController = class(TInterfacedObject,IInterfaceRel)
  public
    procedure CreateFormListagem(AOwner: TComponent);
    procedure CloseForm(Sender: TObject);
    procedure ComboBoxCliente(Sender: TObject);
    procedure ComboBoxEstado(Sender: TObject);
    procedure ComboBoxMunicipio(Sender: TObject);
    procedure ComboBoxProduto(Sender: TObject);
  end;

var 
  oRelController : IInterfaceRel;

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
begin

end;

procedure TRelController.ComboBoxEstado(Sender: TObject);
var
  oListaEstado: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoModel: TEstadoListagemModel;   
  iId: Integer;
begin
  frmRel.cbEstado.Items.Clear;
  try
    oListaEstado := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoModel := TEstadoListagemModel.Create;
    if (oEstadoModel.ComboBox(oListaEstado)) then
    begin
      for oEstadoDTO in oListaEstado.Values do
        frmRel.cbEstado.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;

    if (iId <> -1) then
    begin
      frmRel.cbEstado.ItemIndex := frmRel.cbEstado.Items.IndexOfObject(TObject(iId));
    end;

  finally
    if (Assigned(oListaEstado)) then
      FreeAndNil(oListaEstado);

    if (Assigned(oEstadoModel)) then
      FreeAndNil(oEstadoModel);
  end;
end;

procedure TRelController.ComboBoxMunicipio(Sender: TObject);
begin

end;

procedure TRelController.ComboBoxProduto(Sender: TObject);
begin

end;

procedure TRelController.CreateFormListagem(AOwner: TComponent);
begin
  if (not(Assigned(frmRel))) then
    frmRel := TfrmRel.Create(AOwner);

  frmRel.oBase := oRelController;
  frmRel.Show;  
end;

end.
