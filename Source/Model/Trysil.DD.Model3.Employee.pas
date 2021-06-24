(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model3.Employee;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes,
  Trysil.Lazy,

  Trysil.DD.Model2.Company;

type

{ TEmployee }

  [TTable('Employees')]
  [TSequence('EmployeesID')]
  TEmployee = class
  strict private
    [TPrimaryKey]
    [TColumn('ID')]
    FID: TTPrimaryKey;

    [TColumn('Firstname')]
    FFirstname: String;

    [TColumn('Lastname')]
    FLastname: String;

    [TColumn('Email')]
    FEmail: String;

    [TColumn('CompanyID')]
    FCompany: TTLazy<TCompany>;

    [TVersionColumn]
    [TColumn('VersionID')]
    FVersionID: TTVersion;

    function GetCompany: TCompany;
    procedure SetCompany(const AValue: TCompany);
  public
    function ToString(): String; override;

    property ID: TTPrimaryKey read FID;
    property Firstname: String read FFirstname write FFirstname;
    property Lastname: String read FLastname write FLastname;
    property Email: String read FEmail write FEmail;
    property Company: TCompany read GetCompany write SetCompany;
    property VersionID: TTVersion read FVersionID;
  end;

implementation

{ TEmployee }

function TEmployee.GetCompany: TCompany;
begin
  result := FCompany.Entity;
end;

procedure TEmployee.SetCompany(const AValue: TCompany);
begin
  FCompany.Entity := AValue;
end;

function TEmployee.ToString: String;
begin
  result := Format('%s %s', [FFirstname, FLastname]);
end;

end.

