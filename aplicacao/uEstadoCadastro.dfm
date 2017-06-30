inherited frmEstadoCadastro: TfrmEstadoCadastro
  Caption = 'Cadastro estado'
  ClientHeight = 237
  ClientWidth = 490
  ExplicitWidth = 496
  ExplicitHeight = 265
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 218
    Width = 490
    ExplicitTop = 218
    ExplicitWidth = 490
  end
  inherited Panel1: TPanel
    Left = 387
    Height = 218
    ExplicitLeft = 387
    ExplicitHeight = 218
  end
  inherited panelCadastro: TPanel
    Width = 387
    Height = 218
    ExplicitWidth = 387
    ExplicitHeight = 218
    object edtEstado: TLabeledEdit
      Left = 26
      Top = 116
      Width = 337
      Height = 24
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      EditLabel.Width = 38
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Estado'
      EditLabel.ParentBiDiMode = False
      ParentBiDiMode = False
      TabOrder = 1
    end
    object edtSigla: TLabeledEdit
      Left = 26
      Top = 70
      Width = 121
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 57
      EditLabel.Height = 16
      EditLabel.Caption = 'Sigla (UF)'
      MaxLength = 2
      TabOrder = 0
    end
  end
end
