(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTEvents;

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
  Trysil.DD.Model7.Company,
  Trysil.DD.Model7.Employee,
  Trysil.DD.Frame.Base;

type

{ TTTEventsFrame }

  TTTEventsFrame = class(TBaseFrame)
    InsertCompanyButton: TSpeedButton;
    UpdateCompanyButton: TSpeedButton;
    SeparatorPanel01: TPanel;
    InsertEmployeeButton: TSpeedButton;
    UpdateEmployeeButton: TSpeedButton;
    SeparatorPanel02: TPanel;
    DeleteEmployeeButton: TSpeedButton;
    DeleteCompanyButton: TSpeedButton;
    procedure InsertCompanyButtonClick(Sender: TObject);
    procedure UpdateCompanyButtonClick(Sender: TObject);
    procedure InsertEmployeeButtonClick(Sender: TObject);
    procedure UpdateEmployeeButtonClick(Sender: TObject);
    procedure DeleteCompanyButtonClick(Sender: TObject);
    procedure DeleteEmployeeButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;

    FCompany: TCompany;
    FEmployee: TEmployee;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TTTEventsFrame }

constructor TTTEventsFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
end;

destructor TTTEventsFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TTTEventsFrame.InsertCompanyButtonClick(Sender: TObject);
begin
  FCompany := FContext.CreateEntity<TCompany>();
  FCompany.Name := 'Open Source Italia S.r.l.';
  FCompany.Address := 'Via del Molinuzzo, 93';

  FContext.Insert<TCompany>(FCompany);

  TOutput.Instance.Write(FCompany);
end;

procedure TTTEventsFrame.UpdateCompanyButtonClick(Sender: TObject);
begin
  if not Assigned(FCompany) then
    Exit;

  FCompany.City := 'Prato';
  FCompany.Country := 'Italia';

  FContext.Update<TCompany>(FCompany);

  TOutput.Instance.Write(FCompany);
end;

procedure TTTEventsFrame.InsertEmployeeButtonClick(Sender: TObject);
begin
  FEmployee := FContext.CreateEntity<TEmployee>();
  FEmployee.Firstname := 'David';
  FEmployee.Lastname := 'Lastrucci';

  FContext.Insert<TEmployee>(FEmployee);

  TOutput.Instance.Write(FEmployee);
end;

procedure TTTEventsFrame.UpdateEmployeeButtonClick(Sender: TObject);
begin
  if not Assigned(FEmployee) then
    Exit;

  FEmployee.Email := 'david.lastrucci@ositalia.com';
  FEmployee.Company := FCompany;

  FContext.Update<TEmployee>(FEmployee);

  TOutput.Instance.Write(FEmployee);
end;

procedure TTTEventsFrame.DeleteEmployeeButtonClick(Sender: TObject);
var
  LValue: String;
begin
  if not Assigned(FEmployee) then
    Exit;

  LValue := FEmployee.ToString;
  try
    FContext.Delete<TEmployee>(FEmployee);
    TOutput.Instance.Write('Employee "%s" eliminato.', [LValue]);
  except
    on E: Exception do
    begin
      TOutput.Instance.Write('Errore');
      TOutput.Instance.Write('-------');
      TOutput.Instance.Write('Employee "%s" non eliminato.', [LValue]);
      TOutput.Instance.Write(E.Message);
    end;
  end;
  TOutput.Instance.Write;
end;

procedure TTTEventsFrame.DeleteCompanyButtonClick(Sender: TObject);
var
  LValue: String;
begin
  if not Assigned(FCompany) then
    Exit;

  LValue := FCompany.ToString;
  try
    FContext.Delete<TCompany>(FCompany);
    TOutput.Instance.Write('Company "%s" eliminata.', [LValue]);
  except
    on E: Exception do
    begin
      TOutput.Instance.Write('Errore');
      TOutput.Instance.Write('-------');
      TOutput.Instance.Write('Company "%s" non eliminata.', [LValue]);
      TOutput.Instance.Write(E.Message);
    end;
  end;
  TOutput.Instance.Write;
end;

end.
