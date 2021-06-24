(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
program Trysil.DD;

uses
  Vcl.Forms,
  Trysil.DD.Output in 'Utilities\Trysil.DD.Output.pas',
  Trysil.DD.LoggerThread in 'Utilities\Trysil.DD.LoggerThread.pas',
  Trysil.DD.Connection.Factory in 'Utilities\Trysil.DD.Connection.Factory.pas',
  Trysil.DD.JSon.Helper in 'Utilities\Trysil.DD.JSon.Helper.pas',
  Trysil.DD.Model1.Company in 'Model\Trysil.DD.Model1.Company.pas',
  Trysil.DD.Model2.Company in 'Model\Trysil.DD.Model2.Company.pas',
  Trysil.DD.Model2.Employee in 'Model\Trysil.DD.Model2.Employee.pas',
  Trysil.DD.Model3.Employee in 'Model\Trysil.DD.Model3.Employee.pas',
  Trysil.DD.Model4.Company in 'Model\Trysil.DD.Model4.Company.pas',
  Trysil.DD.Model4.Employee in 'Model\Trysil.DD.Model4.Employee.pas',
  Trysil.DD.Model5.Employee in 'Model\Trysil.DD.Model5.Employee.pas',
  Trysil.DD.Model6.Company in 'Model\Trysil.DD.Model6.Company.pas',
  Trysil.DD.Model7.Company in 'Model\Trysil.DD.Model7.Company.pas',
  Trysil.DD.Model7.Employee in 'Model\Trysil.DD.Model7.Employee.pas',
  Trysil.DD.Frame.Base in 'Frames\Trysil.DD.Frame.Base.pas' {BaseFrame: TFrame},
  Trysil.DD.Frame.TTContext in 'Frames\Trysil.DD.Frame.TTContext.pas' {TTContextFrame: TFrame},
  Trysil.DD.Frame.TTMetaData in 'Frames\Trysil.DD.Frame.TTMetaData.pas' {TTMetadataFrame: TFrame},
  Trysil.DD.Frame.TTIdentityMap in 'Frames\Trysil.DD.Frame.TTIdentityMap.pas' {TTIdentityMapFrame: TFrame},
  Trysil.DD.Frame.TTLazy in 'Frames\Trysil.DD.Frame.TTLazy.pas' {TTLazyFrame: TFrame},
  Trysil.DD.Frame.TTLazyList in 'Frames\Trysil.DD.Frame.TTLazyList.pas' {TTLazyListFrame: TFrame},
  Trysil.DD.Frame.NotLazy in 'Frames\Trysil.DD.Frame.NotLazy.pas' {NotLazyFrame: TFrame},
  Trysil.DD.Frame.NotLazyList in 'Frames\Trysil.DD.Frame.NotLazyList.pas' {NotLazyListFrame: TFrame},
  Trysil.DD.Frame.TTSession in 'Frames\Trysil.DD.Frame.TTSession.pas' {TTSessionFrame: TFrame},
  Trysil.DD.Frame.TTEvents in 'Frames\Trysil.DD.Frame.TTEvents.pas' {TTEventsFrame: TFrame},
  Trysil.DD.MainForm in 'Trysil.DD.MainForm.pas' {MainForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Trysil: un ORM "light" per Delphi';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
