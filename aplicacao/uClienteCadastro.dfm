inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 469
  ClientWidth = 649
  ExplicitWidth = 665
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 450
    Width = 649
    ExplicitTop = 426
    ExplicitWidth = 755
  end
  inherited Panel1: TPanel
    Left = 546
    Height = 450
    ExplicitLeft = 652
    ExplicitHeight = 426
  end
  inherited panelCadastro: TPanel
    Width = 546
    Height = 450
    ExplicitWidth = 652
    ExplicitHeight = 426
    object Label1: TLabel
      Left = 16
      Top = 196
      Width = 38
      Height = 16
      Caption = 'Estado'
    end
    object Label2: TLabel
      Left = 16
      Top = 248
      Width = 61
      Height = 16
      Caption = 'Munic'#237'pio*'
    end
    object Label3: TLabel
      Left = 16
      Top = 300
      Width = 42
      Height = 16
      Caption = 'Bairro*'
    end
    object Label4: TLabel
      Left = 16
      Top = 352
      Width = 81
      Height = 16
      Caption = 'Observa'#231#245'es*'
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
      Top = 118
      Width = 193
      Height = 24
      EditLabel.Width = 55
      EditLabel.Height = 16
      EditLabel.Caption = 'CPF/CNPJ'
      TabOrder = 3
    end
    object edtEndereco: TLabeledEdit
      Left = 16
      Top = 72
      Width = 393
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
    object edtComplemento: TLabeledEdit
      Left = 240
      Top = 118
      Width = 249
      Height = 24
      EditLabel.Width = 69
      EditLabel.Height = 16
      EditLabel.Caption = 'Residencia*'
      TabOrder = 4
    end
    object edtCelular: TLabeledEdit
      Left = 240
      Top = 166
      Width = 249
      Height = 24
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'Celular'
      TabOrder = 6
    end
    object cbEstado: TComboBox
      Left = 16
      Top = 218
      Width = 329
      Height = 24
      TabOrder = 7
    end
    object cbMunicipio: TComboBox
      Left = 16
      Top = 270
      Width = 329
      Height = 24
      TabOrder = 8
    end
    object cbBairro: TComboBox
      Left = 16
      Top = 322
      Width = 329
      Height = 24
      TabOrder = 9
    end
    object edtTelefone: TLabeledEdit
      Left = 16
      Top = 166
      Width = 194
      Height = 24
      EditLabel.Width = 43
      EditLabel.Height = 16
      EditLabel.Caption = 'Telfone'
      TabOrder = 5
    end
    object edtObservacao: TMemo
      Left = 16
      Top = 374
      Width = 473
      Height = 59
      Lines.Strings = (
        'edtObservacao')
      TabOrder = 10
    end
  end
end
