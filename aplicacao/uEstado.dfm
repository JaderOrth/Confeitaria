inherited frmEstado: TfrmEstado
  Caption = 'Listagem dos estados'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel2: TPanel
    inherited btnEditar: TSpeedButton
      OnClick = btnEditarClick
      ExplicitLeft = 53
      ExplicitTop = 0
    end
    inherited btnNovo: TSpeedButton
      OnClick = btnNovoClick
      ExplicitLeft = -4
      ExplicitTop = 0
    end
  end
end