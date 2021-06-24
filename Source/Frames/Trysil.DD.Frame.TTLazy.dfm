inherited TTLazyFrame: TTTLazyFrame
  inherited TitleLabel: TLabel
    Caption = 'TTLazy<T>'
    ExplicitWidth = 83
  end
  object GetButton: TSpeedButton [1]
    AlignWithMargins = True
    Left = 6
    Top = 46
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Get<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = GetButtonClick
  end
end
