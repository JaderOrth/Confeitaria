object frmCadastroBase: TfrmCadastroBase
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cadastro Base'
  ClientHeight = 264
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 245
    Width = 677
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 574
    Top = 0
    Width = 103
    Height = 245
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 2
      Top = 72
      Width = 99
      Height = 70
      Cursor = crHandPoint
      Hint = 'Salvar registro'
      Align = alTop
      Caption = 'Salvar'
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F4ECCDA566B8822BB98029C7C3BDC7C3BDC7C3BDC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7
        C3BDB98029B8822BCDA66AF9F4EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFCDA566C6882DCE9030CF9030DCCBB1DCCBB1DCCBB1DCCBB1DCCB
        B1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DCCBB1DC
        CBB1CF9030CE9030C5882DCDA66AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC88D2FDB9834DB9834DB9834F1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECDB9834DB9834DB9834CA8B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD99634DB9834DB9834DB9834F1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECDB9834DB9834DB9834D99633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834F1F0ECF1F0ECE3E0DCC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDE4E1DCF1F0ECF1
        F0ECDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834F1F0ECF1F0ECECEBE6E3E0DCE3E0
        DCE3E0DCE3E0DCE3E0DCE3E0DCE3E0DCE3E0DCE3E0DCE3E0DCEDEBE6F1F0ECF1
        F0ECDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834F1F0ECF1F0ECEDEBE6E4E1DCE4E1
        DCE4E1DCE4E1DCE4E1DCE4E1DCE4E1DCE4E1DCE4E1DCE4E1DCEDEBE7F1F0ECF1
        F0ECDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834F1F0ECF1F0ECE3E0DCC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDE4E1DCF1F0ECF1
        F0ECDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834F0EBE0F1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF0
        EADFDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834E6C592F1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECE6
        C491DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9835E4BA7CEAD1ADEAD3B0EAD3
        B0EAD3B0EAD3B0EAD3B0EAD3B0EAD3B0EAD3B0EAD3B0EAD3B0EAD1ADE4B979DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834D89633C3872CB98029B98029B980
        29B98029B98029B98029B98029B98029B98029B98029B98029B98029C3872DD8
        9634DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834C3872CB98029C3954EDAC29CDECA
        A9DECAA9DECAA9DECAA9DECAA9DECAA9DECAA9DECAA9DAC19BC3944CB98029C3
        872DDB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834B98029C49650EFEDE7E3E1DBD9D7
        CFD9D7CFD9D8D0EAE9E5F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECEFECE6C3944CB9
        8029DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834B98029DBC49FE2E0DAA6A595A6A5
        95A6A595A6A595B1B0A2F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDAC19BB9
        8029DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834B98029DFCCACD7D6CEA6A595A6A5
        95A6A595A6A595A6A595F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDECAA9B9
        8029DB9834DB9834DB9834EDCB99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDC9838DB9834DB9834DB9834B98029DFCCACD7D6CEA6A595A6A5
        95A6A595A6A595A6A595F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDECAA9B9
        8029DB9834DB9834EDCB99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE5B66FDB9834DB9834DB9834B98029DFCCACDDDBD4C1BFB5C1BF
        B5C1BFB5C1BFB5C1BFB5F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDECAA9B9
        8029DB9834EDCB99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF6EDE5B66FDC9838DB9834B98029DFCCACE3E0DCC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDECAA9B9
        8029EDCB99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarClick
      ExplicitLeft = 6
      ExplicitTop = 78
    end
    object btnSair: TSpeedButton
      Left = 2
      Top = 142
      Width = 99
      Height = 70
      Cursor = crHandPoint
      Hint = 'Sair'
      Align = alTop
      Caption = 'Sair'
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
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSairClick
      ExplicitLeft = 6
      ExplicitTop = 279
    end
    object btnNovo: TSpeedButton
      Left = 2
      Top = 2
      Width = 99
      Height = 70
      Cursor = crHandPoint
      Hint = 'Novo registro'
      Align = alTop
      Caption = 'Novo'
      Flat = True
      Glyph.Data = {
        36180000424D3618000000000000360000002800000040000000200000000100
        18000000000000180000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEE6E6E6D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9E6E6E6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEE9E9E9DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEE9E9E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEBEBEBD2DADAD1DDDDD2DEDED2DEDED2DEDED2DEDED2DEDED2DE
        DED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2DEDED2
        DEDED2DEDED1DDDDD2DADAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEEEEEEEAEAEAF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3EAEAEAEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDBE1E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0DBE1E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEFEFEFF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD8E0E1D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D8E0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF2F2F2F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC8
        D6D6D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F0F0F0D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5F0
        F0F0F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CDDCDCC1CFCFC1CFCFC1CFCFC1CF
        CFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFC1CFCFCD
        DCDCD1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F5F5F5E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9F5
        F5F5F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CEDDDDC5D3D3C5D3D3C5D3D3C5D3
        D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3CE
        DDDDD1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F6F6F6EDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDF6
        F6F6F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC8
        D6D6D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F0F0F0D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5F0
        F0F0F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0CFDDDDCFDDDDCFDDDDCFDD
        DDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDD1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CAD9D9B8C4C5B8C4C5B8C4C5B8C4
        C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5CA
        D9D9D1E0E0D1E0E0D1E0E0D7E0E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F2F2F2E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0F2
        F2F2F9F9F9F9F9F9F9F9F9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CAD9D9B8C4C5B8C4C5B8C4C5B8C4
        C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5B8C4C5CA
        D9D9D1E0E0D1E0E0D1E0E0D4DDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F2F2F2E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0F2
        F2F2F9F9F9F9F9F9F9F9F9EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0CBDADAD3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F3F3F3EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0CFDDDDCFDDDDCFDDDDCFDD
        DDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDCFDDDDD1
        E0E0D0DFDFCAD9D9CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9
        F9F9F8F8F8F2F2F2F2F2F2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAAEBABAC6
        D4D4CAD9D9CAD8D8CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F0F0F0D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5EE
        EEEEF2F2F2F2F2F2F2F2F2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CEDDDDC5D3D3C5D3D3C5D3D3C5D3
        D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C5D3D3C2D0D0C7
        D6D6CAD8D8CAD8D8CAD8D8D3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F6F6F6EDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEAEAEAEF
        EFEFF2F2F2F2F2F2F2F2F2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0CDDCDCCAD8D8CA
        D8D8CAD8D8CAD8D8CAD8D8D7E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F5F5F5F2F2F2F2
        F2F2F2F2F2F2F2F2F2F2F2F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0CDDCDCC1CFCFC1CFCFC1CFCFC1CF
        CFC1CFCFC1CFCFC6D4D4D1E0E0D1E0E0D1E0E0D3E1E1E4EBEBE9EDEDE8EEEEEA
        EEEEEAEEEEEAEEEEEAF0F0EDF2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F5F5F5E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9EEEEEEF9F9F9F9F9F9F9F9F9FAFAFAFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0C8D7D7AEBABAAEBABAAEBABAAEBA
        BAAEBABAAEBABAB8C4C5D1E0E0D1E0E0D1E0E0F3F4F4F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F0F0F0D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5E0E0E0F9F9F9F9F9F9F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D4E1E1F6F6F6F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F5F5F5F8
        F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD7E0E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F5F5F5F8F8F8FE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFFFFFFFFFFFFFEFEFEFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD9E3E3D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F5F5F5F8F8F8FEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F4F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFFFFFFFEFEFEFEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2EBEBD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D5E2E2F5F5F5F8F8F8FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFFFFFFFEFEFEFEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7FAFAD5E2E2D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D7E3E3F8F8F8FEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFDF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FBFBFBFEFEFEFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFEFEF9FAFAF8FAFAF8FAFAF8FAFAF8FAFAF8FAFAF8FA
        FAF8FAFAF8FAFAF8FAFAF8FAFAF8FAFAF8FAFAFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNovoClick
      ExplicitLeft = 6
    end
  end
  object panelCadastro: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 245
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
  end
end
