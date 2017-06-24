inherited frmUnidadeMedidaCadastro: TfrmUnidadeMedidaCadastro
  Caption = 'Cadastro Unidade de Medida'
  ClientWidth = 573
  ExplicitWidth = 589
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Width = 573
  end
  inherited Panel1: TPanel
    Left = 470
  end
  inherited panelCadastro: TPanel
    Width = 470
    ExplicitLeft = -280
    ExplicitTop = -112
    ExplicitWidth = 470
    object edtDescricao: TLabeledEdit
      Left = 47
      Top = 80
      Width = 242
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Descri'#231#227'o'
      TabOrder = 0
    end
    object edtSigla: TLabeledEdit
      Left = 295
      Top = 80
      Width = 41
      Height = 24
      EditLabel.Width = 28
      EditLabel.Height = 16
      EditLabel.Caption = 'Sigla'
      MaxLength = 2
      TabOrder = 1
    end
    object chkbDecimal: TCheckBox
      Left = 47
      Top = 125
      Width = 121
      Height = 17
      Caption = 'Permite Decimal'
      TabOrder = 2
    end
  end
end
