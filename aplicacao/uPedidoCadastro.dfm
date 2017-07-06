inherited frmPedidoCadastro: TfrmPedidoCadastro
  ActiveControl = cbCliente
  Caption = 'Cadastro do pedido'
  ClientHeight = 512
  ClientWidth = 834
  Constraints.MaxHeight = 540
  Constraints.MaxWidth = 840
  Constraints.MinHeight = 540
  Constraints.MinWidth = 840
  ExplicitWidth = 840
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 16
  object SpeedButton1: TSpeedButton [0]
    Left = 408
    Top = 256
    Width = 23
    Height = 22
  end
  inherited StatusBar1: TStatusBar
    Top = 493
    Width = 834
    Panels = <
      item
        Text = ' * Campos obrigat'#243'rios.'
        Width = 50
      end>
    ExplicitTop = 493
    ExplicitWidth = 834
  end
  inherited Panel1: TPanel
    Left = 731
    Height = 493
    ExplicitLeft = 731
    ExplicitHeight = 493
  end
  inherited panelCadastro: TPanel
    Width = 731
    Height = 493
    BevelInner = bvNone
    BevelOuter = bvNone
    ExplicitWidth = 731
    ExplicitHeight = 493
    object TLabel
      Left = 33
      Top = 10
      Width = 4
      Height = 16
    end
    object PageControlPedido: TPageControl
      Left = 0
      Top = 0
      Width = 731
      Height = 493
      ActivePage = tsPedido
      Align = alClient
      TabOrder = 0
      object tsPedido: TTabSheet
        Caption = '   &Pedido    '
        DoubleBuffered = False
        ImageIndex = 1
        ParentDoubleBuffered = False
        object xx: TLabel
          Left = 416
          Top = 247
          Width = 133
          Height = 16
          Caption = 'Observa'#231#245'es do pedido'
        end
        object GroupBox1: TGroupBox
          Left = 15
          Top = 156
          Width = 376
          Height = 280
          Caption = '  Endere'#231'o de Entrega  '
          TabOrder = 1
          object Label3: TLabel
            Left = 18
            Top = 25
            Width = 46
            Height = 16
            Caption = 'Estado*'
          end
          object Label4: TLabel
            Left = 18
            Top = 72
            Width = 61
            Height = 16
            Caption = 'Munic'#237'pio*'
          end
          object Label5: TLabel
            Left = 18
            Top = 118
            Width = 42
            Height = 16
            Caption = 'Bairro*'
          end
          object cbEstado: TComboBox
            Left = 18
            Top = 44
            Width = 340
            Height = 22
            Style = csOwnerDrawFixed
            Sorted = True
            TabOrder = 0
          end
          object cbMunicipio: TComboBox
            Left = 18
            Top = 91
            Width = 340
            Height = 22
            Style = csOwnerDrawFixed
            Sorted = True
            TabOrder = 1
          end
          object cbBairro: TComboBox
            Left = 18
            Top = 136
            Width = 340
            Height = 22
            Style = csOwnerDrawFixed
            Sorted = True
            TabOrder = 2
          end
          object edtEnderecoEntrega: TLabeledEdit
            Left = 18
            Top = 181
            Width = 340
            Height = 24
            EditLabel.Width = 30
            EditLabel.Height = 16
            EditLabel.Caption = 'Rua*'
            TabOrder = 3
          end
          object edtNumeroEntrega: TLabeledEdit
            Left = 18
            Top = 229
            Width = 155
            Height = 24
            EditLabel.Width = 45
            EditLabel.Height = 16
            EditLabel.Caption = 'N'#250'mero'
            TabOrder = 4
          end
          object edtComplemento: TLabeledEdit
            Left = 203
            Top = 229
            Width = 155
            Height = 24
            EditLabel.Width = 79
            EditLabel.Height = 16
            EditLabel.Caption = 'Complemento'
            TabOrder = 5
          end
        end
        object GroupBox2: TGroupBox
          Left = 15
          Top = 13
          Width = 376
          Height = 134
          Caption = '  Cliente  '
          TabOrder = 0
          object Label10: TLabel
            Left = 18
            Top = 23
            Width = 33
            Height = 16
            Caption = 'Nome'
          end
          object edtResponsavelPedido: TLabeledEdit
            Left = 18
            Top = 89
            Width = 340
            Height = 24
            EditLabel.Width = 149
            EditLabel.Height = 16
            EditLabel.Caption = 'Responsavel pelo pedido*'
            TabOrder = 1
          end
          object cbCliente: TComboBox
            Left = 18
            Top = 41
            Width = 340
            Height = 22
            Style = csOwnerDrawFixed
            Sorted = True
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 416
          Top = 13
          Width = 276
          Height = 220
          Caption = '  Informa'#231#245'es pedido  '
          TabOrder = 2
          object Label6: TLabel
            Left = 20
            Top = 23
            Width = 86
            Height = 16
            Caption = 'Data do pedido'
          end
          object Label1: TLabel
            Left = 20
            Top = 71
            Width = 100
            Height = 16
            Caption = 'Data da entrega*'
          end
          object Label2: TLabel
            Left = 147
            Top = 71
            Width = 101
            Height = 16
            Caption = 'Hora da entrega*'
          end
          object dtDataEntrega: TDateTimePicker
            Left = 20
            Top = 89
            Width = 110
            Height = 24
            Date = 42907.912222222220000000
            Time = 42907.912222222220000000
            TabOrder = 0
          end
          object dtDataPedido: TDateTimePicker
            Left = 20
            Top = 41
            Width = 157
            Height = 24
            Date = 42907.912224652770000000
            Time = 42907.912224652770000000
            Color = clBtnFace
            Enabled = False
            TabOrder = 1
          end
          object dtHoraEntrega: TDateTimePicker
            Left = 147
            Top = 89
            Width = 110
            Height = 24
            Date = 42907.912222222220000000
            Time = 42907.912222222220000000
            Kind = dtkTime
            TabOrder = 2
          end
          object edtTotalPedido: TLabeledEdit
            Left = 20
            Top = 149
            Width = 237
            Height = 56
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            EditLabel.Width = 89
            EditLabel.Height = 16
            EditLabel.Caption = 'Total do pedido'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -40
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object mObservacao: TMemo
          Left = 416
          Top = 266
          Width = 276
          Height = 170
          TabOrder = 3
        end
      end
      object tsItensPedido: TTabSheet
        Caption = 'Itens Pedido'
        object GroupBox4: TGroupBox
          Left = 12
          Top = 13
          Width = 680
          Height = 427
          Caption = '  Produto  '
          TabOrder = 0
          object Label7: TLabel
            Left = 18
            Top = 22
            Width = 63
            Height = 16
            Caption = 'Descri'#231#227'o*'
          end
          object Label8: TLabel
            Left = 314
            Top = 75
            Width = 73
            Height = 16
            Caption = 'Observa'#231#245'es'
          end
          object btnNovoItens: TSpeedButton
            Left = 578
            Top = 31
            Width = 90
            Height = 45
            Cursor = crHandPoint
            Caption = 'Novo'
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FDFCFCEDECECEFEDEDEFEDEDEFEDEDEFEDEDEFEDEDEFEDEDEFEDEDEFEDEDEDEC
              ECFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBECECECEDEDEDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDECECECFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
              D4DCDCCDDCDCCEDDDDCEDDDDCEDDDDCEDDDDCEDDDDCEDDDDCEDDDDCEDDDDCDDC
              DCD4DCDCFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBF7F7F7F6F6F6F6F6F6F6F6F6F6
              F6F6F6F6F6F6F6F6F6F6F6F6F6F6F7F7F7EBEBEBFFFFFFFFFFFFFFFFFFFFFFFF
              CEDBDDD0E0E0D0E0E0D0E0E0D0E0E0D0E0E0D0E0E0D0E0E0D0E0E0D0E0E0D0E0
              E0CEDBDDFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F9F9F9F9F9F9F9F9F9F9F9F9F9
              F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF
              CEDCDDD0E0DFD3E2E2D4E3E3D4E3E3D4E3E3D4E3E3D4E3E3D4E3E3D3E2E2D0E0
              DFCEDCDDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F9F9F9FBFBFBFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFBFBFBF9F9F9F4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD2E2E1BCCBCBB0BDBDB1BEBEB1BEBEB1BEBEB1BEBEB0BDBDBCCACAD2E2
              E2CFDCDDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FBFBFBE4E4E4D8D8D8D9D9D9D9
              D9D9D9D9D9D9D9D9D8D8D8E4E4E4FBFBFBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD1E0E0CFDEDECEDDDDCFDDDDCFDDDDCFDDDDCFDDDDCEDDDDCFDEDED1E0
              E0CFDCDDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F9F9F9F7F7F7F6F6F6F7F7F7F7
              F7F7F7F7F7F7F7F7F6F6F6F7F7F7F9F9F9F4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD2E1E1C3D2D2BBC7C7BCC8C8BCC8C8BCC8C8BCC8C8BBC7C7C3D1D1D2E1
              E1CFDCDDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FAFAFAEBEBEBE2E2E2E3E3E3E3
              E3E3E3E3E3E3E3E3E2E2E2EBEBEBFAFAFAF4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD1E1E0C9D7D7C4D2D2C5D2D3C5D2D3C5D2D3C5D2D3C4D2D2C9D7D7D1E1
              E0CFDCDDFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FAFAFAF1F1F1ECECECEDEDEDED
              EDEDEDEDEDEDEDEDECECECF1F1F1FAFAFAF4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD1E1E0C9D7D7C4D2D2C5D2D3C5D2D3C5D2D3C5D2D3C4D2D2C9D7D7D2E2
              E2CBD8D9FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FAFAFAF1F1F1ECECECEDEDEDED
              EDEDEDEDEDEDEDEDECECECF1F1F1FBFBFBF0F0F0FFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD2E1E1C3D2D2BBC7C7BCC8C8BCC8C8BCC8C8BCC8C8BBC8C8C4D2D2CBDB
              DBC9D4D4FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FAFAFAEBEBEBE2E2E2E3E3E3E3
              E3E3E3E3E3E3E3E3E2E2E2ECECECF4F4F4EDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD1E0E0CFDEDECEDDDDCFDDDDCEDDDDCBDADACAD9D9C7D7D7C2D1D1C4D4
              D4C6D4D4FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F9F9F9F7F7F7F6F6F6F7F7F7F6
              F6F6F3F3F3F3F3F3F2F2F2EDEDEDF0F0F0EDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD2E2E1BCCBCBB0BDBDB1BDBDB4C1C1D3E3E3D9E5E5F4F4F4F3F4F4F2F3
              F3F5F7F7FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FBFBFBE4E4E4D8D8D8D8D8D8DC
              DCDCFCFCFCFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CFDCDDD0E0DFD3E2E2D4E3E3D4E3E3D3E2E2CEDEDEE6EDEDF7F6F6F4F4F4F9F8
              F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F9F9F9FBFBFBFCFCFCFCFCFCFB
              FBFBF8F8F8FDFDFDFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CEDBDDD0E0DFD1E0E0D1E0E0D1E0E0D1E0E0CEDEDEE5ECECF6F5F5F8F8F8FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F9F9F9F9F9F9F9F9F9F9F9F9F9
              F9F9F8F8F8FDFDFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              D0DFDFCDDDDDCEDEDECEDEDECEDEDECEDEDECCDCDCE3EAEAFAF9F9FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F8F8F8F8F8F8F8F8F8F8F8F8F8
              F8F8F8F8F8FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F5F8F8E5EDEDE6EEEEE6EEEEE6EEEEE6EEEEE5EDEDF3F5F5FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFB
              FBFBFAFAFAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
          end
          object btnSalvarItens: TSpeedButton
            Left = 578
            Top = 77
            Width = 90
            Height = 45
            Cursor = crHandPoint
            Caption = 'Salvar'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CEA76AB56A00C9C2B8C7BAA7C7BAA7C7BAA7C7BAA7C7BAA7C7BAA7C9C2B8B56A
              00CDA76EFFFFFFFFFFFFFFFFFFFFFFFFCF8310DB8F1EF7FFFFF7F7F5F8F8F6F8
              F8F6F8F8F6F8F8F6F7F7F5F7FFFFDB8F1ED08210FFFFFFFFFFFFFFFFFFFFFFFF
              D78B1AD88D1DF6FDFFDBD8D3D0CCC7D1CDC8D1CDC8D0CCC7DBD8D3F6FDFFD88D
              1DD78B1AFFFFFFFFFFFFFFFFFFFFFFFFD68B1AD88D1DF6FEFFDBD8D3D0CDC7D2
              CEC8D2CEC8D0CDC7DCD8D3F6FFFFD88D1DD68B1AFFFFFFFFFFFFFFFFFFFFFFFF
              D68B1AD88E20F2F3F1F5FBFFF6FBFFF6FBFFF6FBFFF6FBFFF5FBFFF2F2F1D88E
              20D68B1AFFFFFFFFFFFFFFFFFFFFFFFFD68B1ADA9631DB9734E2B36FE1B16AE1
              B16AE1B16AE1B16AE2B36FDB9732DA9631D68B1AFFFFFFFFFFFFFFFFFFFFFFFF
              D68B1ADB9834DA9631DA942CDA942CDA942CDA942CDA942CDA942CDA9631DB98
              34D68B1AFFFFFFFFFFFFFFFFFFFFFFFFD68B1ADB9834DD9934DD9830DC962DDC
              962DDC962DDC962DDD9830DD9934DB9834D68B1AFFFFFFFFFFFFFFFFFFFFFFFF
              D68B1ADD9934C18223BD8D43CCA569CAA265C49D5FC59F62BA893FC18224DD99
              34D68B1AFFFFFFFFFFFFFFFFFFFFFFFFD68B1ADD9830BE8E45E0EAF2BDC0BAC6
              CAC5FAFEFFF5F9FCFBFFFFBA893FDD9830D4840DFFFFFFFFFFFFFFFFFFFFFFFF
              D58612DC962CCCA66CBBBFB89B9B89949480FAF9F6F1F0ECF5F9FCC69F62D889
              14EDCB99FFFFFFFFFFFFFFFFFFFFFFFFE6B873D7840BC29753D1D2D2BEBAB2BA
              B6AEF4F4F0EFEEE9F3F7FABC8B3FEEC992FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object btnEditarItens: TSpeedButton
            Left = 578
            Top = 123
            Width = 90
            Height = 45
            Cursor = crHandPoint
            Caption = 'Editar'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FFFFFFF5F4F4
              F4F3F4F4F3F4F4F3F4F4F3F4F4F3F4F4F3F4F4F3F3F9F8F8FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDCAD4D4
              CDD7D6CED8D8CFD9D9CED8D8CED7D7CDD7D6CDD7D7C9D1D2FBFAFAFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFEEEEEEE4E4E4E6E6E6E7E7E7E8E8E8E7E7E7E6E6E6E6
              E6E6E6E6E6E0E0E0FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF2F2CEDEDE
              D2E2E2C8D7D9BFD0D1C1D1D2CDDDDDD3E3E3D3E3E3CDDEDEEFF2F3FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAF4F4F4F7F7F7EEEEEEE5E5E5E8E8E8F3F3F3F8
              F8F8F7F7F7F5F5F5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF2F2CEDEDE
              CFDFE098928B827166EAEEF0CAD0D1B9C1C1C1CAC3D3E3E2F0F4F3FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAF3F3F3F4F4F4ADADAD949494F9F9F9E0E0E0DC
              DCDCDFDFDFF8F8F8F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF2F2CEDEDE
              CFDFDFC0C9C8FFFFFFFFFFFFFFFFFFFFFFFF5591D9BCC8C4F7F9F8FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAF3F3F3F2F2F2E2E2E2FFFFFFFFFFFFFFFFFFFF
              FFFFB5B5B5DEDEDEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF2F2CEDDDD
              B8C5C5BAC9C9FFFFFFFFFFFDAEDEF7B4E1F7558FDB5692DADCDCD7FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAF3F3F3DADADAE0E0E0FFFFFFFFFFFFEAEAEAF0
              F0F0B4B4B4B6B6B6E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF2F2CEDDDD
              C2D0D0BDCCCCFCFBF9FFFFFF73C7F382CEF58BCEF05B93DB5B94DCEBE7E2FFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAF3F3F3E5E5E5E3E3E3FFFFFFFFFFFFD3D3D3D8
              D8D8DADADAB7B7B7B7B7B7E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFEBF2F2CEDEDE
              C7D5D5C7D5D4D1E0ED8FB6E888CEF187D0F687D1F68ACEF05A92DB5993DBEBE7
              E2FFFFFFFFFFFFFFFFFFFAFAFAF3F3F3E9E9E9E9E9E9F5F5F5DADADAD9D9D9DA
              DADADBDBDBDADADAB7B7B7B5B5B5E7E7E7FFFFFFFFFFFFFFFFFFEBF2F2CEDDDD
              B3C0C0B7C3C2B0BEC0518FD95D96DC8BCFEF87D0F687D0F68DD0F25D94DC5993
              DBEBE7E2FFFFFFFFFFFFFAFAFAF3F3F3D6D6D6D9D9D9D5D5D5B2B2B2B9B9B9D9
              D9D9DADADADBDBDBDADADAB8B8B8B5B5B5E7E7E7FFFFFFFFFFFFEAF2F2CEDEDE
              D5E4E4D5E4E4D8E6E4DBE7E2609CE35E96DC8DD2F287D0F687D0F68DD0F25C93
              DC5492DBE4E4E3FFFFFFFAFAFAF3F3F3F8F8F8F8F8F8F9F9F9FAFAFABEBEBEB9
              B9B9DCDCDCDADADADBDBDBDADADAB8B8B8B6B6B6E5E5E5FFFFFFEBF2F2CDDDDD
              B0BCBDB3BFC0B3BFC0B5C0BFBCC5C15C95DE5C94DB8DD2F287D0F688D1F685CE
              F5587CD65854C0ECECE7FEFEFDF2F2F2D3D3D3D6D6D6D6D6D6D7D7D7DBDBDBBA
              BABAB7B7B7DCDCDCDADADADBDBDBD9D9D9B4B4B4A8A8A8EDEDEDEAF2F2CEDEDE
              D7E6E6D7E6E6D7E6E6D5E4E4D6E4E2D9E5E05E99E05D96DC8DD1F38BDBFA79A9
              E65950C25454C56C6CC8FFFFFFF3F3F3FAFAFAFAFAFAFAFAFAF8F8F8F7F7F7F8
              F8F8BBBBBBB9B9B9DBDBDBDFDFDFCCCCCCA9A9A9A9A9A9BABABAEBF2F2CEDDDD
              B0BBBDB3BEC0B1BCBEC7D5D5D2E1E1D3E1E0D9E5E05E9ADF5896E077A4E4564C
              C15B5BC64848C0ABABE3FFFFFDF3F3F3D3D3D3D6D6D6D4D4D4EAEAEAF5F5F5F5
              F5F5F8F8F8BBBBBBB9B9B9C9C9C9A7A7A7ACACACA3A3A3DADADAEAF1F1CEDEDE
              D4E3E3D4E3E3D4E3E3D2E1E1D1E0E0D1E0E0D4E2E0D4E2E0577AD5534BC15B5B
              C64949C0A3A3DFFFFFFFFAFAFAF3F3F3F7F7F7F7F7F7F7F7F7F5F5F5F4F4F4F4
              F4F4F5F5F5F6F6F6B2B2B2A7A7A7ACACACA3A3A3D0D0D0FFFFFFEDF2F2C9DADA
              CDDDDDCDDDDDCDDDDDCDDDDDCDDDDDCDDDDDCDDDDDCCDDDAFFFFFD5E5EC73F3F
              BDA3A3DFFFFFFFFFFFFFFAFAFAF2F2F2F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3FFFFFFADADAD9E9E9ED0D0D0FFFFFFFFFFFFFFFFFFF4F8F8
              F4F8F8F4F8F8F4F8F8F4F8F8F4F8F8F4F8F8F3F7F7F9FAFAFFFFFFFFFFFFDFDF
              F3FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFDFDFDFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
          end
          object btnExcluiItens: TSpeedButton
            Left = 578
            Top = 169
            Width = 90
            Height = 45
            Cursor = crHandPoint
            Caption = 'Excluir'
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFCDCCCAA9A5A2AAA7A4AAA7A4AAA7A4AAA7A4AAA7A4AAA7A4A8A5A2CDCB
              CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDBB2B2B3B4B3B5B4B3B5B4
              B3B5B4B3B5B4B3B5B4B3B5B2B2B3DCDCDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F0F0F03D36314B423C4E453F4E453E4E453E4E453E4E453E4E453F4C433D473E
              38F1F0F0FFFFFFFFFFFFFFFFFFFFFFFFF7F7F76260616464656A686A69686969
              686A69686A69686969686A6766676F6D6DF9F8F8FFFFFFFFFFFFFFFFFFFFFFFF
              F5F5F4938F8CABA8A3A9A6A2AAA7A3A9A6A2A9A6A2AAA7A3A9A6A2AAA6A2A09C
              98F7F7F6FFFFFFFFFFFFFFFFFFFFFFFFFBFBFADCD9D5EEEBE9ECE9E6EDEBE8EC
              E9E7ECE9E7EDEBE8ECE9E6ECEAE7E9E6E4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
              F8F8F89A96919E9C9896948FAFACA89A97939A9793AFACA896948F9D9B97A4A1
              9CFAFBFAFFFFFFFFFFFFFFFFFFFFFFFFFBFBFCE0DDDBDCDAD8D4D1D0EFEDEBD8
              D5D3D8D5D3EFEDEBD4D1D0DBD9D7EAE8E6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
              C5C1BFA09E98979390999793AEABA7989591989591AEABA799979396928FA8A5
              A1D0CAC9FFFFFFFFFFFFFFFFFFFFFFFFEAE9E7E3E1DFD4D2CFD8D5D4EEECEAD5
              D3D1D5D3D1EEECEAD8D5D4D4D1CFEBE8E6F3F3F2FFFFFFFFFFFFFFFFFFFFFFFF
              B7B5B2A5A29E918E8A9F9D98AEABA7999692999692AEABA79F9D98908D89AAA6
              A2C3C1BFFFFFFFFFFFFFFFFFFFFFFFFFE3E1E0E7E5E3CDCAC8DEDCDAEDEBE9D5
              D3D1D5D3D1EDEBE9DEDCDACDCAC8ECEAE8EFEEEDFFFFFFFFFFFFFFFFFFFFFFFF
              B9B8B5A6A39F8B8984A6A39FADAAA6999692999692ADAAA6A6A39F8A8884AAA6
              A2C5C4C0FFFFFFFFFFFFFFFFFFFFFFFFE5E2E2E9E7E4C6C5C2E4E2DFEDEBE9D5
              D3D1D5D3D1EDEBE9E4E2DFC6C4C2ECEAE8F0EFEEFFFFFFFFFFFFFFFFFFFFFFFF
              BFBDB9A6A29E8A8884A8A5A1ADAAA6989591989591ADAAA6A8A5A18A8784A7A4
              A0CAC8C4FFFFFFFFFFFFFFFFFFFFFFFFE6E6E3E8E5E3C7C5C2E7E5E4ECEAE8D5
              D3D1D5D3D1ECEAE8E7E5E4C6C4C2E9E7E5F2F1EEFFFFFFFFFFFFFFFFFFFAFBFA
              8C8984A9A6A28B8985AAA7A4ADAAA6989591989591ADAAA6AAA7A48B8985A8A5
              A19E9B97FBFCFBFFFFFFFFFFFFFDFDFDD5D3D0E8E5E4C8C6C4E9E7E5ECEAE8D5
              D3D1D5D3D1ECEAE8E9E7E5C8C6C4E8E6E4E7E5E2FEFDFEFFFFFFFFFFFFFFFFFF
              95928EAFACA8ACA9A5AEABA7AEABA7ACAAA6ACAAA6AEABA7AEABA7ACA9A5ADAB
              A7A4A19CFFFFFFFFFFFFFFFFFFFFFFFFDCD9D7EFEDEBECEAE8EEECEAEEECEAED
              EBE9EDEBE9EEECEAEEECEAECEAE8EEECEAEBE9E7FFFFFFFFFFFFFFFFFFA9A7A4
              817C7887837E87837F87837E87837E87837E87837E87837E87837E87837F8783
              7E817D78A9A7A4FFFFFFFFFFFFB7B7B8BFBCBAC1BEBCC1BEBCC0BEBBC0BEBBC1
              BEBCC1BEBCC0BEBBC0BEBBC1BEBCC1BEBBBFBCB9B6B6B7FFFFFFBCBDBA332A25
              4E463F4D453E4D453E4D453E4D453E4D453E4D453E4D453E4D453E4D453E4D45
              3E4D453E3C312BC1C2BEC7C7C953515465636564636564636564636564636564
              6365646365646365646365646365646365646365595759CBCBCABDBEB43D332D
              534943524842544A425A4F405349425248425248425349425A4F40544A415248
              42524842453A35C5C7B6C7C6CA5B5A5B6C6B6C6C6B6C6C6B6C6C6B6C6C6B6C6C
              6B6C6C6B6C6C6B6C6C6B6D6C6B6C6C6B6C6C6B6C615F61D2D1D1FFFFFF7B7671
              8D87839089827D7A87434BA19F9687A29A87A29A879E968541499C7F7B8C8F89
              828D8783807974FFFFFFFFFFFF8E8E8F9F9E9E9E9E9E9D9C9CA19E9DA2A2A3A4
              A3A4A4A4A5A2A1A29D9B99A19FA09E9D9E9E9D9E939293FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFD4DAFF2A40E44C60E34D5BE54D5CE64B5EE02A40E4D7DDFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F8D2D0CDD4D1CED5
              D2D0D5D3D0D0CECBD1CFCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFB2BBF5A6AFF2A7B1F2A7B1F2A6AFF2B2BCF5FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEDECEBEAE9EB
              EAE9EBEAE9EBEAE9EEEDECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
          end
          object cbProduto: TComboBox
            Left = 18
            Top = 41
            Width = 290
            Height = 22
            Cursor = crHandPoint
            Style = csOwnerDrawFixed
            Sorted = True
            TabOrder = 0
          end
          object edtValor: TLabeledEdit
            Left = 486
            Top = 41
            Width = 85
            Height = 24
            Color = clBtnFace
            EditLabel.Width = 61
            EditLabel.Height = 16
            EditLabel.Caption = 'Valor Final'
            Enabled = False
            TabOrder = 3
          end
          object mObservacaoItensPedido: TMemo
            Left = 317
            Top = 95
            Width = 254
            Height = 129
            TabOrder = 2
          end
          object GroupSabores: TGroupBox
            Left = 18
            Top = 68
            Width = 290
            Height = 156
            Caption = '  Sabores  '
            Enabled = False
            Padding.Left = 10
            TabOrder = 1
            object clkSabores: TCheckListBox
              Left = 12
              Top = 18
              Width = 276
              Height = 136
              Cursor = crHandPoint
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = clWhite
              Columns = 2
              Sorted = True
              TabOrder = 0
              OnClick = clkSaboresClick
            end
          end
          object dbItensListagem: TDBGrid
            Left = 17
            Top = 230
            Width = 652
            Height = 184
            Cursor = crHandPoint
            DataSource = DataSource
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'idproduto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Alignment = taCenter
                Title.Caption = 'Produto'
                Width = 357
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Alignment = taCenter
                Title.Caption = 'Quantidade'
                Width = 124
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'sabores'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'valorTotal'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Width = 127
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'observacao'
                Title.Alignment = taCenter
                Title.Caption = 'Observa'#231#227'o'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'valor'
                Visible = False
              end>
          end
          object edtValorUnitario: TLabeledEdit
            Left = 402
            Top = 41
            Width = 76
            Height = 24
            EditLabel.Width = 38
            EditLabel.Height = 16
            EditLabel.Caption = 'Valor*'
            TabOrder = 5
          end
          object edtQuantidade: TLabeledEdit
            Left = 314
            Top = 41
            Width = 79
            Height = 24
            EditLabel.Width = 73
            EditLabel.Height = 16
            EditLabel.Caption = 'Quantidade*'
            TabOrder = 6
          end
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
    Left = 782
    Top = 293
    object fdMemTableidproduto: TIntegerField
      FieldName = 'idproduto'
    end
    object fdMemTablequantidade: TFloatField
      FieldName = 'quantidade'
    end
    object fdMemTableobservacao: TStringField
      DisplayWidth = 80
      FieldName = 'observacao'
      Size = 255
    end
    object fdMemTableproduto: TStringField
      DisplayWidth = 50
      FieldName = 'produto'
      Size = 100
    end
    object fdMemTablevalorTotal: TCurrencyField
      FieldName = 'valorTotal'
    end
    object fdMemTablevalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object DataSource: TDataSource
    DataSet = fdMemTable
    Left = 782
    Top = 216
  end
end
