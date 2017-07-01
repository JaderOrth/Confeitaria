inherited frmPedidoCadastro: TfrmPedidoCadastro
  Caption = 'Cadastro do pedido'
  ClientHeight = 595
  ClientWidth = 937
  ExplicitWidth = 953
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 576
    Width = 937
    ExplicitTop = 576
    ExplicitWidth = 866
  end
  inherited Panel1: TPanel
    Left = 834
    Height = 576
    ExplicitLeft = 763
    ExplicitHeight = 576
  end
  inherited panelCadastro: TPanel
    Width = 834
    Height = 576
    ExplicitWidth = 763
    ExplicitHeight = 576
    object TLabel
      Left = 33
      Top = 10
      Width = 4
      Height = 16
    end
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 94
      Height = 16
      Caption = 'Data do pedido*'
    end
    object Label2: TLabel
      Left = 354
      Top = 86
      Width = 78
      Height = 16
      Caption = 'Itens pedido*'
    end
    object Label3: TLabel
      Left = 18
      Top = 111
      Width = 133
      Height = 16
      Caption = 'Data e hora da entrega'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 18
      Top = 32
      Width = 224
      Height = 24
      Date = 42907.912224652780000000
      Time = 42907.912224652780000000
      TabOrder = 0
    end
    object LabeledEdit1: TLabeledEdit
      Left = 18
      Top = 433
      Width = 591
      Height = 24
      EditLabel.Width = 67
      EditLabel.Height = 16
      EditLabel.Caption = 'Observa'#231#227'o'
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 354
      Top = 108
      Width = 293
      Height = 24
      TabOrder = 2
      Text = 'ComboBox1'
    end
    object DateTimePicker2: TDateTimePicker
      Left = 18
      Top = 133
      Width = 224
      Height = 24
      Date = 42907.912224652780000000
      Time = 42907.912224652780000000
      TabOrder = 3
    end
    object LabeledEdit2: TLabeledEdit
      Left = 18
      Top = 364
      Width = 293
      Height = 24
      EditLabel.Width = 151
      EditLabel.Height = 16
      EditLabel.Caption = 'Complementos da entrega'
      TabOrder = 4
    end
    object ComboBox2: TComboBox
      Left = 508
      Top = 258
      Width = 279
      Height = 24
      TabOrder = 5
      Text = 'ComboBox1'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 18
      Top = 177
      Width = 224
      Height = 24
      EditLabel.Width = 97
      EditLabel.Height = 16
      EditLabel.Caption = 'Total do pedido*'
      TabOrder = 6
    end
    object LabeledEdit4: TLabeledEdit
      Left = 18
      Top = 274
      Width = 335
      Height = 24
      EditLabel.Width = 127
      EditLabel.Height = 16
      EditLabel.Caption = 'Endere'#231'o de entrega*'
      TabOrder = 7
    end
    object LabeledEdit5: TLabeledEdit
      Left = 18
      Top = 319
      Width = 224
      Height = 24
      EditLabel.Width = 119
      EditLabel.Height = 16
      EditLabel.Caption = 'N'#250'mero da entrega*'
      TabOrder = 8
    end
    object LabeledEdit6: TLabeledEdit
      Left = 18
      Top = 225
      Width = 335
      Height = 24
      EditLabel.Width = 141
      EditLabel.Height = 16
      EditLabel.Caption = 'Responsavel pelo pedido'
      TabOrder = 9
    end
  end
end
