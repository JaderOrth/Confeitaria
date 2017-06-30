inherited frmSaborCadastro: TfrmSaborCadastro
  ActiveControl = edtSabor
  Caption = 'Cadastro Sabor'
  ClientHeight = 233
  ClientWidth = 519
  ExplicitWidth = 525
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 214
    Width = 519
    ExplicitTop = 418
    ExplicitWidth = 894
  end
  inherited Panel1: TPanel
    Left = 416
    Height = 214
    ExplicitLeft = 791
    ExplicitHeight = 418
  end
  inherited panelCadastro: TPanel
    Width = 416
    Height = 214
    ExplicitWidth = 791
    ExplicitHeight = 418
    object Label1: TLabel
      Left = 22
      Top = 73
      Width = 71
      Height = 16
      Caption = 'Ingredientes'
    end
    object edtSabor: TLabeledEdit
      Left = 22
      Top = 43
      Width = 369
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Sabor'
      TabOrder = 0
      OnKeyPress = edtSaborKeyPress
    end
    object edtIngredientes: TMemo
      Left = 22
      Top = 93
      Width = 369
      Height = 89
      TabOrder = 1
      OnKeyPress = edtIngredientesKeyPress
    end
  end
end
