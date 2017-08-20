object frmLogin: TfrmLogin
  Left = 566
  Top = 394
  BorderIcons = []
  Caption = 'Login'
  ClientHeight = 192
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 158
    Top = 133
    Width = 85
    Height = 51
    Caption = 'Login'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 133
    Width = 85
    Height = 51
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 40
    Width = 235
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 2
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 88
    Width = 235
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 3
  end
end
