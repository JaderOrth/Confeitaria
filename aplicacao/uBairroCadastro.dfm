inherited frmBairroCadastro: TfrmBairroCadastro
  ActiveControl = edtBairro
  Caption = 'Cadastro de Bairro'
  ClientHeight = 235
  ClientWidth = 490
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitWidth = 496
  ExplicitHeight = 263
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 216
    Width = 490
    ExplicitTop = 216
    ExplicitWidth = 490
  end
  inherited Panel1: TPanel
    Left = 387
    Height = 216
    ExplicitLeft = 387
    ExplicitHeight = 216
  end
  inherited panelCadastro: TPanel
    Width = 387
    Height = 216
    ExplicitWidth = 387
    ExplicitHeight = 216
    object Label1: TLabel
      Left = 24
      Top = 78
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 24
      Top = 125
      Width = 53
      Height = 16
      Caption = 'Municipio'
    end
    object edtBairro: TLabeledEdit
      Left = 24
      Top = 48
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Bairro'
      TabOrder = 0
    end
    object cbEstado: TComboBox
      Left = 24
      Top = 97
      Width = 337
      Height = 22
      Style = csOwnerDrawFixed
      CharCase = ecUpperCase
      Sorted = True
      TabOrder = 1
    end
    object cbMunicipio: TComboBox
      Left = 24
      Top = 144
      Width = 337
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 2
    end
  end
end
