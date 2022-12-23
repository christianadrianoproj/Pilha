program PPilha;

uses
  Vcl.Forms,
  pjPilha in 'pjPilha.pas' {Form1},
  uControleProdutos in 'uControleProdutos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
