(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.NotLazy;

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
  Trysil.DD.Model2.Company,
  Trysil.DD.Model5.Employee,
  Trysil.DD.Frame.Base;

type

{ TNotLazyFrame }

  TNotLazyFrame = class(TBaseFrame)
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

{ TNotLazyFrame }

constructor TNotLazyFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection, False);
end;

destructor TNotLazyFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TNotLazyFrame.GetButtonClick(Sender: TObject);
var
  LEmployee: TEmployee;
begin
  LEmployee := FContext.Get<TEmployee>(1);
  try
    TOutput.Instance.Write(LEmployee);
    TOutput.Instance.Write(LEmployee.Company);
  finally
    LEmployee.Free;
  end;
end;

procedure TNotLazyFrame.JSonButtonClick(Sender: TObject);
var
  LEmployee: TEmployee;
  LJSon: TJSonObject;
begin
  LEmployee := FContext.Get<TEmployee>(1);
  try
    LJSon := TJSon.ObjectToJsonObject(LEmployee, [joIndentCasePreserve]);
    try
      TOutput.Instance.Write(LJSon.PrettyPrint);
      TOutput.Instance.Write;
    finally
      LJSon.Free;
    end;
  finally
    LEmployee.Free;
  end;
end;

end.
