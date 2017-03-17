unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ScktComp, Menus, XPMan;

type
  TClientForm = class(TForm)
    MainMenu: TMainMenu;
    ClientSocket: TClientSocket;
    PortSpinEdit: TSpinEdit;
    MessageEdit: TEdit;
    ConnectButton: TButton;
    AddressEdit: TEdit;
    MessageLogMemo: TMemo;

    procedure ConnectButtonClick(Sender: TObject);
    procedure MessageEditKeyPress(Sender: TObject; var Key: Char);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ExitItemClick(Sender: TObject);
    procedure AboutItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.dfm}

procedure TClientForm.ConnectButtonClick(Sender: TObject);
begin
  ClientSocket.Host := AddressEdit.Text;
  ClientSocket.Port := PortSpinEdit.Value;
  ClientSocket.Open;
end;

procedure TClientForm.ExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TClientForm.AboutItemClick(Sender: TObject);
begin
  MessageBox(handle, 'Chat. Client. Version 1.0'#10#10 +
    'Author: Salavat Dautov'#10#10 +
    'Creation date: March 2017', 'About', MB_ICONINFORMATION);
end;

procedure TClientForm.ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  MessageLogMemo.Lines.Add(Socket.ReceiveText);
end;

procedure TClientForm.MessageEditKeyPress(Sender: TObject; var Key: Char);
begin 
  if Key = #13 then 
  begin 
    Key := #0;
    with ClientSocket.Socket do SendText(MessageEdit.Text);
    MessageEdit.Clear;
  end;
end;

end.
