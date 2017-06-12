unit uBairroCadastroController;

interface

uses
  System.Classes, System.SysUtils, Vcl.StdCtrls, System.UITypes, Vcl.Dialogs,
  System.Generics.Collections,
  uInterfaceCadastroController, uBairroCadastro, uBairroCadastroRegra,
  uBairroCadastroModel, uBairroDTO, uEstadoListaHash, uEstadoDTO,
  uEstadoListagemModel;

type
  TBairroCadastroController = class(TInterfacedObject,
    IInterfaceCadastroController)
  private
    oBairroModel: TBairroCadastroModel;
    oBairroRegra: TBairroCadastroRegra;
    oBairroDTO: TBairroDTO;
  public
    procedure CreateFormCadastro(AOwner: TComponent; Sender: TObject;
      const iId: Integer);
    procedure CloseFormCadastro(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Pesquisar(Sender: TObject);
    procedure ComboBox(Sender: TObject);

    constructor Create;
    destructor Destroy; override;
  end;

var
  oBairroCadastroController: IInterfaceCadastroController;

implementation

{ TBairroCadastroController }

procedure TBairroCadastroController.CloseFormCadastro(Sender: TObject);
begin
  if (not(Assigned(frmBairroCadastro))) then
    exit;
  frmBairroCadastro.Close;
  FreeAndNil(frmBairroCadastro);
  oBairroRegra.LimparDTO(oBairroDTO);
end;

procedure TBairroCadastroController.ComboBox(Sender: TObject);
begin
  if frmBairroCadastro.cbEstado.ItemIndex <> -1 then
  begin

  end
  else
    raise Exception.Create('Selecione um ESTADO primeiro!');
end;

constructor TBairroCadastroController.Create;
begin
  oBairroDTO := TBairroDTO.Create;
  oBairroModel := TBairroCadastroModel.Create;
  oBairroRegra := TBairroCadastroRegra.Create;
end;

procedure TBairroCadastroController.CreateFormCadastro(AOwner: TComponent;
  Sender: TObject; const iId: Integer);
begin
  if (not(Assigned(frmBairroCadastro))) then
    frmBairroCadastro := TfrmBairroCadastro.Create(AOwner);
  frmBairroCadastro.oInterfaceCadastroController := oBairroCadastroController;

  frmBairroCadastro.OnActivate := Pesquisar;
  frmBairroCadastro.Show;
  frmBairroCadastro.OnActivate(nil);
  frmBairroCadastro.cbMunicipio.OnEnter := ComboBox;
end;

destructor TBairroCadastroController.Destroy;
begin
  if (Assigned(oBairroDTO)) then
    FreeAndNil(oBairroDTO);

  if (Assigned(oBairroModel)) then
    FreeAndNil(oBairroModel);

  if (Assigned(oBairroRegra)) then
    FreeAndNil(oBairroRegra);
  inherited;
end;

procedure TBairroCadastroController.Novo(Sender: TObject);
begin
  oBairroRegra.LimparDTO(oBairroDTO);
end;

procedure TBairroCadastroController.Pesquisar(Sender: TObject);
var
  oListaEstado: TEstadoListaHash;
  oEstadoDTO: TEstadoDTO;
  oEstadoModel: TEstadoListagemModel;
  cbEstado: TComboBox;
begin
  cbEstado := frmBairroCadastro.cbEstado;
  cbEstado.Items.Clear;
  try
    oListaEstado := TEstadoListaHash.Create([doOwnsValues]);
    oEstadoModel := TEstadoListagemModel.Create;
    if (oBairroRegra.ComboBox(oListaEstado, oEstadoModel)) then
    begin
      for oEstadoDTO in oListaEstado.Values do
        cbEstado.Items.AddObject(oEstadoDTO.Descricao, TObject(oEstadoDTO.ID));
    end;
  finally
    if (Assigned(oListaEstado)) then
      FreeAndNil(oListaEstado);

    if (Assigned(oEstadoModel)) then
      FreeAndNil(oEstadoModel);
  end;
end;

procedure TBairroCadastroController.Salvar(Sender: TObject);
begin
end;

end.
