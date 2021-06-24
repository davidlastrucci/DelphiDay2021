inherited NotLazyListFrame: TNotLazyListFrame
  inherited TitleLabel: TLabel
    Caption = 'not LazyList<T>'
    ExplicitWidth = 121
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
    Caption = 'Get<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = GetButtonClick
  end
  object JSonButton: TSpeedButton [2]
    AlignWithMargins = True
    Left = 6
    Top = 103
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 8
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'JSon'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = JSonButtonClick
  end
  object SeparatorPanel: TPanel [4]
    AlignWithMargins = True
    Left = 4
    Top = 92
    Width = 192
    Height = 1
    Margins.Left = 4
    Margins.Top = 8
    Margins.Right = 4
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    Color = 15329769
    ParentBackground = False
    TabOrder = 1
  end
end
