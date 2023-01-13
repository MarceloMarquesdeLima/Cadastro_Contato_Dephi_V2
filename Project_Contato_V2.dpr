program Project_Contato_V2;

uses
  Vcl.Forms,
  Unit1_Contato in 'Unit1_Contato.pas' {FormContato},
  Unit2_Principal in 'Unit2_Principal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormContato, FormContato);
  Application.Run;
end.
