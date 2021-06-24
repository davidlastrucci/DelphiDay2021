(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model6.Company;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  Trysil.Types,
  Trysil.Attributes,

  Trysil.DD.Model4.Employee;

type

{ TCompany }

  [TTable('Companies')]
  [TSequence('CompaniesID')]
  TCompany = class
  strict private
    [TPrimaryKey]
    [TColumn('ID')]
    FID: TTPrimaryKey;

    [TColumn('Name')]
    FName: String;

    [TColumn('Address')]
    FAddress: String;

    [TColumn('City')]
    FCity: String;

    [TColumn('Country')]
    FCountry: String;

    [TDetailColumn('ID', 'CompanyID')]
    FEmployees: TObjectList<TEmployee>;

    [TVersionColumn]
    [TColumn('VersionID')]
    FVersionID: TTVersion;
  public
    constructor Create;
    destructor Destroy; override;

    function ToString(): String; override;

    property ID: TTPrimaryKey read FID;
    property Name: String read FName write FName;
    property Address: String read FAddress write FAddress;
    property City: String read FCity write FCity;
    property Country: String read FCountry write FCountry;
    property Employees: TObjectList<TEmployee> read FEmployees;
    property VersionID: TTVersion read FVersionID;
  end;

implementation

{ TCompany }

constructor TCompany.Create;
begin
  inherited Create;
  FEmployees := TObjectList<TEmployee>.Create(True);
end;

destructor TCompany.Destroy;
begin
  FEmployees.Free;
  inherited Destroy;
end;

function TCompany.ToString: String;
begin
  result := FName;
end;

end.


