(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTLazyList;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
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
  Trysil.Generics.Collections,

  Trysil.DD.Output,
  Trysil.DD.Model4.Company,
  Trysil.DD.Model4.Employee,
  Trysil.DD.Frame.Base;

type

{ TTTLazyListFrame }

  TTTLazyListFrame = class(TBaseFrame)
    GetButton: TSpeedButton;
    procedure GetButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;

    procedure AfterConstruction; override;
  end;

implementation

{$R *.dfm}

constructor TTTLazyListFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
end;

destructor TTTLazyListFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TTTLazyListFrame.AfterConstruction;
begin
  inherited AfterConstruction;
  TOutput.Instance.ShowObjects := False;
end;

procedure TTTLazyListFrame.GetButtonClick(Sender: TObject);
var
  LCompany: TCompany;
  LEmployees: TTList<TEmployee>;
  LEmployee: TEmployee;
begin
  LCompany := FContext.Get<TCompany>(1);
  TOutput.Instance.Write(LCompany);

  LEmployees := LCompany.Employees;
  for LEmployee in LEmployees do
    TOutput.Instance.Write(LEmployee);
end;

end.
