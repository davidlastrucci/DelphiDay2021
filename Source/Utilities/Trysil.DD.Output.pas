(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Output;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti;

type

{ TOutput }

  TOutput = class
  strict private
    class var FInstance: TOutput;

    class constructor ClassCreate;
    class destructor ClassDestroy;
  strict private
    FOutput: TStrings;
    FShowAddress: Boolean;
    FShowObjects: Boolean;
  public
    constructor Create;

    procedure Clear;

    procedure Write; overload;
    procedure Write(const ALine: String); overload;
    procedure Write(const AFormat: String; const AArgs: array of const); overload;
    procedure Write(const AObject: TObject); overload;

    property Output: TStrings read FOutput write FOutput;
    property ShowAddress: Boolean read FShowAddress write FShowAddress;
    property ShowObjects: Boolean read FShowObjects write FShowObjects;

    class property Instance: TOutput read FInstance;
  end;

implementation

{ TOutput }

class constructor TOutput.ClassCreate;
begin
  FInstance := TOutput.Create;
end;

class destructor TOutput.ClassDestroy;
begin
  FInstance.Free;
end;

constructor TOutput.Create;
begin
  FOutput := nil;
  FShowAddress := False;
  FShowObjects := True;
end;

procedure TOutput.Clear;
begin
  if Assigned(FOutput) then
    FOutput.Clear;
end;

procedure TOutput.Write(const ALine: String);
begin
  if Assigned(FOutput) then
    FOutput.Add(ALine);
end;

procedure TOutput.Write;
begin
  if Assigned(FOutput) then
    FOutput.Add('');
end;

procedure TOutput.Write(const AFormat: String; const AArgs: array of const);
begin
  if Assigned(FOutput) then
    FOutput.Add(Format(AFormat, AArgs));
end;

procedure TOutput.Write(const AObject: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  if not Assigned(FOutput) then
    Exit;

  LContext := TRttiContext.Create;
  try
    LType := LContext.GetType(AObject.ClassType);
    Write(LType.Name);
    Write(String.Create('-', LType.Name.Length + 1));
    for LProperty in LType.GetProperties do
      if FShowObjects or (
        LProperty.PropertyType.TypeKind <> TTypeKind.tkClass) then
        Write('%s: %s', [LProperty.Name, LProperty.GetValue(AObject).ToString]);

    if FShowAddress then
      Write('@Address: %s', [IntToHex(Integer(AObject))]);

    Write;
  finally
    LContext.Free;
  end;
end;

end.
