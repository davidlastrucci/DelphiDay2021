(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Connection.Factory;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.IniFiles,
  Trysil.Data,
  Trysil.Data.FireDAC.FirebirdSQL,
  Trysil.Data.FireDAC.SQLite,
  Trysil.Data.FireDAC.SqlServer;

type

{ TConnectionType }

  TConnectionType = (FirebirdSQL, SQLite, SqlServer);

{ TConnectionFactory }

  TConnectionFactory = class
  strict private
    const ConnectionName: String = 'Employees';

    class var FInstance: TConnectionFactory;
    class constructor ClassCreate;
    class destructor ClassDestroy;
    class function GetInstance: TConnectionFactory; static;

    function GetFirebirdSQLConnectionName: String;
    procedure RegisterFirebirdSQLConnection(const AIniFile: TIniFile);
    function CreateFirebirdSQLConnection: TTConnection;

    function GetSQLiteConnectionName: String;
    procedure RegisterSQLiteConnection(const AIniFile: TIniFile);
    function CreateSQLiteConnection: TTConnection;

    function GetSqlServerConnectionName: String;
    procedure RegisterSqlServerConnection(const AIniFile: TIniFile);
    function CreateSqlServerConnection: TTConnection;
  public
    procedure AfterConstruction; override;

    function CreateConnection(
      const AConnectionType: TConnectionType): TTConnection;

    class property Instance: TConnectionFactory read GetInstance;
  end;

implementation

{ TConnectionFactory }

class constructor TConnectionFactory.ClassCreate;
begin
  FInstance := nil;
end;

class destructor TConnectionFactory.ClassDestroy;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

class function TConnectionFactory.GetInstance: TConnectionFactory;
begin
  if not Assigned(FInstance) then
    FInstance := TConnectionFactory.Create;
  result := FInstance;
end;

procedure TConnectionFactory.AfterConstruction;
var
  LFileName: String;
  LIniFile: TIniFile;
begin
  inherited AfterConstruction;
  LFileName := TPath.ChangeExtension(ParamStr(0), '.ini');
  if not TFile.Exists(LFileName) then
    raise Exception.Create('Impossibile trovare il file di configurazione ' +
      'Trysil.DD.ini.' + #10#13 + #10#13 +
      'Il file di esempio si trova nella cartella del ' +
      'progetto e deve essere copiato nella cartella dell''applicazione compilata.');

  LIniFile := TIniFile.Create(LFileName);
  try
    RegisterFirebirdSQLConnection(LIniFile);
    RegisterSQLiteConnection(LIniFile);
    RegisterSqlServerConnection(LIniFile);
  finally
    LIniFile.Free;
  end;
end;

function TConnectionFactory.CreateConnection(
  const AConnectionType: TConnectionType): TTConnection;
begin
  case AConnectionType of
    TConnectionType.FirebirdSQL:
      result := CreateFirebirdSQLConnection;

    TConnectionType.SQLite:
      result := CreateSQLiteConnection;

    TConnectionType.SqlServer:
      result := CreateSqlServerConnection;

    else
      raise Exception.Create('Tipo connessione non previsto.');
  end;
end;

function TConnectionFactory.GetFirebirdSQLConnectionName: String;
begin
  result := Format('FirebirdSQL_%s', [ConnectionName]);
end;

procedure TConnectionFactory.RegisterFirebirdSQLConnection(
  const AIniFile: TIniFile);
var
  LParams: TStrings;
begin
  LParams := TStringList.Create;
  try
    LParams.Add('Protocol=TCPIP');
    LParams.Add(Format('Server=%s', [AIniFile.ReadString('FirebirdSQL', 'Server', '')]));
    LParams.Add(Format('Database=%s', [AIniFile.ReadString('FirebirdSQL', 'Database', '')]));
    LParams.Add(Format('User_Name=%s', [AIniFile.ReadString('FirebirdSQL', 'Username', '')]));
    LParams.Add(Format('Password=%s', [AIniFile.ReadString('FirebirdSQL', 'Password', '')]));
    LParams.Add('CharacterSet=UNICODE_FSS');

    TTFirebirdSQLConnection.RegisterConnection(
      GetFirebirdSQLConnectionName, LParams);
  finally
    LParams.Free;
  end;
end;

function TConnectionFactory.CreateFirebirdSQLConnection: TTConnection;
begin
  result := TTFirebirdSQLConnection.Create(GetFirebirdSQLConnectionName);
end;

function TConnectionFactory.GetSQLiteConnectionName: String;
begin
  result := Format('SQLite_%s', [ConnectionName]);
end;

procedure TConnectionFactory.RegisterSQLiteConnection(const AIniFile: TIniFile);
begin
  TTSQLiteConnection.RegisterConnection(
    GetSQLiteConnectionName,
    AIniFile.ReadString('SQLite', 'Database', ''));
end;

function TConnectionFactory.CreateSQLiteConnection: TTConnection;
begin
  result := TTSQLiteConnection.Create(GetSQLiteConnectionName);
end;

function TConnectionFactory.GetSqlServerConnectionName: String;
begin
  result := Format('SqlServer_%s', [ConnectionName]);
end;

procedure TConnectionFactory.RegisterSqlServerConnection(
  const AIniFile: TIniFile);
begin
  TTSqlServerConnection.RegisterConnection(
    GetSqlServerConnectionName,
    AIniFile.ReadString('SQLServer', 'Server', ''),
    AIniFile.ReadString('SQLServer', 'Username', ''),
    AIniFile.ReadString('SQLServer', 'Password', ''),
    AIniFile.ReadString('SQLServer', 'Database', ''));
end;

function TConnectionFactory.CreateSqlServerConnection: TTConnection;
begin
  result := TTSqlServerConnection.Create(GetSqlServerConnectionName);
end;

end.
