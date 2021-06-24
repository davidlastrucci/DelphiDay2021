(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model2.Company;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes;

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

    [TVersionColumn]
    [TColumn('VersionID')]
    FVersionID: TTVersion;
  public
    function ToString(): String; override;

    property ID: TTPrimaryKey read FID;
    property Name: String read FName write FName;
    property Address: String read FAddress write FAddress;
    property City: String read FCity write FCity;
    property Country: String read FCountry write FCountry;
    property VersionID: TTVersion read FVersionID;
  end;

implementation

{ TCompany }

function TCompany.ToString: String;
begin
  result := FName;
end;

end.


