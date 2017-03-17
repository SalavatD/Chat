program Client_Delphi;

uses
  Forms,
  Client in 'Client.pas' {ClientForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Chat. Client';
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
