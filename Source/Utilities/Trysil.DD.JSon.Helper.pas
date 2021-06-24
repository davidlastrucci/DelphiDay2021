(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.JSon.Helper;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSon;

type

{ TJSonHelper }

  TJSonHelper = class helper for TJSonValue
  strict private
    function Spaces(const AOffset: Integer): String;
  public
    function PrettyPrint: String;
  end;

implementation

{ TJSonHelper }

function TJSonHelper.Spaces(const AOffset: Integer): String;
begin
  result := String.Create(' ', AOffset * 2);
end;

function TJSonHelper.PrettyPrint: String;
var
  LStringBuilder: TStringBuilder;
  LOffset: Integer;
  LOutsideString: Boolean;
  LValue: String;
  LChar: Char;
begin
  LStringBuilder := TStringBuilder.Create;
  try
    LOffset := 0;
    LOutsideString := True;
    LValue := Self.ToJSon;
    for LChar in LValue do
    begin
      if LChar = '"' then
        LOutsideString := not LOutsideString;
      if LOutsideString and (LChar = '{') then
      begin
        Inc(LOffset);
        LStringBuilder.Append(LChar);
        LStringBuilder.AppendLine;
        LStringBuilder.Append(Spaces(LOffset));
      end
      else if LOutsideString and (LChar = '}') then
      begin
        Dec(LOffset);
        LStringBuilder.AppendLine;
        LStringBuilder.Append(Spaces(LOffset));
        LStringBuilder.Append(LChar);
      end
      else if LOutsideString and (LChar = ',') then
      begin
        LStringBuilder.Append(LChar);
        LStringBuilder.AppendLine;
        LStringBuilder.Append(Spaces(LOffset));
      end
      else if LOutsideString and (LChar = '[') then
      begin
        Inc(LOffset);
        LStringBuilder.Append(LChar);
        LStringBuilder.AppendLine;
        LStringBuilder.Append(Spaces(LOffset));
      end
      else if LOutsideString and (LChar = ']') then
      begin
        Dec(LOffset);
        LStringBuilder.AppendLine;
        LStringBuilder.Append(Spaces(LOffset));
        LStringBuilder.Append(LChar);
      end
      else if LOutsideString and (LChar = ':') then
      begin
        LStringBuilder.Append(LChar);
        LStringBuilder.Append(' ');
      end
      else
        LStringBuilder.Append(LChar);
    end;
    result := LStringBuilder.ToString();
  finally
    LStringBuilder.Free;
  end;
end;

end.

