(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTMetaData;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Rtti,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Data.DB,
  Trysil.Data,
  Trysil.Context,
  Trysil.Metadata,

  Trysil.DD.Output,
  Trysil.DD.Model2.Company,
  Trysil.DD.Model2.Employee,
  Trysil.DD.Frame.Base;

type

{ TTTMetaDataFrame }

  TTTMetadataFrame = class(TBaseFrame)
    GetCompanyMetadataButton: TSpeedButton;
    GetEmployeeMetadataButton: TSpeedButton;
    procedure GetCompanyMetadataButtonClick(Sender: TObject);
    procedure GetEmployeeMetadataButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;

    procedure LogMetadata(const ATableMetadata: TTTableMetadata);
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TTTMetadataFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
end;

destructor TTTMetadataFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TTTMetadataFrame.LogMetadata(const ATableMetadata: TTTableMetadata);
var
  ColumnMetadata: TTColumnMetadata;
begin
  TOutput.Instance.Write('TableName: %s', [ATableMetadata.TableName]);
  TOutput.Instance.Write('PrimaryKey: %s', [ATableMetadata.PrimaryKey]);
  for ColumnMetadata in ATableMetadata.Columns do
  begin
    TOutput.Instance.Write;
    TOutput.Instance.Write('ColumnName: %s', [ColumnMetadata.ColumnName]);
    TOutput.Instance.Write('DataType: %s', [
      TRttiEnumerationType.GetName<TFieldType>(ColumnMetadata.DataType)]);
    TOutput.Instance.Write('DataSize: %d', [ColumnMetadata.DataSize]);
  end;
  TOutput.Instance.Write;
end;

procedure TTTMetadataFrame.GetCompanyMetadataButtonClick(Sender: TObject);
var
  LTableMetadata: TTTableMetadata;
begin
  LTableMetadata := FContext.GetMetadata<TCompany>();
  LogMetadata(LTableMetadata);
end;

procedure TTTMetadataFrame.GetEmployeeMetadataButtonClick(Sender: TObject);
var
  LTableMetadata: TTTableMetadata;
begin
  LTableMetadata := FContext.GetMetadata<TEmployee>();
  LogMetadata(LTableMetadata);
end;

end.
