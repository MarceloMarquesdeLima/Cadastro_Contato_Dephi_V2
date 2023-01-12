program Project_Contato_V2;

uses
  Vcl.Forms,
  Unit1_Contato in 'Unit1_Contato.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
