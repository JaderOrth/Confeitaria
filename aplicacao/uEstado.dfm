inherited frmEstado: TfrmEstado
  Caption = 'Listagem dos estados'
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    inherited edtPesquisa: TEdit
      OnKeyPress = nil
      OnKeyUp = edtPesquisaKeyUp
    end
  end
  inherited Panel2: TPanel
    inherited btnEditar: TSpeedButton
      OnClick = btnEditarClick
      ExplicitLeft = 53
      ExplicitTop = 0
    end
    inherited btnNovo: TSpeedButton
      OnClick = btnNovoClick
      ExplicitTop = 0
    end
  end
  object dbGridListagem: TDBGrid [3]
    Left = 185
    Top = 41
    Width = 715
    Height = 417
    Align = alClient
    DataSource = src_listagem
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridListagemDblClick
  end
end
