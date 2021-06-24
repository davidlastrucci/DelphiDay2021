(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTSession;

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
  Trysil.Session,

  Trysil.DD.Output,
  Trysil.DD.Model2.Company,
  Trysil.DD.Frame.Base;

type

{ TTTSessionFrame }

  TTTSessionFrame = class(TBaseFrame)
    SelectAllButton: TSpeedButton;
    CreateSessionButton: TSpeedButton;
    InsertButton: TSpeedButton;
    UpdateButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    SeparatorPanel: TPanel;
    ApplyChangesButton: TSpeedButton;
    Panel1: TPanel;
    procedure SelectAllButtonClick(Sender: TObject);
    procedure CreateSessionButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ApplyChangesButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;
    FCompanies: TTList<TCompany>;
    FSession: TTSession<TCompany>;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TTTSessionFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
  FCompanies := TTList<TCompany>.Create;
  FSession := nil;
end;

destructor TTTSessionFrame.Destroy;
begin
  if Assigned(FSession) then
    FSession.Free;
  FCompanies.Free;
  FContext.Free;
  inherited Destroy;
end;

procedure TTTSessionFrame.SelectAllButtonClick(Sender: TObject);
var
  LPredicate: TTPredicate<TCompany>;
  LCompany: TCompany;
begin
  FContext.SelectAll<TCompany>(FCompanies);
  TOutput.Instance.Write('Companies: %d', [FCompanies.Count]);
  TOutput.Instance.Write;

  LPredicate := function(const ACompany: TCompany): Boolean
  begin
    result := (ACompany.ID <= 2);
  end;

  for LCompany in FCompanies.Where(LPredicate) do
    TOutput.Instance.Write(LCompany);
end;

procedure TTTSessionFrame.CreateSessionButtonClick(Sender: TObject);
var
  LPredicate: TTPredicate<TCompany>;
  LCompany: TCompany;
begin
  if Assigned(FSession) then
    FSession.Free;

  FSession := FContext.CreateSession<TCompany>(FCompanies);
  TOutput.Instance.Write('Companies: %d', [FSession.Entities.Count]);
  TOutput.Instance.Write;

  LPredicate := function(const ACompany: TCompany): Boolean
  begin
    result := (ACompany.ID <= 2);
  end;

  for LCompany in FSession.Entities.Where(LPredicate) do
    TOutput.Instance.Write(LCompany);
end;

procedure TTTSessionFrame.InsertButtonClick(Sender: TObject);
var
  LCompany: TCompany;
  LPredicate: TTPredicate<TCompany>;
begin
  if not Assigned(FSession) then
    Exit;

  LCompany := FContext.CreateEntity<TCompany>();
  LCompany.Name := 'Open Source Italia S.r.l.';
  LCompany.Address := 'Via del Molinuzzo, 93';
  LCompany.City := 'Prato';
  LCompany.Country := 'Italia';

  FSession.Insert(LCompany);

  LPredicate := function(const ACompany: TCompany): Boolean
  begin
    result := (ACompany.ID = LCompany.ID);
  end;

  for LCompany in FSession.Entities.Where(LPredicate) do
    TOutput.Instance.Write(LCompany);
end;

procedure TTTSessionFrame.UpdateButtonClick(Sender: TObject);
var
  LPredicate: TTPredicate<TCompany>;
  LCompany: TCompany;
begin
  if not Assigned(FSession) then
    Exit;

  LPredicate := function(const ACompany: TCompany): Boolean
  begin
    result := (ACompany.ID = 1);
  end;

  for LCompany in FSession.Entities.Where(LPredicate) do
  begin
    TOutput.Instance.Write(LCompany);

    LCompany.Name := Format('*%s*', [LCompany.Name]);
    LCompany.Address := Format('*%s*', [LCompany.Address]);
    LCompany.City := Format('*%s*', [LCompany.City]);
    LCompany.Country := Format('*%s*', [LCompany.Country]);

    FSession.Update(LCompany);

    TOutput.Instance.Write(LCompany);
  end;
end;

procedure TTTSessionFrame.DeleteButtonClick(Sender: TObject);
var
  LPredicate: TTPredicate<TCompany>;
  LCompany: TCompany;
begin
  if not Assigned(FSession) then
    Exit;

  LPredicate := function(const ACompany: TCompany): Boolean
  begin
    result := (ACompany.ID = 2);
  end;

  for LCompany in FSession.Entities.Where(LPredicate) do
  begin
    FSession.Delete(LCompany);

    TOutput.Instance.Write(LCompany);
  end;
end;

procedure TTTSessionFrame.ApplyChangesButtonClick(Sender: TObject);
begin
  if Assigned(FSession) then
    FSession.ApplyChanges;
end;

end.
