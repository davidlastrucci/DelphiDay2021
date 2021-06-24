inherited TTMetadataFrame: TTTMetadataFrame
  inherited TitleLabel: TLabel
    Caption = 'TTMetadata'
    ExplicitWidth = 91
  end
  object GetCompanyMetadataButton: TSpeedButton [1]
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
    Caption = 'GetMetadata<TCompany>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = GetCompanyMetadataButtonClick
  end
  object GetEmployeeMetadataButton: TSpeedButton [2]
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
    Caption = 'GetMetadata<TEmployee>'
    ImageIndex = 1
    Images = ImageList
    Flat = True
    Margin = 6
    OnClick = GetEmployeeMetadataButtonClick
  end
end
