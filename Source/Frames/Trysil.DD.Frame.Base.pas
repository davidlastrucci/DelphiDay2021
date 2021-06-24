(*

  Trysil: Un ORM "light" per Delphi
  Delphi Day 2021

*)
unit Trysil.DD.Frame.Base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Trysil.Data,

  Trysil.DD.Output;

type

{ TBaseFrame }

  TBaseFrame = class(TFrame)
    TitleLabel: TLabel;
    SeparatorTitlePanel: TPanel;
    ImageList: TImageList;
  strict protected
    FConnection: TTConnection;
  public
    constructor Create(
      const AParent: TWinControl;
      const AConnection: TTConnection); reintroduce; virtual;

    procedure AfterConstruction; override;
  end;

implementation

{$R *.dfm}

{ TBaseFrame }

constructor TBaseFrame.Create(
  const AParent: TWinControl; const AConnection: TTConnection);
begin
  inherited Create(nil);
  Parent := AParent;
  FConnection := AConnection;
end;

procedure TBaseFrame.AfterConstruction;
begin
  inherited AfterConstruction;
  Align := TAlign.alClient;
  Visible := True;

  TOutput.Instance.ShowAddress := False;
  TOutput.Instance.ShowObjects := True;
end;

end.
