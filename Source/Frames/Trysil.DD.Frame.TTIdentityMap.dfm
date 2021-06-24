inherited TTIdentityMapFrame: TTTIdentityMapFrame
  inherited TitleLabel: TLabel
    Caption = 'TTIdentityMap'
    ExplicitWidth = 112
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
  object Update1Button: TSpeedButton [2]
    AlignWithMargins = True
    Left = 6
    Top = 143
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 8
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Update<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = Update1ButtonClick
  end
  object Update2Button: TSpeedButton [3]
    AlignWithMargins = True
    Left = 6
    Top = 183
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Update<TCompany[0]>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = Update2ButtonClick
  end
  object SelectAllButton: TSpeedButton [4]
    AlignWithMargins = True
    Left = 6
    Top = 86
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'SelectAll<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = SelectAllButtonClick
  end
  object SeparatorPanel: TPanel [6]
    AlignWithMargins = True
    Left = 4
    Top = 132
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
