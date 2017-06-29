inherited frmProdutoCadastro: TfrmProdutoCadastro
  Caption = 'Cadastro de produto'
  ClientHeight = 347
  ClientWidth = 624
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitWidth = 640
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 328
    Width = 624
    ExplicitTop = 328
    ExplicitWidth = 624
  end
  inherited Panel1: TPanel
    Left = 521
    Height = 328
    ExplicitLeft = 521
    ExplicitHeight = 328
  end
  inherited panelCadastro: TPanel
    Width = 521
    Height = 328
    ExplicitWidth = 521
    ExplicitHeight = 328
    object Label1: TLabel
      Left = 18
      Top = 68
      Width = 55
      Height = 16
      Caption = 'Categoria'
    end
    object Label2: TLabel
      Left = 215
      Top = 68
      Width = 109
      Height = 16
      Caption = 'Unidade de Medida'
    end
    object cbCategoria: TComboBox
      Left = 18
      Top = 87
      Width = 191
      Height = 22
      Cursor = crHandPoint
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 0
    end
    object edtProduto: TLabeledEdit
      Left = 18
      Top = 38
      Width = 481
      Height = 24
      Cursor = crIBeam
      EditLabel.Width = 44
      EditLabel.Height = 16
      EditLabel.Caption = 'Produto'
      TabOrder = 2
    end
    object cbUnidadeMedida: TComboBox
      Left = 215
      Top = 87
      Width = 165
      Height = 22
      Cursor = crHandPoint
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 1
    end
    object edtPreco: TLabeledEdit
      Left = 386
      Top = 87
      Width = 113
      Height = 24
      Cursor = crIBeam
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = 'Pre'#231'o'
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 142
      Width = 481
      Height = 179
      Caption = 'Sabores'
      Padding.Left = 10
      TabOrder = 4
      object clkSabores: TCheckListBox
        Left = 12
        Top = 18
        Width = 467
        Height = 159
        Cursor = crHandPoint
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Columns = 3
        TabOrder = 0
        OnClick = clkSaboresClick
      end
    end
    object ckbSabor: TCheckBox
      Left = 18
      Top = 119
      Width = 111
      Height = 17
      Cursor = crHandPoint
      Caption = 'Possu'#237' Sabor?'
      TabOrder = 5
    end
  end
end
