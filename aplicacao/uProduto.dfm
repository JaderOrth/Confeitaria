inherited frmProduto: TfrmProduto
  Caption = 'Listagem de produtos'
  ClientWidth = 1093
  ExplicitWidth = 1109
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel2: TPanel
    Width = 1093
  end
  inherited StatusBar1: TStatusBar
    Width = 1093
  end
  inherited DBGridListagem: TDBGrid
    Width = 908
    DataSource = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'idprodutos'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Categoria'
        Width = 150
        Visible = True
      end>
  end
end
