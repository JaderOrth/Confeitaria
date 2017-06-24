inherited frmUsuario: TfrmUsuario
  Caption = 'Listagem de usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    ExplicitHeight = 431
  end
  inherited Panel2: TPanel
    ExplicitWidth = 1001
  end
  inherited StatusBar1: TStatusBar
    ExplicitTop = 487
    ExplicitWidth = 1001
  end
  inherited DBGridListagem: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idcliente'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'usuario'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Width = 200
        Visible = True
      end>
  end
end
