inherited frmPedidoCadastro: TfrmPedidoCadastro
  Caption = 'Cadastro do pedido'
  ClientHeight = 460
  ClientWidth = 821
  ExplicitWidth = 837
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 441
    Width = 821
    ExplicitTop = 441
    ExplicitWidth = 821
  end
  inherited Panel1: TPanel
    Left = 718
    Height = 441
    ExplicitLeft = 718
    ExplicitHeight = 441
  end
  inherited panelCadastro: TPanel
    Width = 718
    Height = 441
    ExplicitWidth = 718
    ExplicitHeight = 441
    object TLabel
      Left = 33
      Top = 10
      Width = 4
      Height = 16
    end
    object PageControlPedido: TPageControl
      Left = 2
      Top = 2
      Width = 714
      Height = 437
      ActivePage = tsItensPedido
      Align = alClient
      TabOrder = 0
      object tsPedido: TTabSheet
        Caption = '   &Pedido    '
        DoubleBuffered = False
        ParentDoubleBuffered = False
        object Label6: TLabel
          Left = 395
          Top = 55
          Width = 94
          Height = 16
          Caption = 'Data do pedido*'
        end
        object Label1: TLabel
          Left = 395
          Top = 102
          Width = 141
          Height = 16
          Caption = 'Data e hora da entrega*'
        end
        object Label2: TLabel
          Left = 309
          Top = 468
          Width = 37
          Height = 16
          Caption = 'Label4'
        end
        object Label3: TLabel
          Left = 14
          Top = 53
          Width = 46
          Height = 16
          Caption = 'Estado*'
        end
        object Label4: TLabel
          Left = 14
          Top = 103
          Width = 61
          Height = 16
          Caption = 'Munic'#237'pio*'
        end
        object Label5: TLabel
          Left = 12
          Top = 154
          Width = 42
          Height = 16
          Caption = 'Bairro*'
        end
        object xx: TLabel
          Left = 14
          Top = 262
          Width = 73
          Height = 16
          Caption = 'Observa'#231#245'es'
        end
        object dtDataHoraEntrega: TDateTimePicker
          Left = 395
          Top = 122
          Width = 224
          Height = 24
          Date = 42907.912222222220000000
          Time = 42907.912222222220000000
          TabOrder = 0
        end
        object cbEstado: TComboBox
          Left = 13
          Top = 75
          Width = 359
          Height = 24
          TabOrder = 1
        end
        object dtDataPedido: TDateTimePicker
          Left = 397
          Top = 72
          Width = 224
          Height = 24
          Date = 42907.912224652780000000
          Time = 42907.912224652780000000
          TabOrder = 2
        end
        object edtTotalPedido: TLabeledEdit
          Left = 395
          Top = 335
          Width = 223
          Height = 24
          EditLabel.Width = 97
          EditLabel.Height = 16
          EditLabel.Caption = 'Total do pedido*'
          TabOrder = 3
        end
        object edtResponsavelPedido: TLabeledEdit
          Left = 12
          Top = 23
          Width = 606
          Height = 24
          EditLabel.Width = 149
          EditLabel.Height = 16
          EditLabel.Caption = 'Responsavel pelo pedido*'
          TabOrder = 4
        end
        object edtEnderecoEntrega: TLabeledEdit
          Left = 14
          Top = 222
          Width = 607
          Height = 24
          EditLabel.Width = 127
          EditLabel.Height = 16
          EditLabel.Caption = 'Endere'#231'o de entrega*'
          TabOrder = 5
        end
        object ComboBox2: TComboBox
          Left = 14
          Top = 124
          Width = 358
          Height = 24
          TabOrder = 6
        end
        object edtNumeroEntrega: TLabeledEdit
          Left = 397
          Top = 172
          Width = 224
          Height = 24
          EditLabel.Width = 119
          EditLabel.Height = 16
          EditLabel.Caption = 'N'#250'mero da entrega*'
          TabOrder = 7
        end
        object mObservacao: TMemo
          Left = 13
          Top = 282
          Width = 357
          Height = 119
          Lines.Strings = (
            'Memo1')
          TabOrder = 8
        end
        object cbBairro: TComboBox
          Left = 13
          Top = 172
          Width = 358
          Height = 24
          TabOrder = 9
        end
        object edtComplemento: TLabeledEdit
          Left = 395
          Top = 282
          Width = 226
          Height = 24
          EditLabel.Width = 85
          EditLabel.Height = 16
          EditLabel.Caption = 'Complementos'
          TabOrder = 10
        end
      end
      object tsItensPedido: TTabSheet
        Caption = 'Itens Pedido'
        ImageIndex = 1
        object Label7: TLabel
          Left = 14
          Top = 13
          Width = 52
          Height = 16
          Caption = 'Produto*'
        end
        object Label8: TLabel
          Left = 367
          Top = 61
          Width = 73
          Height = 16
          Caption = 'Observa'#231#245'es'
        end
        object Label9: TLabel
          Left = 13
          Top = 61
          Width = 47
          Height = 16
          Caption = 'Sabores'
        end
        object cbProduto: TComboBox
          Left = 13
          Top = 35
          Width = 324
          Height = 24
          TabOrder = 0
        end
        object edtQuantidade: TLabeledEdit
          Left = 367
          Top = 31
          Width = 145
          Height = 24
          EditLabel.Width = 73
          EditLabel.Height = 16
          EditLabel.Caption = 'Quantidade*'
          TabOrder = 1
        end
        object edtValor: TLabeledEdit
          Left = 568
          Top = 35
          Width = 122
          Height = 24
          EditLabel.Width = 30
          EditLabel.Height = 16
          EditLabel.Caption = 'Valor'
          TabOrder = 2
        end
        object mObservacaoItensPedido: TMemo
          Left = 367
          Top = 83
          Width = 323
          Height = 110
          Lines.Strings = (
            'Memo1')
          TabOrder = 3
        end
        object CheckListBox1: TCheckListBox
          Left = 13
          Top = 83
          Width = 348
          Height = 110
          Columns = 2
          TabOrder = 4
        end
        object btnSalvarItens: TButton
          Left = 14
          Top = 208
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 5
        end
        object btnEditarItens: TButton
          Left = 104
          Top = 208
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 6
        end
        object btnExcluiItens: TButton
          Left = 196
          Top = 208
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 7
        end
        object dbItensListagem: TDBGrid
          Left = 13
          Top = 239
          Width = 676
          Height = 207
          DataSource = DataSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'produto'
              Visible = True
            end>
        end
      end
    end
  end
  object fdMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 758
    Top = 293
    object fdMemTableproduto: TStringField
      FieldName = 'produto'
    end
  end
  object DataSource: TDataSource
    DataSet = fdMemTable
    Left = 750
    Top = 240
  end
end
