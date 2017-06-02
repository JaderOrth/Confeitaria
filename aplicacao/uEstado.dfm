inherited frmEstado: TfrmEstado
  Caption = 'Listagem dos estados'
  ClientHeight = 510
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Height = 435
    ExplicitHeight = 435
  end
  inherited Panel2: TPanel
    inherited btnEditar: TSpeedButton
      ExplicitLeft = 53
      ExplicitTop = 0
    end
    inherited btnNovo: TSpeedButton
      ExplicitTop = 0
    end
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
        FieldName = 'iduf'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla_uf'
        Title.Alignment = taCenter
        Title.Caption = 'Sigla'
        Width = 60
        Visible = True
      end>
  end
  inherited src_listagem: TDataSource
    AutoEdit = False
  end
end
