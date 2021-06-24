(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTLazy;

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

  Trysil.DD.Output,
  Trysil.DD.Model2.Company,
  Trysil.DD.Model3.Employee,
  Trysil.DD.Frame.Base;

type

{ TTTLazyFrame }

  TTTLazyFrame = class(TBaseFrame)
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

constructor TTTLazyFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
end;

destructor TTTLazyFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TTTLazyFrame.AfterConstruction;
begin
  inherited AfterConstruction;
  TOutput.Instance.ShowObjects := False;
end;

procedure TTTLazyFrame.GetButtonClick(Sender: TObject);
var
  LEmployee: TEmployee;
  LCompany: TCompany;
begin
  LEmployee := FContext.Get<TEmployee>(1);
  TOutput.Instance.Write(LEmployee);

  LCompany := LEmployee.Company;
  TOutput.Instance.Write(LCompany);
end;

end.
