(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Model7.Employee;

interface

uses
  System.Classes,
  System.SysUtils,
  Trysil.Types,
  Trysil.Attributes,
  Trysil.Lazy,
  Trysil.Events.Attributes,
  Trysil.Events,

  Trysil.DD.Output,
  Trysil.DD.Model7.Company;

type

{ Forward declaration }

  TEmployee = class;

{ TEmployeeInsertEvent }

  TEmployeeInsertEvent = class(TTEvent<TEmployee>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TEmployeeUpdateEvent }

  TEmployeeUpdateEvent = class(TTEvent<TEmployee>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TEmployeeDeleteEvent }

  TEmployeeDeleteEvent = class(TTEvent<TEmployee>)
  public
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

{ TEmployee }

  [TTable('Employees')]
  [TSequence('EmployeesID')]
  [TInsertEvent(TEmployeeInsertEvent)]
  [TUpdateEvent(TEmployeeUpdateEvent)]
  [TDeleteEvent(TEmployeeDeleteEvent)]
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

{ TEmployeeInsertEvent }

procedure TEmployeeInsertEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TEmployeeInsertEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

procedure TEmployeeInsertEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TEmployeeInsertEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

{ TEmployeeUpdateEvent }

procedure TEmployeeUpdateEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TEmployeeUpdateEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
  TOutput.Instance.Write(OldEntity);
  TOutput.Instance.Write(Entity);
end;

procedure TEmployeeUpdateEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TEmployeeUpdateEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

{ TEmployeeDeleteEvent }

procedure TEmployeeDeleteEvent.DoBefore;
begin
  inherited DoBefore;
  TOutput.Instance.Write('[TEmployeeDeleteEvent.DoBefore]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

procedure TEmployeeDeleteEvent.DoAfter;
begin
  inherited DoAfter;
  TOutput.Instance.Write('[TEmployeeDeleteEvent.DoAfter]: %s', [Entity.ToString]);
  TOutput.Instance.Write;
end;

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

