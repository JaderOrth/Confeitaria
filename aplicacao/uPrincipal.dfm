object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Confeitaria - Meu Docinho'
  ClientHeight = 408
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 904
    Height = 19
    Panels = <
      item
        Bevel = pbNone
        Text = 'Usu'#225'rio conectado:'
        Width = 110
      end
      item
        Bevel = pbNone
        Width = 120
      end
      item
        Bevel = pbNone
        Text = 'Data e hora da conex'#227'o:'
        Width = 135
      end
      item
        Bevel = pbNone
        Width = 150
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 105
      Height = 71
      Align = alLeft
      Caption = 'Pedidos'
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFDFDA5ABB2939AA0939AA0939AA0939AA0939AA0939A
        A0939AA0939AA0939AA0939AA0939AA0939AA0939AA0939AA0939AA0939AA093
        9AA0939AA092999FCCCCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCA8B2BB9BA0A49BA0A49BA0A49BA0A49BA0
        A49BA0A49BA0A49BA0A49BA0A49BA0A49BA0A49BA0A49BA0A49BA0A49BA0A49B
        A0A493989EABB8C6B6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7FDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFE0E0BBC7C783FCFCF9FFFF
        FFE7E6E6656463646362646362646362646362BEBEBDFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECF5F5E8BABA66CACA89C5C57DFCFC
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFEFEFBFFFFFED0D095E2E2
        BDE7E7E76F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6DE1
        E0E0E3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEDEDEDEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECFE
        FEFEE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7FDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFE0E0BBC7C783FCFCF9FFFF
        FFE7E6E6676665676665676665676665676665BFBEBEFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECF5F5E8BBBB68CACA89C5C57DFCFC
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFEFEFBFFFFFED0D097E2E2
        BDE7E7E76F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6DE1
        E0E0E3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEDEDEDEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECFE
        FEFEE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7FDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFE0E0B9C6C681FCFCF8FFFF
        FFE7E7E7676666676665676665676665676665C0BFBFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECF5F5E8BBBB68CBCB8BC5C57DFCFC
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFEFEFCFFFFFED1D197E2E2
        BEE7E7E76F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6DE1
        E0E0E3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEDEDEDEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECEDEDECFE
        FEFEE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5FDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFE0E0B9C6C681FCFCF8FFFF
        FFE7E6E6676666676665676665676665676665BFBEBEFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECF5F5E8BBBB68CBCB8BC5C57DFCFC
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFEFEFCFFFFFED1D198E2E2
        BEE7E7E76F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6D6F6E6DE1
        E0E0E3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF0F0F0EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3E3A2AEBAB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCECEDEEFFFFFFFFFFFFFFFFFFBCBCBAABAA
        A7ABAAA7ABAAA7ABAAA7ABAAA7ABAAA7ABAAA7ABAAA7A9A8A6CDCCCBFFFFFFFF
        FFFFE5E5E5A6B2BFB6B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F8F9B0BECCBBC7D4C0CCD7C0CCD7C1CDD7C9CCCDC6C7
        C7C6C7C7C6C7C7C6C7C7C6C7C7C6C7C7C6C7C7C6C7C7C4C6C7B6C1CBC0CCD7C0
        CCD7BBC7D4B0BECCB8B9BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFDFDD2D9DFCCD3DACCD3DACCD3DACCD3DACCD3DACCD3
        DACCD3DACCD3DACCD3DACCD3DACCD3DACCD3DACCD3DACCD3DACCD3DACCD3DACC
        D3DACCD3DACED5DAF6F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ExplicitLeft = -6
    end
    object SpeedButton2: TSpeedButton
      Left = 105
      Top = 0
      Width = 105
      Height = 71
      Align = alLeft
      Caption = 'Produtos'
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFABDDF05ABADF85D0EED8F0F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADDE
        F05ABADF51B5DB51B5DB55BFE755BFE785D0EED8F0F9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDEF05BBBE051B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE782CFEDD6EFF9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDEF05BBBE051B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE782CFEDD6
        EFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFAFDEF05BBBE051B5DB51B5DB51B5DB5CBADDA4D5
        E772C2E051B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE782CFEDD6EFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB1DFF15BBBE051B5DB51B5DB51B5DB5CBADDA4D5E7EAEFF1F2F2
        F286C9E351B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE782CFEDD6EFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B3E0F15CBCE051B5DB51B5DB51B5DB5CBADDA4D5E7EAEFF1D4E7EEB4DBEAF2F2
        F286C9E351B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE780CEECD4EFF9FFFFFFFFFFFFB3E0F15CBCE0
        51B5DB51B5DB51B5DB51B5DB53B6DCE1ECF0D5E7EE8ECDE4A3D4E7B2DAE9DFEB
        F086C9E351B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE780CEECD4EEF851B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB5AB9DDF2F2F2ABD8E8B2DAE98ACBE4C0DFEBEFF1
        F270C1E051B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB5AB9DDF2F2F291CDE5C0DFEBF1F2F2BBDDEA6BBF
        DF51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB5AB9DDF2F2F2F1F2F2BBDDEA6BBFDF51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB55B7DCB3DAE96BBFDF51B5DB51B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE755BFE755
        BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE769C7EA7A
        CEED59C1E855BFE755BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5
        DB51B5DB51B5DB51B5DB55BFE755BFE755BFE755BFE755BFE755BFE77ECFED99
        D9F18AD4EF6DC8EB55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5
        DB51B5DB52B8DF59C1E95CC5ED57C1E955BFE755BFE755BFE755BFE77ECFED99
        D9F199D9F17ECFED55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB52B8
        DF59C1E95EC7EF5EC7EF5EC7EF5EC7EF5CC5ED57C1E955BFE755BFE77ECFED99
        D9F199D9F17ECFED55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB52B8DF59C1E95EC7
        EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5CC5ED57C1E97ECFED99
        D9F199D9F17ECFED55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB51B5DB51B5DB52B8DF59C1E95EC7EF5EC7EF5EC7
        EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5FC8F07CD2F2A2DFF69A
        DBF39ADAF27ECFED55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB51B5DB51B5DB52B8DF59C1E95EC7EF5EC7EF5EC7EF5EC7EF5EC7
        EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5FC8F07CD2F2A4DFF6AFE3F7AFE3F7AF
        E3F7A5E0F67DD0EF55BFE755BFE755BFE755BFE755BFE755BFE751B5DB51B5DB
        51B5DB51B5DB52B8DF59C1E95EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7
        EF5EC7EF5EC7EF5EC7EF5FC8F07BD1F2A3DFF6AFE3F7AFE3F7AFE3F7AFE3F7A1
        DEF679D1F25FC8F05CC5ED57C1E955BFE755BFE755BFE755BFE751B5DB51B5DB
        52B8DF59C1E95EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7
        EF5EC7EF5FC8F07BD1F2A3DFF6AFE3F7AFE3F7AFE3F7AFE3F7A1DEF679D1F25F
        C8F05EC7EF5EC7EF5EC7EF5EC7EF5CC5ED57C1E955BFE755BFE752B8DF59C1E9
        5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5FC8
        F07BD1F2A3DFF6AFE3F7AFE3F7AFE3F7AFE3F7A1DEF679D1F25FC8F05EC7EF5E
        C7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5CC5ED57C2EAD6F0FA86D4F2
        5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5FC8F07BD1F2A3DF
        F6AFE3F7AFE3F7AFE3F7AFE3F7A1DFF679D1F25FC8F05EC7EF5EC7EF5EC7EF5E
        C7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF86D4F2D6F0FAFFFFFFFFFFFF
        D6F0FA86D4F25EC7EF5EC7EF5EC7EF5EC7EF5FC8F07BD1F2A3DFF6AFE3F7AFE3
        F7AFE3F7AFE3F7A1DFF67AD1F25FC8F05EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5E
        C7EF5EC7EF5EC7EF5EC7EF5EC7EF86D4F2D6F0FAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD6F0FA86D4F25FC8F07BD1F2A3DFF6AFE3F7AFE3F7AFE3F7AFE3
        F7A2DFF67AD1F25FC8F05EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5E
        C7EF5EC7EF5EC7EF86D4F2D6F0FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFCFEEFAA5E0F6AFE3F7AFE3F7AFE3F7A2DFF67AD1
        F25FC8F05EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5E
        C7EF86D4F2D6F0FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCEDF9A0DFF67AD1F25FC8F05EC7
        EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF86D4F2D6
        F0FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6F0FA86D4F25EC7
        EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF5EC7EF86D4F2D6F0FAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6F0
        FA86D4F25EC7EF5EC7EF5EC7EF5EC7EF86D4F2D6F0FAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD6F0FA86D4F286D4F2D6F0FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ExplicitLeft = 111
    end
    object SpeedButton3: TSpeedButton
      Left = 210
      Top = 0
      Width = 105
      Height = 71
      Align = alLeft
      Caption = 'Clientes'
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF8F7F2F2F0E5EEEBDCEBE8D8EDE9DAF1EFE2F6F4EDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2CED1C9A5C1B8
        8BC1B88CC0B78CC1B98EC2B98EC1B98EC1B88EC1B98CC1B88BCAC29ADED9BFFD
        FDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1C695D4CB9FD6CD
        A2D5CCA1CEC69CC5BD95C5BD95C5BD95C5BE95C5BD95C5BD95C4BC94BDB487F1
        EFE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0C695D4CBA0D4CB
        A0D5CCA1D5CCA1D7CDA2CBC399C4BC94C6BE96C6BE96C6BE96C6BE96C0B88CF2
        EFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC596D4CBA0D5CC
        A1D5CCA1D5CCA1D8CFA3DDD3A7D3CA9FC4BC95C6BE96C6BE96C6BE96C0B88CF2
        EFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C99BD4CBA0D5CC
        A1D5CCA1D7CEA2DCD2A5191A21AEA886D0C79DC5BD95C6BE96C5BD95C1B88DF2
        F1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFDFBF9FBF8FDFDFCFFFFFFDFD4ADD3CA9FD5CC
        A1D4CBA0E6DCAC3A3A3930303211131ACCC39BC6BE96C6BE96C5BD95C4BC8EFF
        FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF3E9
        CCDFC4B2D0A7A0C59398C08A9CC48D9CC48E9CC48D95C08AC7CA9DD6CCA1D5CC
        A1D4CBA0E4DAAB56544C33333517191EE5DBACC9C199C5BD95C6BE95C3BC8ED9
        C2E8D1B7DBCFB5D9D3BBDDD8C3DFE5D5EBF3EBF5FFFFFFFFFFFFF4F8F3A2CF91
        A9D09AA9D09BA8CD9AA2C595A1C494A2C595A2C595A0C595B8C89AD8CCA1D5CC
        A1D5CCA1DED4A78C87702A2B2F4A4942E7DDADD0C69DC4BC95C6BF94C2B59EB3
        8CC6B591C2B591C3B590C2B490C2B38EC1B38CC1B48DC3D5BDDFF0F7EEA7D198
        AFD5A1AFD5A1AFD5A1B0D7A2A9CD9CA1C494A2C595A2C595A4C696DCCCA2D4CC
        A1D5CCA1D8CFA3C2BA941C1D2585816BDED5A7D4CBA0C4BC94C5C091C7ADBBC1
        9BD2B795C5B895C5B996C6B996C6B995C6B895C5B794C4BB98C8EFF6ECA7D198
        AFD5A1AFD5A1AFD5A1AFD5A1B0D6A2ADD39FA1C494A2C5959DC594CCCB9FD6CC
        A1D5CCA1D5CCA1EAE0AF1E1F26BDB591D9D0A4D6CDA2C4BC94C5C18EC79EDAC7
        A1D6C8A2D6BA97C8B895C5B996C6B996C6B996C6B895C5BA96C6F3F9F1A8D299
        AED4A0AFD5A1AFD5A1AFD5A1AFD5A1AFD6A1ABD19EA1C494A1C595AAC697DCCC
        A2D4CCA1D5CCA1E5DBAC2D2D2ED0C79CD7CEA2D7CDA2C4BE8FC6B0B3C79ED9C7
        A1D5C7A1D5C8A2D7BA97C7B895C5B996C6B996C6B895C5BB99C8FCFDFBAAD599
        AED4A0AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1B0D6A2A5C998A2C5959DC594C3C9
        9DD8CCA1D5CB9BBDB590949084A7A086D7CD9BD5CD9FC4BC94C79DDCC7A0D5C7
        A1D5C7A1D5C7A1D5C7A1D6B794C4B895C5B996C6B794C4C3A3CFFFFFFFA9D39A
        AED4A0AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AED4A0A1C494A2C5959CC5
        94C9C897F9F0DBFFFFFFF5FDFFFCFFFFFEF7F1D1C39CC59FD4C7A0D6C7A1D5C7
        A1D5C7A1D5C7A1D5C8A1D6C09CCEB895C4B996C6B692C4CDB2D6FFFFFFBEDEB2
        ACD39DAFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1B0D6A2A4C797A2C5959EC3
        8DBCD8BFB8D3E0A4C5CEA4C4CDA6C6CFADCFD6B9ACD8CA9BD6C7A1D5C7A1D5C7
        A1D5C7A1D5C7A1D5C7A1D5C8A1D6B794C4B895C5B490C2DDCAE5FFFFFFDCEFD5
        A9D19AAFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AFD6A1A8CC9BA1C491A9CB
        ABB9D7E9B6D5DFB4D2DBAECBD4ABC8CFACC9D1AACFD1B4BAD2CA9CD5C7A1D5C7
        A1D5C7A1D5C7A1D5C7A1D5C8A2D6BB98C8B895C5B28CC0F0E7F4FFFFFFFEFEFE
        A6D296AED4A0AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AFD5A1AAD09CA1C492BDDB
        ECBAD9E2BAD9E2BAD9E2BCDBE4B7D5DEABC8D0ACC9D1A9D0D1BFAAD3C89FD5C7
        A1D5C7A1D5C7A1D5C7A1D5C7A1D6BF9BCDB794C4B68EC5FFFFFFFFFFFFFFFFFF
        CAE5C0AAD29BAFD5A1AFD5A1AED4A0AED4A0AED4A0AFD5A1AACF99ADCEBABBDA
        E7BAD9E2BAD9E2BAD9E2B9D8E1BAD9E2BAD9E1ABC8D0ACCBD1B0C2D1C99DD5C6
        A1D5C7A1D5C7A1D5C7A1D5C7A1D5C19CCEB38EC0D7C1E0FFFFFFFFFFFFFFFFFF
        FFFFFFAFD99DAED4A0ABD39CA9D399A8D297ABD49AAFD69FA9CF97B3D3CCBAD9
        E5BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2B7D5DEABC8D0AACCD1CA9CD5C6
        A0D4C49CD2C39AD2C49DD3C7A1D5C09BCEB38CC1FFFFFFFFFFFFFFFFFFFFFFFF
        ECECF6BFCBD0B4E09ACEE7C4FFFFFEFFFFFFEFF2EFABCBA7A9D094B7D2DDBBDA
        E3BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BBDBE4AECCD4A8CBCFC595D2C7
        9ED6E4CAEAE9D4EDDBBBE4C398D2B58CC5EBDEEFFFFFFFFFFFFF8D97BC2A3C80
        2E40832A3A81495A8E778EB4B0CCD6AAC9D199B7C87086B0384783788FB6C1E1
        E7BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2B3D2DABAD4D9ECC9EEF8
        FEFCDEF0EFD5E8E8E9F9F6F5EBF7E8D3ECFFFFFFFFFFFFFFFFFFFFFFFF354687
        3847865A6D9EC2E2E4B8D6DCADCBD3AAC7CFAECBD2B4D1D6B1CED542528DCAEB
        EDBAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2B1D3DCE7EFF1C6DFE2A2
        C3CCA5C4CDA7C5CEA5C5CDA8CAD1E0EFF0FFFFFFFFFFFFFFFFFFFFFFFF9CA4C5
        364786CCEDEEBBDAE3BADAE3BCDBE4B9D7E0AECBD4ACC8D0B0CDD4A7C3CD6276
        A5BEE1E7B8D8E1B9D8E1BAD8E2B9D8E1B9D8E1B3D4DFD3E8EEC8E3EBB7D7E1BB
        DAE3B7D5DEB0CDD5ABC8D0ACC9D1A3C3CDDAE8ECFFFFFFFFFFFFFFFFFFD4D6E4
        7F9ABAC0E0E6BAD9E2BAD9E2B9D8E1BAD9E2BCDBE4B1CED7ABC8D0B7D5D84F64
        96EDF5F9BADBE5B3D5E0B4D5DEB3D5DFB5D8E2DEEFF4E6F3F6B3D5DEB9D9E2BA
        D9E2BAD9E2BBDAE4B7D5DEABC8D0ACC9D1A3C4CEFDFDFDFFFFFFFFFFFFF7F4F8
        A6C7D8BBDAE3BAD9E2BAD9E2BAD9E2BAD9E2BAD9E2BCDBE4AFCCD4AFCDD38AA5
        BDFFFFFFFFFFFFF1F8FAE9F6FAEEF7F9FFFFFFFFFFFFBDDCE5B8D8E1BAD9E2BA
        D9E2BAD9E2BAD9E2BAD9E3B8D7E0ABC7CFA6C5CED9E6EAFFFFFFFFFFFFF3F1F6
        AFD1DEBAD9E2B9D8E1B9D8E1B9D8E1B9D8E1B9D8E1BAD9E2BAD8E2AECBD189A5
        BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1D4DEB9D8E1BAD9E2BA
        D9E2BAD9E2BAD9E2BAD9E2BBDAE3B3D1DAA7C6CECBDFE5FFFFFFFFFFFFF7F5F9
        9DBDD1C4E5E9C5E6EAC8E9ECC9EAECC9EAECC8E9ECC5E6EAC4E4E9BAD8DC7993
        B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3D5E0B9D8E1BAD9E2BA
        D9E2BAD9E2BAD9E2BAD9E2BAD9E2BBDAE4A7C5CDCDE0E5FFFFFFFFFFFFFFFFFF
        667BA96F85AD596C9E4A5B9343538E43548E495A92586B9D6D83AC849DBA7687
        AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7E2E9B7D7E0BAD9E2BA
        D9E2BAD9E2BAD9E2BAD9E2BAD9E2BBDAE3A9C8D2E3EEF1FFFFFFFFFFFFFFFFFF
        9CA4C429397D3C4C8A3E4E8B3F4E8B3F4E8B3E4E8B3D4C8A3A4A8823347ABEC3
        D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7F9B1D4DFB9D8E1BA
        D9E2BAD9E2BAD9E2BAD9E2BAD9E2B8D8E1B5D5DDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF5F6DA231428240508C40508C40508D40508C40508C2D3F817580ADFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCEEF3B1D4DEB8
        D7E0B9D8E1B9D8E1B9D8E1B6D6DFB4D8E1FAFDFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8892BA283A7F3142833345843142832A3D819BA4C4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF6F9C0
        DEE7B4D7E1B6DAE3B4D7E1CEE6EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC5CADEB4BBD3C9CEE0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFAFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ExplicitLeft = 151
    end
    object SpeedButton4: TSpeedButton
      Left = 315
      Top = 0
      Width = 105
      Height = 71
      Align = alLeft
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
      OnClick = SpeedButton4Click
      ExplicitLeft = 321
    end
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 128
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Usurio1: TMenuItem
        Caption = '&Usu'#225'rio'
      end
      object UnidadedeMedida1: TMenuItem
        Caption = 'U&nidade de Medida'
      end
      object Sabores1: TMenuItem
        Caption = 'Sabo&res'
      end
      object Categorias1: TMenuItem
        Caption = 'Ca&tegorias'
      end
      object Produtos1: TMenuItem
        Caption = '&Produtos'
      end
      object Cliente1: TMenuItem
        Caption = 'C&liente'
      end
      object Estado1: TMenuItem
        Caption = '&Estado'
      end
      object Municpio1: TMenuItem
        Caption = '&Munic'#237'pio'
      end
      object Bairro1: TMenuItem
        Caption = '&Bairro'
      end
    end
    object Funes1: TMenuItem
      Caption = '&Fun'#231#245'es'
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
  object LargeImages: TImageList
    Height = 32
    Width = 32
    Left = 440
    Top = 192
  end
  object SmallImages: TImageList
    Left = 528
    Top = 192
  end
end