inherited frmPedido: TfrmPedido
  Caption = 'Listagem de pedidos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGridListagem: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idpedido'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'total_pedido'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_entrega'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'hora_entrega'
        Title.Alignment = taCenter
        Title.Caption = 'Hora '
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Bairro'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'entrega_endereco'
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'entrega_numero'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'responsavel_pedido'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do cliente'
        Width = 200
        Visible = True
      end>
  end
end
