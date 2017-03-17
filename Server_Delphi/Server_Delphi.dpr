program Server_Delphi;

uses
  Forms,
  Server in 'Server.pas' {ServerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Chat. Server';
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
