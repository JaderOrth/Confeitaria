inherited frmCategorias: TfrmCategorias
  Caption = 'Listagem de Categorias'
  ClientWidth = 833
  ExplicitWidth = 849
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel2: TPanel
    Width = 833
    ExplicitWidth = 833
  end
  inherited StatusBar1: TStatusBar
    Width = 833
    ExplicitWidth = 833
  end
  inherited DBGridListagem: TDBGrid
    Width = 648
    Columns = <
      item
        Expanded = False
        FieldName = 'idcategorias'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Categoria'
        Width = 300
        Visible = True
      end>
  end
end
