inherited TTContextFrame: TTTContextFrame
  inherited TitleLabel: TLabel
    Caption = 'TTContext'
    ExplicitWidth = 77
  end
  object GetCompanyButton: TSpeedButton [1]
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
    OnClick = GetCompanyButtonClick
  end
  object SelectAllCompanyButton: TSpeedButton [2]
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
    OnClick = SelectAllCompanyButtonClick
  end
  object SelectCompanyButton: TSpeedButton [3]
    AlignWithMargins = True
    Left = 6
    Top = 126
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Select<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = SelectCompanyButtonClick
  end
  object InsertCompanyButton: TSpeedButton [4]
    AlignWithMargins = True
    Left = 6
    Top = 318
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 8
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
  object UpdateCompanyButton: TSpeedButton [5]
    AlignWithMargins = True
    Left = 6
    Top = 358
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
  object DeleteCompanyButton: TSpeedButton [6]
    AlignWithMargins = True
    Left = 6
    Top = 398
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
  object GetEmployeeButton: TSpeedButton [7]
    AlignWithMargins = True
    Left = 6
    Top = 181
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
    OnClick = GetEmployeeButtonClick
  end
  object SelectAllEmployeeButton: TSpeedButton [8]
    AlignWithMargins = True
    Left = 6
    Top = 221
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'SelectAll<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = SelectAllEmployeeButtonClick
  end
  object SelectEmployeeButton: TSpeedButton [9]
    AlignWithMargins = True
    Left = 6
    Top = 261
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'Select<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = SelectEmployeeButtonClick
  end
  object Separator2Panel: TPanel [11]
    AlignWithMargins = True
    Left = 4
    Top = 307
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
  object Separator1Panel: TPanel [12]
    AlignWithMargins = True
    Left = 4
    Top = 172
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
