inherited frmEstadoCadastro: TfrmEstadoCadastro
  Caption = 'Cadastro estado'
  ClientWidth = 647
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 663
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Width = 647
  end
  inherited Panel1: TPanel
    Left = 544
    inherited btnSalvar: TSpeedButton
      OnClick = btnSalvarClick
    end
  end
  inherited Panel3: TPanel
    Width = 544
    ExplicitLeft = -4
    ExplicitTop = -6
    ExplicitWidth = 544
    object edtID: TLabeledEdit
      Left = 80
      Top = 58
      Width = 121
      Height = 24
      Color = clBtnFace
      EditLabel.Width = 12
      EditLabel.Height = 16
      EditLabel.Caption = 'ID'
      Enabled = False
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object edtEstado: TLabeledEdit
      Left = 80
      Top = 88
      Width = 425
      Height = 24
      EditLabel.Width = 38
      EditLabel.Height = 16
      EditLabel.Caption = 'Estado'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object edtSigla: TLabeledEdit
      Left = 80
      Top = 118
      Width = 121
      Height = 24
      EditLabel.Width = 28
      EditLabel.Height = 16
      EditLabel.Caption = 'Sigla'
      LabelPosition = lpLeft
      TabOrder = 2
    end
  end
end
