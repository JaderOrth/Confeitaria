inherited frmUnidadeMedidaCadastro: TfrmUnidadeMedidaCadastro
  Caption = 'Cadastro Unidade de Medida'
  ClientHeight = 291
  ClientWidth = 573
  ExplicitWidth = 589
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 272
    Width = 573
    ExplicitTop = 272
    ExplicitWidth = 573
  end
  inherited Panel1: TPanel
    Left = 470
    Height = 272
    ExplicitLeft = 470
    ExplicitHeight = 272
  end
  inherited panelCadastro: TPanel
    Width = 470
    Height = 272
    ExplicitWidth = 470
    ExplicitHeight = 272
    object edtDescricao: TLabeledEdit
      Left = 47
      Top = 80
      Width = 242
      Height = 24
      CharCase = ecUpperCase
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
      CharCase = ecUpperCase
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
