inherited TTSessionFrame: TTTSessionFrame
  inherited TitleLabel: TLabel
    Caption = 'TTSession<T>'
    ExplicitWidth = 106
  end
  object SelectAllButton: TSpeedButton [1]
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
    Caption = 'SelectAll<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = SelectAllButtonClick
  end
  object CreateSessionButton: TSpeedButton [2]
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
    Caption = 'CreateSession<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = CreateSessionButtonClick
  end
  object InsertButton: TSpeedButton [3]
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
    Caption = 'Insert<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = InsertButtonClick
  end
  object UpdateButton: TSpeedButton [4]
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
    Caption = 'Update<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = UpdateButtonClick
  end
  object DeleteButton: TSpeedButton [5]
    AlignWithMargins = True
    Left = 6
    Top = 223
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
    OnClick = DeleteButtonClick
  end
  object ApplyChangesButton: TSpeedButton [6]
    AlignWithMargins = True
    Left = 6
    Top = 274
    Width = 188
    Height = 36
    Margins.Left = 6
    Margins.Top = 2
    Margins.Right = 6
    Margins.Bottom = 2
    Align = alTop
    DisabledImageIndex = 3
    Caption = 'ApplyChanges'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = ApplyChangesButtonClick
  end
  object SeparatorPanel: TPanel [8]
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
  object Panel1: TPanel [9]
    AlignWithMargins = True
    Left = 4
    Top = 269
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
