(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model1.Company;

interface

uses
  System.Classes,
  System.SysUtils;

type

{ TCompany }

  TCompany = class
  strict private
    FID: Integer;
    FName: String;
    FAddress: String;
    FCity: String;
    FCountry: String;
    FVersionID: Integer;
  public
    function ToString(): String; override;

    property ID: Integer read FID;
    property Name: String read FName write FName;
    property Address: String read FAddress write FAddress;
    property City: String read FCity write FCity;
    property Country: String read FCountry write FCountry;
    property VersionID: Integer read FVersionID;
  end;

implementation

{ TCompany }

function TCompany.ToString: String;
begin
  result := FName;
end;

end.


