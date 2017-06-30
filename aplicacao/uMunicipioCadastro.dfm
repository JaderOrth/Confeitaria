inherited frmMunicipioCadastro: TfrmMunicipioCadastro
  ActiveControl = edtMunicipio
  Caption = 'Cadastro de Munic'#237'pio'
  ClientHeight = 233
  ClientWidth = 491
  ExplicitWidth = 497
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 214
    Width = 491
    ExplicitTop = 214
    ExplicitWidth = 491
  end
  inherited Panel1: TPanel
    Left = 388
    Height = 214
    ExplicitLeft = 388
    ExplicitHeight = 214
  end
  inherited panelCadastro: TPanel
    Width = 388
    Height = 214
    ExplicitWidth = 388
    ExplicitHeight = 214
    object Label1: TLabel
      Left = 24
      Top = 102
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object edtMunicipio: TLabeledEdit
      Left = 24
      Top = 72
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 53
      EditLabel.Height = 16
      EditLabel.Caption = 'Munic'#237'pio'
      TabOrder = 0
    end
    object cbEstado: TComboBox
      Left = 24
      Top = 120
      Width = 337
      Height = 22
      Style = csOwnerDrawFixed
      CharCase = ecUpperCase
      Sorted = True
      TabOrder = 1
    end
  end
end
