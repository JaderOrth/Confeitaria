inherited frmMunicipioCadastro: TfrmMunicipioCadastro
  Caption = 'Cadastro de Munic'#237'pio'
  ClientHeight = 287
  ExplicitHeight = 325
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 268
    ExplicitTop = 268
  end
  inherited Panel1: TPanel
    Height = 268
    ExplicitHeight = 268
  end
  inherited panelCadastro: TPanel
    Height = 268
    ExplicitHeight = 268
    object Label1: TLabel
      Left = 61
      Top = 127
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object edtMunicipio: TLabeledEdit
      Left = 104
      Top = 90
      Width = 337
      Height = 24
      EditLabel.Width = 53
      EditLabel.Height = 16
      EditLabel.Caption = 'Munic'#237'pio'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object cbEstado: TComboBox
      Left = 104
      Top = 124
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
end
