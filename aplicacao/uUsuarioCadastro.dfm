inherited frmUsuarioCadastro: TfrmUsuarioCadastro
  Caption = 'Cadastro de usu'#225'rio'
  ClientHeight = 232
  ClientWidth = 393
  ExplicitWidth = 399
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 213
    Width = 393
    ExplicitTop = 272
    ExplicitWidth = 671
  end
  inherited Panel1: TPanel
    Left = 290
    Height = 213
    ExplicitLeft = 568
    ExplicitHeight = 272
  end
  inherited panelCadastro: TPanel
    Width = 290
    Height = 213
    ExplicitLeft = -4
    ExplicitTop = -6
    ExplicitWidth = 389
    ExplicitHeight = 229
    object edtSenha: TLabeledEdit
      Left = 31
      Top = 121
      Width = 217
      Height = 24
      EditLabel.Width = 36
      EditLabel.Height = 16
      EditLabel.Caption = 'Senha'
      MaxLength = 15
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtUsuario: TLabeledEdit
      Left = 31
      Top = 69
      Width = 217
      Height = 24
      EditLabel.Width = 43
      EditLabel.Height = 16
      EditLabel.Caption = 'Usu'#225'rio'
      MaxLength = 15
      TabOrder = 0
    end
  end
end
