inherited frmUsuarioCadastro: TfrmUsuarioCadastro
  Caption = 'Cadastro de usu'#225'rio'
  ClientHeight = 291
  ClientWidth = 671
  ExplicitWidth = 687
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 272
    Width = 671
    ExplicitTop = 272
    ExplicitWidth = 671
  end
  inherited Panel1: TPanel
    Left = 568
    Height = 272
    ExplicitLeft = 568
    ExplicitHeight = 272
  end
  inherited panelCadastro: TPanel
    Width = 568
    Height = 272
    ExplicitWidth = 568
    ExplicitHeight = 272
    object edtSenha: TLabeledEdit
      Left = 56
      Top = 117
      Width = 265
      Height = 24
      EditLabel.Width = 36
      EditLabel.Height = 16
      EditLabel.Caption = 'Senha'
      TabOrder = 0
    end
    object edtUsuario: TLabeledEdit
      Left = 56
      Top = 65
      Width = 329
      Height = 24
      EditLabel.Width = 43
      EditLabel.Height = 16
      EditLabel.Caption = 'Usu'#225'rio'
      TabOrder = 1
    end
  end
end
