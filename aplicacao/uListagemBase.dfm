object frmListagemBase: TfrmListagemBase
  Left = 0
  Top = 0
  Caption = 'Listagem Base'
  ClientHeight = 477
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 417
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 51
      Width = 72
      Height = 14
      Caption = 'Pesquisar por'
    end
    object edtPesquisa: TEdit
      Left = 5
      Top = 25
      Width = 154
      Height = 22
      Cursor = crIBeam
      TabOrder = 0
      OnKeyPress = edtPesquisaKeyPress
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 181
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Op'#231#245'es de Pesquisa'
      Color = 15000804
      ParentBackground = False
      TabOrder = 1
    end
    object btnPesquisa: TBitBtn
      Left = 159
      Top = 24
      Width = 23
      Height = 23
      Cursor = crHandPoint
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA89F92968B7CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA79E9159482F59482F968B7CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA79E915948
        2F59482F59482FA89F92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA79E9159482F59482F59482FA79E91FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8BAB594A3E59482F5948
        2FA79E91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E4E0C3BBB0BEB4A8D0C9C0FB
        FAFAF6F5F3685B4D55589E594A3EA79E91FFFFFFFFFFFFFFFFFFFFFFFFF6F4F3
        9F91806A553A6B563B705C426A553A7B68509788757A6851685B4D8C8BABFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFD8C7C67746148B1A799E3E0DCF0EFECD3CDC68F
        806C6A553A978875F6F5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB4A86F5A40
        CFC9C1FFFFFFFFFFFFFFFFFFFFFFFFFBFBFA9485727B6850FBFAFAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8C7C689A8D7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE2DDD96D583ED0C9C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF735F46BBB1A6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF9816F59BEB4A8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7F6D56B5AC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9F8F77E6B54C3BBB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9180938471
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D0C96B563CE8E4E0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E6E2705C42B9B1A5FEFEFEFFFFFFFFFFFFFFFFFFF1
        EEED8878629F9180FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C1B7
        725E449B8E7CC8C2B8D6D1CAB7ADA1806E578C7C67F6F4F3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E6E29F91807F6D56735F468C7C68BD
        B4A8FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 2
      OnClick = btnPesquisaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnAjuda: TSpeedButton
      Left = 92
      Top = 2
      Width = 45
      Height = 37
      Cursor = crHandPoint
      Hint = 'Ajuda'
      Align = alLeft
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFDF6F6F6F1EDEBEFEBE9F2F2F1F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCE3D1C1CFA9
        84C5905FC38448C28143C28143C38448C6915ECBA480DAC8B8F2F1F0FEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1CBB8C68F5CC28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C58F5AD4BEAAF4
        F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F2CDA076C28143C28143C28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C28143C28143C9
        9C71E6E1DDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF6EFE9C7905CC28143C28143C28143C28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C28143C28143C2
        8143C58F5AE0D9D1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF6F2C7905CC28143C28143C28143C28143C28143C281
        43D4AB86FEFEFEFEFEFEFEFEFEDEC5ADC28143C28143C28143C28143C28143C2
        8143C28143C58E5AE6E0DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCFA177C28143C28143C28143C28143C28143C28143C281
        43D4AB86FEFEFEFEFEFEFEFEFEDEC5ADC28143C28143C28143C28143C28143C2
        8143C28143C28143C99B70F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE8D2BFC28143C28143C28143C28143C28143C28143C28143C281
        43D3AB84FEFEFEFEFEFEFEFEFEDEC4ACC28143C28143C28143C28143C28143C2
        8143C28143C28143C28143D2BDA8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEC9925EC28143C28143C28143C28143C28143C28143C28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C28143C28143C2
        8143C28143C28143C28143C58F5BEFEEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEFDECEC28143C28143C28143C28143C28143C28143C28143C28143C281
        43C38346C68B52C68B52C68B52C48448C28143C28143C28143C28143C28143C2
        8143C28143C28143C28143C28143D7C7B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD7B18DC28143C28143C28143C28143C28143C28143C28143C28143C281
        43D0A47AFEFEFEFEFEFEFEFEFEDFC7B0C28143C28143C28143C28143C28143C2
        8143C28143C28143C28143C28143CAA37FFCFCFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCA9562C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C78D55FEFEFEFEFEFEFEFEFEEDE3DBC28143C28143C28143C28143C28143C2
        8143C28143C28143C28143C28143C6905DF3F3F2FFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEC48549C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C28143EBDFD5FEFEFEFEFEFEFEFEFEE2CDB9C28143C28143C28143C28143C2
        8143C28143C28143C28143C28143C38448EDEDECFFFFFFFFFFFFFFFFFFFFFFFF
        FCFAF7C28143C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C28143C48549EEE5DCFEFEFEFEFEFEFEFEFEEEE6DEC48549C28143C28143C2
        8143C28143C28143C28143C28143C28143EAE6E4FFFFFFFFFFFFFFFFFFFFFFFF
        FCFAF7C28143C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C28143C28143C28143E5D4C4FEFEFEFEFEFEFEFEFEECE1D8C28143C28143C2
        8143C28143C28143C28143C28143C28143EBE7E6FFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEC48549C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C28143C28143C28143C28143E9DCD0FEFEFEFEFEFEFEFEFED5B08DC28143C2
        8143C28143C28143C28143C28143C38448F0F0EFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCB9663C28143C28143C28143C28143C28143C28143C28143C28143C281
        43C28143C28143C28143C28143C68B52FDFDFCFEFEFEFEFEFEEDE3DAC28143C2
        8143C28143C28143C28143C28143C6905DF8F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDAB38FC28143C28143C28143C28143C28143C28143CB9766CD9D6FCD9D
        6FCA9563C28143C28143C28143C28143F7F5F3FEFEFEFEFEFEF4EFEBC28143C2
        8143C28143C28143C28143C28143CCA681FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEFDECEC28143C28143C28143C28143C28143C28143F3EFEAFEFEFEFEFE
        FEF7F5F3C28143C28143C28143C5864CFCFBFBFEFEFEFEFEFEF0E9E3C28143C2
        8143C28143C28143C28143C28143DECCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFDCA9460C28143C28143C28143C28143C28143E9DCD0FEFEFEFEFE
        FEFEFEFEE8D9CBCB9766CE9E70EDE4DCFEFEFEFEFEFEFEFEFEE2CCB9C28143C2
        8143C28143C28143C28143C68F5BF9F9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEBD5C1C28143C28143C28143C28143C28143CD9C6DFDFDFCFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F7F6C68A51C28143C2
        8143C28143C28143C28143DBC6B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD3A67CC28143C28143C28143C28143C28143D4AD88F9F8
        F7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF5F2EECC9A6AC28143C28143C2
        8143C28143C28143CA9D72FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF6F2CA945FC28143C28143C28143C28143C28143C586
        4ADABB9EE8DACEEEE5DCEDE4DCE7D7C9D6B391C28143C28143C28143C28143C2
        8143C28143C68F5AF6F0ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF8F1EBCB9460C28143C28143C28143C28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C28143C28143C2
        8143C6905BF3EBE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3D3A87EC28143C28143C28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C28143C28143CD
        A076F8F4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBD6C4C9935FC28143C281
        43C28143C28143C28143C28143C28143C28143C28143C28143C7915DE5CFBBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDEFDECED9B3
        8FCA9563C48548C28143C28143C28448C99462D4AF8BECDACAFEFEFDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEFCFAF7FCFAF7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 98
      ExplicitTop = -2
    end
    object btnEditar: TSpeedButton
      Left = 47
      Top = 2
      Width = 45
      Height = 37
      Cursor = crHandPoint
      Hint = 'Editar'
      Align = alLeft
      Flat = True
      Glyph.Data = {
        B60C0000424DB60C000000000000360000002800000021000000200000000100
        180000000000800C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFFCFCFCE9E8E9E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3
        E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E3E3E4E5E5E5F3F3F3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFDFDFDFD2D4D4D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5
        D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D2D5D5D3D3D4F6F6
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFD2D8D9D0DFDFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D2
        DEDEE9EAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0C6
        D4D4CDDCDCD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0DFE5E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1DFDFB0BBBCAEBABAB1BDBEB8C5C6BFCDCDC6D4D4CDDCDCD1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0DEE6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0CCDA
        DACCDADACBD8D87763567F7065918A83C9CFD0BAC3C4ACB7B8AAB5B6ADB8B9B4
        C0C0BCC9C9CEDDDDD1E0E0D1E0E0DEE6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1
        E0E0CCDBDBCCDBDBCCDBDB83746A7A665AE6E7E6FFFFFFFFFFFFFDFDFDEDF0F0
        DCE1E1CBD2D2B6C1C2B7C4C4D1E0E0D1E0E0DEE6E6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0
        D1E0E0D1E0E0D1E0E0D1E0E0D1E0E09D9891E7E7E6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF9FAFB87B0E08FADC9BAC7C7D1E0E0DEE6E6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFD1E0E0D1E0E0CFDEDEC8D7D7C8D7D7C8D7D7D9E2E2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFDAE7F65E99E05E99E090AEC9BAC7C7DDE5E5FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFD1E0E0D1E0E0CAD8D8AEBABAAEBABAAEBABABDC7C7FFFFFFFFFFFF
        FFFFFFFCFCFCE9F5FAE9F6FEE9F6FEC9DCEF5E99E05E99E05E99E090AEC9C4CB
        CBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0CDDCDCCDDCDCCDDCDCCEDDDDFDFD
        FDFFFFFFFFFFFFEBF6FB87CFF587CFF587CFF587CFF579ABDB5E99E05E99E05E
        99E096B0CCE1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0F1F4F4FFFFFFFFFFFFE9F7FE87CFF587CFF587CFF587CFF587CFF57AACDB
        5E99E05E99E05F99E0A6BDD8E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0CCDADAB6C3C3B6C3C3
        B6C3C3B6C3C3DDE2E2FFFFFFFFFFFFE9F7FE87CFF587CFF587CFF587CFF587CF
        F587CFF57AACDB5E99E05E99E05F99DFA6BDD8E1E1E1FEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0CDDCDCBCC9
        C9BCC9C9BCC9C9BCC9C9D5DDDDF8F9FADAE7F5CEE2F287CFF587CFF587CFF587
        CFF587CFF587CFF587CFF57AACDB5E99E05E99E05F99DFA6BDD8E1E1E1FEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D1E0E0D6E4E58BB5E55E99E05E99E084B9E187CFF5
        87CFF587CFF587CFF587CFF587CFF587CFF57CADDC5E99E05E99E05F99DFA6BD
        D8E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD1E0E0
        D1E0E0CFDEDEC7D5D5C7D5D5C7D5D5C7D5D5C7D5D59FBEDA5F9AE05E99E05E99
        E081B7DE87CFF587CFF587CFF587CFF587CFF587CFF587CFF583B2E05E99E05E
        99E05F99DFA6BDD8E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFD1E0E0D1E0E0CAD8D8AEBABAAEBABAAEBABAAEBABAAEBABAAEBABA90AEC95E
        99E05E99E05E99E07DB1D987CFF587CFF587CFF587CFF587CFF587CFF587CFF5
        83B2E05E99E05E99E05F99DFA6BDD8E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFD1E0E0D1E0E0D1E0E0CFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDD
        CFDDDDA4C3DF5F9AE05E99E05E99E083B8E087CFF587CFF587CFF587CFF587CF
        F587CFF587CFF583B2E05E99E05E99E05E99E098AFD6E1E1E1FEFEFEFFFFFFFF
        FFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0A6C6E05F9AE05E99E05E99E083B9E187CFF587CFF587
        CFF587CFF587CFF587CFF587CFF57BAADF5E99E05E99E05E99E092A2D4E1E1E1
        FEFEFEFFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0CBDADAB4C0C1B4C0C1B4C0C1B4
        C0C1B4C0C1B4C0C1B4C0C1B4C0C1B4C0C194B2CD5F99E05E99E05E99E07FB5DD
        87CFF587CFF587CFF587CFF587CFF587CFF587CFF56594DE5E99E05D86D95D5E
        C8A4A4CEE1E1E1FFFFFFFFFFFF00FFFFFFD1E0E0D1E0E0CDDCDCBECBCCBECBCC
        BECBCCBECBCCBECBCCBECBCCBECBCCBECBCCBECBCCBECBCC9AB9D45F99E05E99
        E05E99E083B9E187CFF587CFF587CFF587CFF587CFF587CFF587CFF56589DA5C
        5DC85C5CC75D5DC6A4A4CEEBEBEBFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0A6
        C6E05F9AE05E99E05E99E083B9E187CFF587CFF587CFF587CFF587CFF57AACE7
        5D5FC85C5CC75C5CC75C5CC75D5DC6C1C1DDFFFFFF00FFFFFFD1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0A6C6E05F9AE05E99E05E99E081B5E387CFF587CFF587CFF57AAC
        E75D5FC85C5CC75C5CC75C5CC75C5CC75C5CC79D9DDBFFFFFF00FFFFFFD1E0E0
        D1E0E0CCDBDBBAC7C8BAC7C8BAC7C8BAC7C8BAC7C8BAC7C8C1CECFD1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0A6C6E05F9AE05E99E05E99E06FA2E487CFF57A
        ACE75D5FC85C5CC75C5CC75C5CC75C5CC75C5CC75C5CC7C2C2EAFFFFFF00FFFF
        FFD1E0E0D1E0E0CCDADAB8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5BFCCCCD1
        E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0A6C6E05E99E05E99E05E99E0
        6A90DD5D5FC85C5CC75C5CC75C5CC75C5CC75C5CC75C5CC7A0A0DEFEFEFEFFFF
        FF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E098B6DE5E99
        E05D86D85C5DC85C5CC75C5CC75C5CC75C5CC75C5CC75C5CC7A0A0DEFEFEFEFF
        FFFFFFFFFF00FFFFFFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E09EAFE05D5EC95C5CC75C5CC75C5CC75C5CC75C5CC75C5CC7A0A0DEFEFEFE
        FFFFFFFFFFFFFFFFFF00FFFFFFD2E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0EAF0F0C1C1E95D5DC75C5CC75C5CC75C5CC75C5CC7A0A0DEFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFDEE8E8D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D2E0E0F5F8F8FFFFFFC1C1E95D5DC75C5CC75C5CC7A0A0DEFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFCFDFDE8EFEFE2ECECE2EC
        ECE2ECECE2ECECE2ECECE2ECECE2ECECE2ECECE2ECECE2ECECE2ECECE2ECECE2
        ECECE2ECECE2ECECE4ECECF3F6F6FFFFFFFFFFFFFFFFFFD4D4F0A0A0DEC2C2EA
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 42
    end
    object btnNovo: TSpeedButton
      Left = 2
      Top = 2
      Width = 45
      Height = 37
      Cursor = crHandPoint
      Hint = 'Inserir'
      Align = alLeft
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEE6E6E6D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9E6E6E6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEBEBEBD2DADAD1DDDDD2DEDED2DEDED2DEDED2DEDED2DEDED2DE
        DED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2
        DEDED2DEDED1DDDDD2DADAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDBE1E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0DBE1E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD8E0E1D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D8E0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC8
        D6D6D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CDDCDCC1CFCFC1CFCFC1CFCFC1CF
        CFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFCD
        DCDCD1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CEDDDDC5D3D3C5D3D3C5D3D3C5D3
        D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3CE
        DDDDD1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC8
        D6D6D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0CFDDDDCFDDDDCFDDDDCFDD
        DDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDD1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CAD9D9B8C4C5B8C4C5B8C4C5B8C4
        C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5CA
        D9D9D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CAD9D9B8C4C5B8C4C5B8C4C5B8C4
        C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5CA
        D9D9D1E0E0D1E0E0D1E0E0D4DDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0CBDADAD3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0CFDDDDCFDDDDCFDDDDCFDD
        DDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDD1
        E0E0D0DFDFCAD9D9CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC6
        D4D4CAD9D9CAD8D8CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CEDDDDC5D3D3C5D3D3C5D3D3C5D3
        D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C2D0D0C7
        D6D6CAD8D8CAD8D8CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0CDDCDCCAD8D8CA
        D8D8CAD8D8CAD8D8CAD8D8D7E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CDDCDCC1CFCFC1CFCFC1CFCFC1CF
        CFC1CFCFC1CFCFC6D4D4D1E0E0D1E0E0D1E0E0D3E1E1E4EBEBE9EDEDE8EEEEEA
        EEEEEAEEEEEAEEEEEAF0F0EDF2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAB8C4C5D1E0E0D1E0E0D1E0E0F3F4F4F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D4E1E1F6F6F6F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F5F5F5F8
        F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F8F8F8FE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD9E3E3D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F8F8F8FEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2EBEBD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F8F8F8FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7FAFAD5E2E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D7E3E3F8F8F8FEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFDFDF3F7F7F2F6F6F2F6F6F2F6F6F2F6F6F2F6F6F2F6
        F6F2F6F6F2F6F6F2F6F6F2F6F6F2F6F6F3F7F7FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
    end
    object btnSair: TSpeedButton
      Left = 137
      Top = 2
      Width = 45
      Height = 37
      Cursor = crHandPoint
      Hint = 'Sair'
      Align = alLeft
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD9E5EEFAFBFCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF91B7D173A2C2B6CFE0F7F9FBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF93B6D06498BD6498BD6E9FC1B1CADEF3F7FAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF93B8D16498BD6498BD6498BD6498BD6B9CC0A9
        C5DBEEF4F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF95B8D26498BD6498BD6498BD6498BD6498BD64
        98BD689BBFA1C0D6E8EFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF95B9D16498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6699BE99BCD4E2EBF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E8ECBADAE0BADA
        E0BADAE0BADAE0BADAE0BADAE080AEC96498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD93BAD1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CC8AC1
        CC8AC1CC8AC1CC8AC1CC8AC1CC70A6C26498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CC9FCC
        D6CBE4E8CBE4E8CBE4E8CBE4E886B2CC6498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE98BBD36498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE99BBD46498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE9ABCD46498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF9BE394DBF5D8FFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE9ABCD46498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF78D96E5BD14E97E18FEDFAECB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE9BBDD56498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF78D96E5AD14D5AD14D62D2558BD69988C2C8C3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFE9CBDD56498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF78D96E5AD14D5AD14D5AD14D5AD14D60CF5CA0DB
        B2FEFEFEFEFEFEFEFEFEFEFEFE9DBED56498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        88DE7F5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD1
        4D82DC78DFF6DCFEFEFEFEFEFE9DBED66498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        88DE7F5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD1
        4D5AD14D5CD24F9CE394F5FCF49EBFD66498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        88DE7F5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD14D5AD1
        4D5AD14D6DD661C4EFC0FEFEFE9FBFD66498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        BBECB6A2E59BA2E59BA2E59B69D55E5AD14D5AD14D5AD14D5AD14D5AD14D5FD1
        54AEE9A8F9FDF8FEFEFEFEFEFEA0C0D76498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7EDB735AD14D5AD14D5AD14D5BD14E6CCB7DB9DE
        D5FEFEFEFEFEFEFEFEFEFEFEFEA1C0D76498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7EDB735AD14D5AD14D83DC79A7D8C38AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEA1C1D76498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7EDB7370D665C8EFC4FFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEA2C1D86498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFCBF0C7FAFDFAFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEA3C2D86498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEA4C2D86498BD6498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEE7EFF597BAD36498BD6498BD6498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0EAF291B6D06498BD6498BD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDAE6EF89B1CD64
        98BD6498BD6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CCC3DF
        E5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED4
        E2ED84ADCB6498BD6498BD6498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CC98C8
        D3BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BBDBE1BB
        DBE1BBDBE19FC6D672A3C36498BD6498BD78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D9E08AC1CC8AC1
        CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8AC1CC8A
        C1CC8AC1CC8AC1CC8AC1CC7CB2C7699EBF78A9C6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAEBEFC2DFE4C2DF
        E4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2DFE4C2
        DFE4C2DFE4C2DFE4C2DFE4C2DFE4C0DEE4B9D4E0FFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSairClick
    end
  end
  object dbGridListagem: TDBGrid
    Left = 185
    Top = 41
    Width = 715
    Height = 417
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 458
    Width = 900
    Height = 19
    Panels = <>
  end
end
