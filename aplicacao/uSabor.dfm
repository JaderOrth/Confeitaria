inherited frmSabor: TfrmSabor
  Caption = 'Listagem Sabor'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGridListagem: TDBGrid
    ParentCtl3D = False
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Sabor'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ingredientes'
        Title.Alignment = taCenter
        Title.Caption = 'Ingredientes'
        Width = 400
        Visible = True
      end>
  end
end
