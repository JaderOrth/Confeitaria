inherited frmBairro: TfrmBairro
  Caption = 'Listagem de Bairros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGridListagem: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'idbairro'
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Bairros'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'municipio'
        Title.Caption = 'Munic'#237'pio'
        Width = 300
        Visible = True
      end>
  end
end
