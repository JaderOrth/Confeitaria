inherited frmEstado: TfrmEstado
  Caption = 'Listagem dos estados'
  ClientHeight = 510
  OnActivate = nil
  OnClose = nil
  OnCreate = nil
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Height = 435
    ExplicitHeight = 435
  end
  inherited Panel2: TPanel
    inherited btnEditar: TSpeedButton
      ExplicitLeft = 53
      ExplicitTop = 0
    end
    inherited btnNovo: TSpeedButton
      ExplicitTop = 0
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 491
    ExplicitTop = 491
  end
  inherited DBGridListagem: TDBGrid
    Height = 435
  end
  inherited src_listagem: TDataSource
    AutoEdit = False
  end
end
