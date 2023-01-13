unit Unit2_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    ImageTela: TImage;
    MainMenu: TMainMenu;
    Registro1: TMenuItem;
    Contato1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Contato1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses Unit1_Contato;

procedure TFormPrincipal.Contato1Click(Sender: TObject);
begin
   FormContato.Show;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
 FormPrincipal.Close;
end;

end.
