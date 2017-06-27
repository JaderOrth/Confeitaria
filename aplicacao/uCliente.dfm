inherited frmCliente: TfrmCliente
  Caption = 'Listagem de clientes'
  ClientWidth = 1016
  Position = poDesigned
  ExplicitWidth = 1032
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel2: TPanel
    Width = 1016
  end
  inherited StatusBar1: TStatusBar
    Width = 1016
  end
  inherited DBGridListagem: TDBGrid
    Width = 831
    Columns = <
      item
        Alignment = taCenter
        DropDownRows = 0
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idcliente'
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'endereco'
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'numero'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'telefone'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'celular'
        Title.Alignment = taCenter
        Title.Caption = 'Celular'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Bairro'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'municipio'
        Title.Alignment = taCenter
        Title.Caption = 'Munic'#237'pio'
        Width = 150
        Visible = True
      end>
  end
end
