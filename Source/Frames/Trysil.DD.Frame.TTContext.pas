(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.TTContext;

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
  Trysil.Filter,

  Trysil.DD.Output,
  Trysil.DD.Model2.Company,
  Trysil.DD.Model2.Employee,
  Trysil.DD.Frame.Base;

type

{ TTTContextFrame }

  TTTContextFrame = class(TBaseFrame)
    GetCompanyButton: TSpeedButton;
    SelectAllCompanyButton: TSpeedButton;
    SelectCompanyButton: TSpeedButton;
    Separator1Panel: TPanel;
    GetEmployeeButton: TSpeedButton;
    SelectAllEmployeeButton: TSpeedButton;
    SelectEmployeeButton: TSpeedButton;
    Separator2Panel: TPanel;
    InsertCompanyButton: TSpeedButton;
    UpdateCompanyButton: TSpeedButton;
    DeleteCompanyButton: TSpeedButton;
    procedure GetCompanyButtonClick(Sender: TObject);
    procedure SelectAllCompanyButtonClick(Sender: TObject);
    procedure SelectCompanyButtonClick(Sender: TObject);
    procedure GetEmployeeButtonClick(Sender: TObject);
    procedure SelectAllEmployeeButtonClick(Sender: TObject);
    procedure SelectEmployeeButtonClick(Sender: TObject);
    procedure InsertCompanyButtonClick(Sender: TObject);
    procedure UpdateCompanyButtonClick(Sender: TObject);
    procedure DeleteCompanyButtonClick(Sender: TObject);
  strict private
    FContext: TTContext;
    FCompany: TCompany;
  public
    constructor Create(
      const AParent: TWinControl; const AConnection: TTConnection); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TTTContextFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(AParent, AConnection);
  FContext := TTContext.Create(FConnection);
end;

destructor TTTContextFrame.Destroy;
begin
  FContext.Free;
  inherited Destroy;
end;

procedure TTTContextFrame.GetCompanyButtonClick(Sender: TObject);
var
  LCompany: TCompany;
begin
  LCompany := FContext.Get<TCompany>(1);
  TOutput.Instance.Write(LCompany);
end;

procedure TTTContextFrame.SelectAllCompanyButtonClick(Sender: TObject);
var
  LCompanies: TTList<TCompany>;
  LPredicate: TTPredicate<TCompany>;
  LCompany: TCompany;
begin
  LCompanies := TTList<TCompany>.Create;
  try
    FContext.SelectAll<TCompany>(LCompanies);

    TOutput.Instance.Write('Companies: %d', [LCompanies.Count]);
    TOutput.Instance.Write;

    LPredicate := function(const ACompany: TCompany): Boolean
    begin
      result := ((ACompany.ID > 1) and (ACompany.ID < 4));
    end;

    for LCompany in LCompanies.Where(LPredicate) do
      TOutput.Instance.Write(LCompany);
  finally
    LCompanies.Free;
  end;
end;

procedure TTTContextFrame.SelectCompanyButtonClick(Sender: TObject);
var
  LCompanies: TTList<TCompany>;
  LFilter: TTFilter;
  LCompany: TCompany;
begin
  LCompanies := TTList<TCompany>.Create;
  try
    LFilter := TTFilter.Create('ID IN (4, 5)');
    FContext.Select<TCompany>(LCompanies, LFilter);
    TOutput.Instance.Write('Companies: %d', [LCompanies.Count]);
    TOutput.Instance.Write;

    for LCompany in LCompanies do
      TOutput.Instance.Write(LCompany);
  finally
    LCompanies.Free;
  end;
end;

procedure TTTContextFrame.GetEmployeeButtonClick(Sender: TObject);
var
  LEmployee: TEmployee;
begin
  LEmployee := FContext.Get<TEmployee>(1);
  TOutput.Instance.Write(LEmployee);
end;

procedure TTTContextFrame.SelectAllEmployeeButtonClick(Sender: TObject);
var
  LEmployees: TTList<TEmployee>;
  LPredicate: TTPredicate<TEmployee>;
  LEmployee: TEmployee;
begin
  LEmployees := TTList<TEmployee>.Create;
  try
    FContext.SelectAll<TEmployee>(LEmployees);

    TOutput.Instance.Write('Employees: %d', [LEmployees.Count]);
    TOutput.Instance.Write;

    LPredicate := function(const AEmployee: TEmployee): Boolean
    begin
      result := ((AEmployee.ID > 1) and (AEmployee.ID < 4));
    end;

    for LEmployee in LEmployees.Where(LPredicate) do
      TOutput.Instance.Write(LEmployee);
  finally
    LEmployees.Free;
  end;
end;

procedure TTTContextFrame.SelectEmployeeButtonClick(Sender: TObject);
var
  LEmployees: TTList<TEmployee>;
  LFilter: TTFilter;
  LEmployee: TEmployee;
begin
  LEmployees := TTList<TEmployee>.Create;
  try
    LFilter := TTFilter.Create('ID IN (4, 5)');
    FContext.Select<TEmployee>(LEmployees, LFilter);
    TOutput.Instance.Write('Employees: %d', [LEmployees.Count]);
    TOutput.Instance.Write;

    for LEmployee in LEmployees do
      TOutput.Instance.Write(LEmployee);
  finally
    LEmployees.Free;
  end;
end;

procedure TTTContextFrame.InsertCompanyButtonClick(Sender: TObject);
begin
  FCompany := FContext.CreateEntity<TCompany>();
  FCompany.Name := 'Open Source Italia S.r.l.';
  FCompany.Address := 'Via del Molinuzzo, 93';

  FContext.Insert<TCompany>(FCompany);

  TOutput.Instance.Write(FCompany);
end;

procedure TTTContextFrame.UpdateCompanyButtonClick(Sender: TObject);
begin
  FCompany.City := 'Prato';
  FCompany.Country := 'Italia';

  FContext.Update<TCompany>(FCompany);

  TOutput.Instance.Write(FCompany);
end;

procedure TTTContextFrame.DeleteCompanyButtonClick(Sender: TObject);
var
  LName: String;
begin
  LName := FCompany.ToString;
  FContext.Delete<TCompany>(FCompany);
  TOutput.Instance.Write('Company "%s" eliminata.', [LName]);
end;

end.
