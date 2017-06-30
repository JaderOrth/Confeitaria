inherited frmCategoriasCadastro: TfrmCategoriasCadastro
  ActiveControl = edtCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 235
  ClientWidth = 472
  ExplicitWidth = 478
  ExplicitHeight = 263
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 216
    Width = 472
    ExplicitTop = 418
    ExplicitWidth = 894
  end
  inherited Panel1: TPanel
    Left = 369
    Height = 216
    ExplicitLeft = 791
    ExplicitHeight = 418
  end
  inherited panelCadastro: TPanel
    Width = 369
    Height = 216
    ExplicitWidth = 791
    ExplicitHeight = 418
    object edtCategoria: TLabeledEdit
      Left = 24
      Top = 88
      Width = 321
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'Categoria'
      TabOrder = 0
    end
  end
end
