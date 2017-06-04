inherited frmMunicipio: TfrmMunicipio
  Caption = 'Listagem dos Munic'#237'pios'
  ClientHeight = 510
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Height = 435
    ExplicitHeight = 435
  end
  inherited StatusBar1: TStatusBar
    Top = 491
    ExplicitTop = 491
  end
  inherited DBGridListagem: TDBGrid
    Height = 435
    Columns = <
      item
        Expanded = False
        FieldName = 'idMunicipio'
        Title.Caption = 'ID'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Width = 300
        Visible = True
      end>
  end
end
