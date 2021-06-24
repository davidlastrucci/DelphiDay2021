(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTIdentityMap;

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
  Trysil.DD.Model2.Company,
  Trysil.DD.Frame.Base;

type

{ TTTIdentityMapFrame }

  TTTIdentityMapFrame = class(TBaseFrame)
    GetButton: TSpeedButton;
    SelectAllButton: TSpeedButton;
    SeparatorPanel: TPanel;
    Update1Button: TSpeedButton;
    Update2Button: TSpeedButton;
    procedure GetButtonClick(Sender: TObject);
    procedure Update1ButtonClick(Sender: TObject);
    procedure Update2ButtonClick(Sender: TObject);
    procedure SelectAllButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;
    FCompany: TCompany;
    FCompanies: TTList<TCompany>;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;

    procedure AfterConstruction; override;
  end;

implementation

{$R *.dfm}

constructor TTTIdentityMapFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
  FCompanies := TTList<TCompany>.Create;
end;

destructor TTTIdentityMapFrame.Destroy;
begin
  FCompanies.Free;
  FContext.Free;
  inherited Destroy;
end;

procedure TTTIdentityMapFrame.AfterConstruction;
begin
  inherited AfterConstruction;
  TOutput.Instance.ShowAddress := True;
end;

procedure TTTIdentityMapFrame.GetButtonClick(Sender: TObject);
begin
  FCompany := FContext.Get<TCompany>(1);
  TOutput.Instance.Write(FCompany);
end;

procedure TTTIdentityMapFrame.SelectAllButtonClick(Sender: TObject);
begin
  FContext.SelectAll<TCompany>(FCompanies);

  TOutput.Instance.Write('Companies: %d', [FCompanies.Count]);
  TOutput.Instance.Write;
  TOutput.Instance.Write(FCompanies[0]);
end;

procedure TTTIdentityMapFrame.Update1ButtonClick(Sender: TObject);
begin
  FCompany.Country := 'Indonesia';
  FContext.Update<TCompany>(FCompany);

  TOutput.Instance.Write(FCompany);
  TOutput.Instance.Write(FCompanies[0]);
end;

procedure TTTIdentityMapFrame.Update2ButtonClick(Sender: TObject);
begin
  FCompanies[0].Country := 'Serbia';
  FContext.Update<TCompany>(FCompanies[0]);

  TOutput.Instance.Write(FCompanies[0]);
  TOutput.Instance.Write(FCompany);
end;

end.
