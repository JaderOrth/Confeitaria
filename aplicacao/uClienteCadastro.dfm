inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 445
  ClientWidth = 755
  ExplicitWidth = 771
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 426
    Width = 755
    ExplicitTop = 426
    ExplicitWidth = 755
  end
  inherited Panel1: TPanel
    Left = 652
    Height = 426
    ExplicitLeft = 652
    ExplicitHeight = 426
  end
  inherited panelCadastro: TPanel
    Width = 652
    Height = 426
    ExplicitWidth = 652
    ExplicitHeight = 426
    object Label1: TLabel
      Left = 16
      Top = 246
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 16
      Top = 298
      Width = 61
      Height = 16
      Caption = 'Munic'#237'pio*'
    end
    object Label3: TLabel
      Left = 16
      Top = 350
      Width = 42
      Height = 16
      Caption = 'Bairro*'
    end
    object edtNome: TLabeledEdit
      Left = 16
      Top = 24
      Width = 281
      Height = 24
      EditLabel.Width = 41
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome*'
      TabOrder = 0
    end
    object edtCPFCNPJ: TLabeledEdit
      Left = 16
      Top = 168
      Width = 193
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'CPF/CNPJ'
      TabOrder = 4
    end
    object edtEndereco: TLabeledEdit
      Left = 16
      Top = 72
      Width = 281
      Height = 24
      EditLabel.Width = 61
      EditLabel.Height = 16
      EditLabel.Caption = 'Endere'#231'o*'
      TabOrder = 2
    end
    object edtNumero: TLabeledEdit
      Left = 328
      Top = 24
      Width = 161
      Height = 24
      EditLabel.Width = 57
      EditLabel.Height = 16
      EditLabel.Caption = 'Numero* '
      TabOrder = 1
    end
    object edtObservacao: TLabeledEdit
      Left = 16
      Top = 120
      Width = 329
      Height = 24
      EditLabel.Width = 81
      EditLabel.Height = 16
      EditLabel.Caption = 'Observa'#231#245'es*'
      TabOrder = 3
    end
    object edtComplemento: TLabeledEdit
      Left = 240
      Top = 168
      Width = 249
      Height = 24
      EditLabel.Width = 69
      EditLabel.Height = 16
      EditLabel.Caption = 'Residencia*'
      TabOrder = 5
    end
    object edtCelular: TLabeledEdit
      Left = 240
      Top = 216
      Width = 249
      Height = 24
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Celular'
      TabOrder = 7
    end
    object cbEstado: TComboBox
      Left = 16
      Top = 268
      Width = 329
      Height = 24
      TabOrder = 8
    end
    object cbMunicipio: TComboBox
      Left = 16
      Top = 320
      Width = 329
      Height = 24
      TabOrder = 9
    end
    object cbBairro: TComboBox
      Left = 16
      Top = 372
      Width = 329
      Height = 24
      TabOrder = 10
    end
    object edtTelefone: TLabeledEdit
      Left = 16
      Top = 216
      Width = 194
      Height = 24
      EditLabel.Width = 43
      EditLabel.Height = 16
      EditLabel.Caption = 'Telfone'
      TabOrder = 6
    end
  end
end
