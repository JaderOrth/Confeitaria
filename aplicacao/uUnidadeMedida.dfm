inherited frmUnidadeMedida: TfrmUnidadeMedida
  Caption = 'Unidade de Medida'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGridListagem: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Unidade de Medida'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Title.Alignment = taCenter
        Title.Caption = 'Sigla'
        Visible = True
      end>
  end
end
