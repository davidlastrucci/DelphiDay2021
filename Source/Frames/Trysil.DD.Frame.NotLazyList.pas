(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.NotLazyList;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSon,
  System.ImageList,
  REST.JSon,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Trysil.Data,
  Trysil.Context,

  Trysil.DD.Output,
  Trysil.DD.JSon.Helper,
  Trysil.DD.Model6.Company,
  Trysil.DD.Model4.Employee,
  Trysil.DD.Frame.Base;

type

{ TNotLazyListFrame }

  TNotLazyListFrame = class(TBaseFrame)
    GetButton: TSpeedButton;
    SeparatorPanel: TPanel;
    JSonButton: TSpeedButton;
    procedure GetButtonClick(Sender: TObject);
    procedure JSonButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TNotLazyListFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection, False);
end;

destructor TNotLazyListFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TNotLazyListFrame.GetButtonClick(Sender: TObject);
var
  LCompany: TCompany;
  LEmployee: TEmployee;
begin
  LCompany := FContext.Get<TCompany>(1);
  try
    TOutput.Instance.Write(LCompany);
    for LEmployee in LCompany.Employees do
      TOutput.Instance.Write(LEmployee);
  finally
    LCompany.Free;
  end;
end;

procedure TNotLazyListFrame.JSonButtonClick(Sender: TObject);
var
  LCompany: TCompany;
  LJSon: TJSonObject;
begin
  LCompany := FContext.Get<TCompany>(1);
  try
    LJSon := TJSon.ObjectToJsonObject(LCompany, [joIndentCasePreserve]);
    try
      TOutput.Instance.Write(LJSon.PrettyPrint);
      TOutput.Instance.Write;
    finally
      LJSon.Free;
    end;
  finally
    LCompany.Free;
  end;
end;

end.
