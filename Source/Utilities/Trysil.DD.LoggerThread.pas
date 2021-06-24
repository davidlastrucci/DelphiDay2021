(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.LoggerThread;

interface

uses
  System.SysUtils,
  System.Classes,
  CodeSiteLogging,
  Trysil.Logger;

type

{ TLoggerThread }

  TLoggerThread = class(TTLoggerThread)
  strict private
    function GetMessage(const AMessage: String): String;
  strict protected
    procedure LogStartTransaction; override;
    procedure LogCommit; override;
    procedure LogRollback; override;
    procedure LogParameter(const AName: String; const AValue: String); override;
    procedure LogSyntax(const ASyntax: String); override;
    procedure LogCommand(const ASyntax: String); override;
    procedure LogError(const AMessage: String); override;
  end;

implementation

{ TLoggerThread }

function TLoggerThread.GetMessage(const AMessage: String): String;
begin
  result := Format('[%0:s] %1:s', [
    FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz', now), AMessage]);
end;

procedure TLoggerThread.LogStartTransaction;
begin
  CodeSite.EnterMethod('StartTransaction');
end;

procedure TLoggerThread.LogCommit;
begin
  CodeSite.ExitMethod('Commit');
end;

procedure TLoggerThread.LogRollback;
begin
  CodeSite.ExitMethod('Rollback');
end;

procedure TLoggerThread.LogParameter(const AName: String; const AValue: String);
begin
  CodeSite.Send(GetMessage(Format('    :%0:s="%1:s"', [AName, AValue])));
end;

procedure TLoggerThread.LogSyntax(const ASyntax: String);
begin
  CodeSite.Send(GetMessage(ASyntax));
end;

procedure TLoggerThread.LogCommand(const ASyntax: String);
begin
  CodeSite.Send(GetMessage(ASyntax));
end;

procedure TLoggerThread.LogError(const AMessage: String);
begin
  CodeSite.SendError(GetMessage(AMessage));
end;

end.
