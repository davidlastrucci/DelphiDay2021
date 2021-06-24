(*

  Trysil
  Copyright � David Lastrucci
  All rights reserved

  Trysil - Operation ORM (World War II)
  http://codenames.info/operation/orm/

*)
unit Trysil.Data.SqlSyntax.FirebirdSQL;

interface

uses
  System.Classes,
  System.SysUtils,

  Trysil.Data.SqlSyntax;

type

{ TTFirebirdSQLSequenceSyntax }

  TTFirebirdSQLSequenceSyntax = class(TTSequenceSyntax)
  strict protected
    function GetSequenceSyntax: String; override;
  end;

{ TTFirebirdSQLSelectSyntax }

  TTFirebirdSQLSelectSyntax = class(TTSelectSyntax)
  strict protected
    function GetFilterTopSyntax: String; override;
  end;

{ TTFirebirdSQLVersionSyntax }

  TTFirebirdSQLVersionSyntax = class(TTVersionSyntax)
  strict protected
    function GetSQL: String; override;
  end;

{ TTFirebirdSQLSyntaxClasses }

  TTFirebirdSQLSyntaxClasses = class(TTSyntaxClasses)
  public
    function Sequence: TTSequenceSyntaxClass; override;
    function Select: TTSelectSyntaxClass; override;
    function Version: TTVersionSyntaxClass; override;
  end;

implementation

{ TTFirebirdSQLSequenceSyntax }

function TTFirebirdSQLSequenceSyntax.GetSequenceSyntax: String;
begin
  result := Format(
    'SELECT GEN_ID(%s, 1) ID FROM RDB$DATABASE', [FTableMap.SequenceName]);
end;

{ TTFirebirdSQLSelectSyntax }

function TTFirebirdSQLSelectSyntax.GetFilterTopSyntax: String;
begin
  result := Format('FIRST %d', [FFilter.Top.MaxRecord]);
end;

{ TTFirebirdSQLVersionSyntax }

function TTFirebirdSQLVersionSyntax.GetSQL: String;
begin
  result := 'SELECT rdb$get_context(''SYSTEM'', ''ENGINE_VERSION'') ' +
    'from rdb$database';
end;

{ TTFirebirdSQLSyntaxClasses }

function TTFirebirdSQLSyntaxClasses.Sequence: TTSequenceSyntaxClass;
begin
  result := TTFirebirdSQLSequenceSyntax;
end;

function TTFirebirdSQLSyntaxClasses.Select: TTSelectSyntaxClass;
begin
  result := TTFirebirdSQLSelectSyntax;
end;

function TTFirebirdSQLSyntaxClasses.Version: TTVersionSyntaxClass;
begin
  result := TTFirebirdSQLVersionSyntax;
end;

end.
