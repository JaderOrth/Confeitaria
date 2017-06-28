inherited frmProdutoCadastro: TfrmProdutoCadastro
  Caption = 'Cadastro de produto'
  ClientHeight = 274
  ClientWidth = 533
  ExplicitWidth = 549
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 255
    Width = 533
    ExplicitWidth = 691
  end
  inherited Panel1: TPanel
    Left = 430
    Height = 255
    ExplicitLeft = 588
  end
  inherited panelCadastro: TPanel
    Width = 430
    Height = 255
    ExplicitLeft = 8
    ExplicitTop = -6
    ExplicitWidth = 482
    ExplicitHeight = 269
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 55
      Height = 16
      Caption = 'Categoria'
    end
    object Label2: TLabel
      Left = 16
      Top = 75
      Width = 109
      Height = 16
      Caption = 'Unidade de Medida'
    end
    object cbCategoria: TComboBox
      Left = 16
      Top = 43
      Width = 369
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 0
    end
    object edtProduto: TLabeledEdit
      Left = 16
      Top = 142
      Width = 369
      Height = 24
      EditLabel.Width = 44
      EditLabel.Height = 16
      EditLabel.Caption = 'Produto'
      TabOrder = 2
    end
    object cbUnidadeMedida: TComboBox
      Left = 16
      Top = 94
      Width = 369
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 1
    end
    object edtPreco: TLabeledEdit
      Left = 16
      Top = 188
      Width = 137
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = 'Pre'#231'o'
      TabOrder = 3
    end
    object chkbSabores: TCheckBox
      Left = 183
      Top = 188
      Width = 82
      Height = 17
      Caption = ' Sabores'
      TabOrder = 4
    end
  end
end
