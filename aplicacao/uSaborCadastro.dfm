inherited frmSaborCadastro: TfrmSaborCadastro
  Caption = 'Cadastro Sabor'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panelCadastro: TPanel
    object Label1: TLabel
      Left = 32
      Top = 83
      Width = 71
      Height = 16
      Caption = 'Ingredientes'
    end
    object edtSabor: TLabeledEdit
      Left = 32
      Top = 40
      Width = 257
      Height = 24
      EditLabel.Width = 34
      EditLabel.Height = 16
      EditLabel.Caption = 'Sabor'
      TabOrder = 0
    end
    object edtIngredientes: TMemo
      Left = 32
      Top = 105
      Width = 513
      Height = 89
      Lines.Strings = (
        '')
      TabOrder = 1
    end
  end
end
