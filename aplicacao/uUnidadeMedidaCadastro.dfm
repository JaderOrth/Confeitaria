inherited frmUnidadeMedidaCadastro: TfrmUnidadeMedidaCadastro
  ActiveControl = edtSigla
  Caption = 'Cadastro Unidade de Medida'
  ClientHeight = 233
  ClientWidth = 435
  ExplicitWidth = 441
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 214
    Width = 435
    ExplicitTop = 214
    ExplicitWidth = 435
  end
  inherited Panel1: TPanel
    Left = 332
    Height = 214
    ExplicitLeft = 332
    ExplicitHeight = 214
  end
  inherited panelCadastro: TPanel
    Width = 332
    Height = 214
    ExplicitWidth = 332
    ExplicitHeight = 214
    object edtDescricao: TLabeledEdit
      Left = 27
      Top = 106
      Width = 274
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Descri'#231#227'o'
      TabOrder = 1
    end
    object edtSigla: TLabeledEdit
      Left = 27
      Top = 58
      Width = 41
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 28
      EditLabel.Height = 16
      EditLabel.Caption = 'Sigla'
      MaxLength = 2
      TabOrder = 0
    end
    object chkbDecimal: TCheckBox
      Left = 27
      Top = 144
      Width = 121
      Height = 17
      Hint = 'Exemplo valor tipo 0,50, n'#227'o inteiro.'
      Caption = 'Permite Decimal'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
end
