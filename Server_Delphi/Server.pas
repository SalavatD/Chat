unit Server;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, Spin, Menus, XPMan;

type
  TServerForm = class(TForm)
    MainMenu: TMainMenu;
    ExitItem: TMenuItem;
    AboutItem: TMenuItem;
    PortSpinEdit: TSpinEdit;
    ServerSocket: TServerSocket;
    EnableButton: TButton;
    DisableButton: TButton;
    MessageEdit: TEdit;
    MessageLogMemo: TMemo;

    procedure EnableButtonClick(Sender: TObject);
    procedure DisableButtonClick(Sender: TObject);
    procedure MessageEditKeyPress(Sender: TObject; var Key: Char);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ExitItemClick(Sender: TObject);
    procedure AboutItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

procedure TServerForm.EnableButtonClick(Sender: TObject);
begin
  ServerSocket.Port := PortSpinEdit.Value;
  ServerSocket.Active := True;
end;

procedure TServerForm.ExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TServerForm.AboutItemClick(Sender: TObject);
begin
  MessageBox(handle, 'Chat. Server. Version 1.0'#10#10 +
    'Author: Salavat Dautov'#10#10 +
    'Creation date: March 2017', 'About', MB_ICONINFORMATION);
end;

procedure TServerForm.DisableButtonClick(Sender: TObject);
begin
  ServerSocket.Active := False;
end;

procedure TServerForm.MessageEditKeyPress(Sender: TObject; var Key: Char);
var i: Integer;
begin
  if Key = Chr(13) then
  begin
    Key := Chr(0);
    for i := 0 to ServerSocket.Socket.ActiveConnections - 1 do
    begin
      ServerSocket.Socket.Connections[i].SendText(MessageEdit.Text);
    end;
    MessageLogMemo.Lines.Add(MessageEdit.Text);
    MessageEdit.Clear;
  end;
end;

procedure TServerForm.ServerSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  MessageLogMemo.Lines.Add('Client disconnected.');
end;

procedure TServerForm.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  i: Integer;
  ReceivedText: string;
begin
  ReceivedText := Socket.ReceiveText;
  for i := 0 to ServerSocket.Socket.ActiveConnections - 1 do
  begin
    ServerSocket.Socket.Connections[i].SendText(ReceivedText);
  end;
  MessageLogMemo.Lines.Add(ReceivedText);
end;

end.
