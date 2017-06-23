inherited frmMunicipioCadastro: TfrmMunicipioCadastro
  Caption = 'Cadastro de Munic'#237'pio'
  ClientHeight = 330
  ClientWidth = 639
  ExplicitWidth = 655
  ExplicitHeight = 368
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 311
    Width = 639
    ExplicitLeft = -8
    ExplicitTop = 274
    ExplicitWidth = 884
  end
  inherited Panel1: TPanel
    Left = 536
    Height = 311
    ExplicitLeft = 781
    ExplicitHeight = 268
  end
  inherited panelCadastro: TPanel
    Width = 536
    Height = 311
    ExplicitLeft = -4
    ExplicitTop = -6
    ExplicitWidth = 781
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
