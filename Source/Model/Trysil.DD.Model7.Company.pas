(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model7.Company;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes,
  Trysil.Events.Attributes,
  Trysil.Events,

  Trysil.DD.Output;

type

{ Forward declaration }

  TCompany = class;

{ TCompanyInsertEvent }

  TCompanyInsertEvent = class(TTEvent<TCompany>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TCompanyUpdateEvent }

  TCompanyUpdateEvent = class(TTEvent<TCompany>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TCompanyDeleteEvent }

  TCompanyDeleteEvent = class(TTEvent<TCompany>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TCompany }

  [TTable('Companies')]
  [TSequence('CompaniesID')]
  [TRelation('Employees', 'CompanyID', False)]
  [TInsertEvent(TCompanyInsertEvent)]
  [TUpdateEvent(TCompanyUpdateEvent)]
  [TDeleteEvent(TCompanyDeleteEvent)]
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

{ TCompanyInsertEvent }

procedure TCompanyInsertEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TCompanyInsertEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

procedure TCompanyInsertEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TCompanyInsertEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

{ TCompanyUpdateEvent }

procedure TCompanyUpdateEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TCompanyUpdateEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
  TOutput.Instance.Write(OldEntity);
  TOutput.Instance.Write(Entity);
end;

procedure TCompanyUpdateEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TCompanyUpdateEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

{ TCompanyDeleteEvent }

procedure TCompanyDeleteEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TCompanyDeleteEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

procedure TCompanyDeleteEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TCompanyDeleteEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

{ TCompany }

function TCompany.ToString: String;
begin
  result := FName;
end;

end.


