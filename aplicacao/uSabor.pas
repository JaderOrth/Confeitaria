unit uSabor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListagemBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSaborListagem = class(TfrmListagemBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaborListagem: TfrmSaborListagem;

implementation

{$R *.dfm}

end.
