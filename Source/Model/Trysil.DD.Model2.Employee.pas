(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model2.Employee;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes;

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
    FCompanyID: TTPrimaryKey;

    [TVersionColumn]
    [TColumn('VersionID')]
    FVersionID: TTVersion;

  public
    function ToString(): String; override;

    property ID: TTPrimaryKey read FID;
    property Firstname: String read FFirstname write FFirstname;
    property Lastname: String read FLastname write FLastname;
    property Email: String read FEmail write FEmail;
    property CompanyID: TTPrimaryKey read FCompanyID write FCompanyID;
    property VersionID: TTVersion read FVersionID;
  end;

implementation

{ TEmployee }

function TEmployee.ToString: String;
begin
  result := Format('%s %s', [FFirstname, FLastname]);
end;

end.

