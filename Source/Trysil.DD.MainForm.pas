(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.MainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.PngImage,
  FireDAC.ConsoleUI.Wait,
  FireDAC.VCLUI.Wait,
  Trysil.Data,
  Trysil.Logger,

  Trysil.DD.Connection.Factory,
  Trysil.DD.Output,
  Trysil.DD.LoggerThread,
  Trysil.DD.Frame.Base,
  Trysil.DD.Frame.TTContext,
  Trysil.DD.Frame.TTMetaData,
  Trysil.DD.Frame.TTIdentityMap,
  Trysil.DD.Frame.TTLazy,
  Trysil.DD.Frame.TTLazyList,
  Trysil.DD.Frame.NotLazy,
  Trysil.DD.Frame.NotLazyList,
  Trysil.DD.Frame.TTSession,
  Trysil.DD.Frame.TTEvents;

type

{ TMainForm }

  TMainForm = class(TForm)
    ImageList: TImageList;
    ActionManager: TActionManager;
    FirebirdSQLConnectionAction: TAction;
    SQLiteConnectionAction: TAction;
    SqlServerConnectionAction: TAction;
    TTContextAction: TAction;
    TTMetadataAction: TAction;
    TTIdentityMapAction: TAction;
    TTLazyAction: TAction;
    TTLazyListAction: TAction;
    NotLazyAction: TAction;
    NotLazyListAction: TAction;
    TTSessionAction: TAction;
    TTEventAction: TAction;
    ToolbarPanel: TPanel;
    TrysilContainer: TPanel;
    TrysilImage: TImage;
    ClearLogButton: TSpeedButton;
    LeftToolbarPanel: TPanel;
    DatabaseToolbarPanel: TPanel;
    DatabaseTitleLabel: TLabel;
    SeparatorDatabaseTitlePanel: TPanel;
    FirebirdSQLButton: TSpeedButton;
    SQLiteButton: TSpeedButton;
    SqlServerButton: TSpeedButton;
    SamplesToolbar: TPanel;
    SamplesTitleLabel: TLabel;
    SeparatorSamplesTitlePanel: TPanel;
    TTContextButton: TSpeedButton;
    TTMetaDataButton: TSpeedButton;
    TTIdentityMapButton: TSpeedButton;
    TTLazyButton: TSpeedButton;
    TTLazyListButton: TSpeedButton;
    NotLazyButton: TSpeedButton;
    NotLazyListButton: TSpeedButton;
    TTSessionButton: TSpeedButton;
    TTEventButton: TSpeedButton;
    ContainerFramePanel: TPanel;
    LogContainerPanel: TPanel;
    LogMemo: TMemo;
    StatusBar: TPanel;
    DatabaseConnectionLabelLabel: TLabel;
    DatabaseConnectionLabel: TLabel;
    procedure FormResize(Sender: TObject);
    procedure ActionManagerUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FirebirdSQLConnectionActionExecute(Sender: TObject);
    procedure SQLiteConnectionActionExecute(Sender: TObject);
    procedure SqlServerConnectionActionExecute(Sender: TObject);
    procedure TTContextActionExecute(Sender: TObject);
    procedure TTMetadataActionExecute(Sender: TObject);
    procedure TTIdentityMapActionExecute(Sender: TObject);
    procedure TTLazyActionExecute(Sender: TObject);
    procedure TTLazyListActionExecute(Sender: TObject);
    procedure NotLazyActionExecute(Sender: TObject);
    procedure NotLazyListActionExecute(Sender: TObject);
    procedure TTSessionActionExecute(Sender: TObject);
    procedure TTEventActionExecute(Sender: TObject);
    procedure ClearLogButtonClick(Sender: TObject);
  strict private
    FConnection: TTConnection;
    FActiveFrame: TBaseFrame;

    procedure CreateConnection(const AConnectionType: TConnectionType);
    procedure ClearActiveFrame;
    procedure LogDatabaseVersion;
    procedure OpenFrame<T: TBaseFrame>();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AfterConstruction; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConnection := nil;
  FActiveFrame := nil;
end;

destructor TMainForm.Destroy;
begin
  if Assigned(FActiveFrame) then
    FActiveFrame.Free;
  if Assigned(FConnection) then
    FConnection.Free;
  inherited Destroy;
end;

procedure TMainForm.AfterConstruction;
begin
  inherited AfterConstruction;
  TOutput.Instance.Output := LogMemo.Lines;
  TTLogger.Instance.RegisterLogger<TLoggerThread>();
end;

procedure TMainForm.CreateConnection(const AConnectionType: TConnectionType);
begin
  ClearActiveFrame;
  if Assigned(FConnection) then
    FConnection.Free;
  FConnection := TConnectionFactory.Instance.CreateConnection(AConnectionType);
  LogDatabaseVersion;
end;

procedure TMainForm.ClearActiveFrame;
begin
  if Assigned(FActiveFrame) then
  begin
    FActiveFrame.Free;
    FActiveFrame := nil;
  end;
end;

procedure TMainForm.LogDatabaseVersion;
begin
  TOutput.Instance.Clear;
  TOutput.Instance.Write('Database version');
  TOutput.Instance.Write('-----------------');
  TOutput.Instance.Write(
    FConnection.DatabaseVersion
      .Replace(#10, #13#10, [rfReplaceAll])
      .Replace(#9, '  ', [rfReplaceAll]));
  TOutput.Instance.Write;

  DatabaseConnectionLabel.Caption := FConnection.ClassName;
end;

procedure TMainForm.FormResize(Sender: TObject);
var
  LRect: TRect;
begin
  LRect := Rect(12, 12, LogMemo.Width - 24, LogMemo.Height - 24);
  SendMessage(LogMemo.Handle, EM_SETRECT, 0, LongInt(@LRect));
end;

procedure TMainForm.ActionManagerUpdate(
  Action: TBasicAction; var Handled: Boolean);
begin
  SamplesToolbar.Visible := Assigned(FConnection);
  Handled := True;
end;

procedure TMainForm.FirebirdSQLConnectionActionExecute(Sender: TObject);
begin
  CreateConnection(TConnectionType.FirebirdSQL);
end;

procedure TMainForm.SQLiteConnectionActionExecute(Sender: TObject);
begin
  CreateConnection(TConnectionType.SQLite);
end;

procedure TMainForm.SqlServerConnectionActionExecute(Sender: TObject);
begin
  CreateConnection(TConnectionType.SqlServer);
end;

procedure TMainForm.ClearLogButtonClick(Sender: TObject);
begin
  TOutput.Instance.Clear;
end;

procedure TMainForm.OpenFrame<T>();
begin
  ClearActiveFrame;
  FActiveFrame := T.Create(ContainerFramePanel, FConnection);
end;

procedure TMainForm.TTContextActionExecute(Sender: TObject);
begin
  OpenFrame<TTTContextFrame>();
end;

procedure TMainForm.TTMetadataActionExecute(Sender: TObject);
begin
  OpenFrame<TTTMetaDataFrame>();
end;

procedure TMainForm.TTIdentityMapActionExecute(Sender: TObject);
begin
  OpenFrame<TTTIdentityMapFrame>();
end;

procedure TMainForm.TTLazyActionExecute(Sender: TObject);
begin
  OpenFrame<TTTLazyFrame>();
end;

procedure TMainForm.TTLazyListActionExecute(Sender: TObject);
begin
  OpenFrame<TTTLazyListFrame>();
end;

procedure TMainForm.NotLazyActionExecute(Sender: TObject);
begin
  OpenFrame<TNotLazyFrame>();
end;

procedure TMainForm.NotLazyListActionExecute(Sender: TObject);
begin
  OpenFrame<TNotLazyListFrame>();
end;

procedure TMainForm.TTSessionActionExecute(Sender: TObject);
begin
  OpenFrame<TTTSessionFrame>();
end;

procedure TMainForm.TTEventActionExecute(Sender: TObject);
begin
  OpenFrame<TTTEventsFrame>();
end;

end.
