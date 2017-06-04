inherited frmEstadoCadastro: TfrmEstadoCadastro
  Caption = 'Cadastro estado'
  ClientWidth = 647
  ExplicitWidth = 663
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Width = 647
    ExplicitWidth = 647
  end
  inherited Panel1: TPanel
    Left = 544
    ExplicitLeft = 544
  end
  inherited panelCadastro: TPanel
    Width = 544
    ExplicitWidth = 544
    object edtEstado: TLabeledEdit
      Left = 80
      Top = 88
      Width = 425
      Height = 24
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      EditLabel.Width = 38
      EditLabel.Height = 16
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Estado'
      EditLabel.ParentBiDiMode = False
      LabelPosition = lpLeft
      ParentBiDiMode = False
      TabOrder = 1
      TextHint = 'Descri'#231#227'o UF'
    end
    object edtSigla: TLabeledEdit
      Left = 80
      Top = 58
      Width = 121
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 28
      EditLabel.Height = 16
      EditLabel.Caption = 'Sigla'
      LabelPosition = lpLeft
      MaxLength = 2
      TabOrder = 0
      TextHint = 'UF'
    end
  end
end
