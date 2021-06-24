(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model5.Employee;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes,

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
    FCompany: TCompany;

    [TVersionColumn]
    [TColumn('VersionID')]
    FVersionID: TTVersion;

    procedure SetCompany(const AValue: TCompany);
  public
    constructor Create;
    destructor Destroy; override;

    function ToString(): String; override;

    property ID: TTPrimaryKey read FID;
    property Firstname: String read FFirstname write FFirstname;
    property Lastname: String read FLastname write FLastname;
    property Email: String read FEmail write FEmail;
    property Company: TCompany read FCompany write SetCompany;
    property VersionID: TTVersion read FVersionID;
  end;

implementation

{ TEmployee }

constructor TEmployee.Create;
begin
  inherited Create;
  FCompany := TCompany.Create;
end;

destructor TEmployee.Destroy;
begin
  FCompany.Free;
  inherited Destroy;
end;

procedure TEmployee.SetCompany(const AValue: TCompany);
begin
  if FCompany <> AValue then
  begin
    FCompany.Free;
    FCompany := AValue;
  end;
end;

function TEmployee.ToString: String;
begin
  result := Format('%s %s', [FFirstname, FLastname]);
end;

end.


