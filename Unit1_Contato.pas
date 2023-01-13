unit Unit1_Contato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    conexao: TLabel;
    txt_ID: TEdit;
    txt_Nome: TEdit;
    txt_Telefone: TEdit;
    txt_Email: TEdit;
    txt_Observacao: TMemo;
    FDConnection1: TFDConnection;
    FDContato: TFDTable;
    DataSource: TDataSource;
    btn_Novo: TButton;
    btn_Salvar: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDConnection1.Params.Database := GetCurrentDir + '\assets\contatos.mdb';
  FDConnection1.Connected := true;
  FDContato.TableName := 'contatos';
  FDContato.Active := true;

  if FDConnection1.Connected = true then
      conexao.caption := 'Conectado';

end;

end.
