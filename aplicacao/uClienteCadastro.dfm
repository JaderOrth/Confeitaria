inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 540
  ClientWidth = 757
  ExplicitWidth = 763
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 521
    Width = 757
    ExplicitTop = 521
    ExplicitWidth = 757
  end
  inherited Panel1: TPanel
    Left = 654
    Height = 521
    ExplicitLeft = 654
    ExplicitHeight = 521
  end
  inherited panelCadastro: TPanel
    Width = 654
    Height = 521
    ExplicitWidth = 654
    ExplicitHeight = 521
    object Label4: TLabel
      Left = 15
      Top = 400
      Width = 174
      Height = 16
      Caption = 'Observa'#231#245'es Gerais do Cliente'
    end
    object edtObservacao: TMemo
      Left = 15
      Top = 422
      Width = 618
      Height = 83
      DoubleBuffered = False
      DragCursor = crHelp
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 15
      Width = 618
      Height = 138
      Caption = '  Informa'#231#245'es do Cliente  '
      TabOrder = 1
      object edtNome: TLabeledEdit
        Left = 24
        Top = 39
        Width = 574
        Height = 24
        EditLabel.Width = 33
        EditLabel.Height = 16
        EditLabel.Caption = 'Nome'
        TabOrder = 0
      end
      object edtCPFCNPJ: TLabeledEdit
        Left = 24
        Top = 100
        Width = 232
        Height = 24
        EditLabel.Width = 55
        EditLabel.Height = 16
        EditLabel.Caption = 'CPF/CNPJ'
        TabOrder = 1
      end
      object edtTelefone: TLabeledEdit
        Left = 262
        Top = 100
        Width = 165
        Height = 24
        EditLabel.Width = 50
        EditLabel.Height = 16
        EditLabel.Caption = 'Telefone'
        TabOrder = 2
      end
      object edtCelular: TLabeledEdit
        Left = 433
        Top = 100
        Width = 165
        Height = 24
        EditLabel.Width = 40
        EditLabel.Height = 16
        EditLabel.Caption = 'Celular'
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 159
      Width = 618
      Height = 226
      Caption = '  Endere'#231'o  '
      TabOrder = 2
      object Label1: TLabel
        Left = 24
        Top = 21
        Width = 38
        Height = 16
        Caption = 'Estado'
      end
      object Label2: TLabel
        Left = 287
        Top = 21
        Width = 53
        Height = 16
        Caption = 'Munic'#237'pio'
      end
      object Label3: TLabel
        Left = 24
        Top = 67
        Width = 34
        Height = 16
        Caption = 'Bairro'
      end
      object edtEndereco: TLabeledEdit
        Left = 24
        Top = 131
        Width = 403
        Height = 24
        EditLabel.Width = 22
        EditLabel.Height = 16
        EditLabel.Caption = 'Rua'
        TabOrder = 3
      end
      object cbEstado: TComboBox
        Left = 24
        Top = 40
        Width = 257
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        Color = clBtnHighlight
        Sorted = True
        TabOrder = 0
      end
      object cbMunicipio: TComboBox
        Left = 287
        Top = 40
        Width = 311
        Height = 22
        Style = csOwnerDrawFixed
        Color = clBtnHighlight
        Sorted = True
        TabOrder = 1
      end
      object cbBairro: TComboBox
        Left = 24
        Top = 85
        Width = 257
        Height = 22
        Style = csOwnerDrawFixed
        Sorted = True
        TabOrder = 2
      end
      object edtNumero: TLabeledEdit
        Left = 433
        Top = 130
        Width = 165
        Height = 24
        EditLabel.Width = 45
        EditLabel.Height = 16
        EditLabel.Caption = 'Numero'
        TabOrder = 4
      end
      object edtComplemento: TLabeledEdit
        Left = 24
        Top = 181
        Width = 165
        Height = 24
        EditLabel.Width = 79
        EditLabel.Height = 16
        EditLabel.Caption = 'Complemento'
        TabOrder = 5
      end
    end
  end
end
