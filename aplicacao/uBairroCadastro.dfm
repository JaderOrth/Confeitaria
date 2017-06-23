inherited frmBairroCadastro: TfrmBairroCadastro
  Caption = 'Cadastro de Bairro'
  ClientHeight = 297
  ClientWidth = 582
  OnKeyPress = nil
  ExplicitWidth = 598
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 278
    Width = 582
    ExplicitTop = 278
    ExplicitWidth = 582
  end
  inherited Panel1: TPanel
    Left = 479
    Height = 278
    ExplicitLeft = 479
    ExplicitHeight = 278
  end
  inherited panelCadastro: TPanel
    Width = 479
    Height = 278
    ExplicitWidth = 479
    ExplicitHeight = 278
    object Label1: TLabel
      Left = 40
      Top = 106
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 40
      Top = 158
      Width = 53
      Height = 16
      Caption = 'Municipio'
    end
    object edtBairro: TLabeledEdit
      Left = 40
      Top = 73
      Width = 337
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Bairro'
      TabOrder = 0
    end
    object cbEstado: TComboBox
      Left = 40
      Top = 125
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object cbMunicipio: TComboBox
      Left = 40
      Top = 177
      Width = 337
      Height = 24
      TabOrder = 2
    end
  end
end
