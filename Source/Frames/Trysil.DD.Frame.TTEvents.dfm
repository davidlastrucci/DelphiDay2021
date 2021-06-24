inherited TTEventsFrame: TTTEventsFrame
  inherited TitleLabel: TLabel
    Caption = 'TTEvents<T>'
    ExplicitWidth = 99
  end
  object InsertCompanyButton: TSpeedButton [1]
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
    Caption = 'Insert<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = InsertCompanyButtonClick
  end
  object UpdateCompanyButton: TSpeedButton [2]
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
    Caption = 'Update<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = UpdateCompanyButtonClick
  end
  object InsertEmployeeButton: TSpeedButton [3]
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
    Caption = 'Insert<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = InsertEmployeeButtonClick
  end
  object UpdateEmployeeButton: TSpeedButton [4]
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
    Caption = 'Update<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = UpdateEmployeeButtonClick
  end
  object DeleteCompanyButton: TSpeedButton [5]
    AlignWithMargins = True
    Left = 6
    Top = 280
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Delete<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = DeleteCompanyButtonClick
  end
  object DeleteEmployeeButton: TSpeedButton [6]
    AlignWithMargins = True
    Left = 6
    Top = 240
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 8
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Delete<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = DeleteEmployeeButtonClick
  end
  object SeparatorPanel01: TPanel [8]
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
  object SeparatorPanel02: TPanel [9]
    AlignWithMargins = True
    Left = 4
    Top = 229
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
    TabOrder = 2
  end
end
