inherited frmCliente: TfrmCliente
  Caption = 'Listagem de clientes'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGridListagem: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'idcliente'
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'N'#250'mero'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacao'
        Title.Caption = 'Observa'#231#245'es'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'celular'
        Title.Caption = 'Celular'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Bairro'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'municipio'
        Title.Caption = 'Munic'#237'pio'
        Width = 200
        Visible = True
      end>
  end
end
