unit Unit1_Contato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFormContato = class(TForm)
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
    btn_Anterior: TButton;
    btn_Proximo: TButton;
    btn_Delete: TButton;
    btn_Editar: TButton;
    DBGrid: TDBGrid;
    Label6: TLabel;
    btn_Cancela: TButton;
    txt_Pesquisa: TEdit;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    btn_Sair: TButton;
    img_Foto: TImage;
    btn_Imagem: TSpeedButton;
    OpenDialog: TOpenDialog;
    procedure carrega;
    procedure bloqueia;
    procedure limpa;
    procedure FormCreate(Sender: TObject);
    procedure btn_ProximoClick(Sender: TObject);
    procedure btn_AnteriorClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FDContatoBeforePost(DataSet: TDataSet);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_CancelaClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure btn_ImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContato: TFormContato;
  estado : integer;

implementation

{$R *.dfm}

uses Unit2_Principal;

procedure TFormContato.bloqueia;
begin
  txt_Nome.Enabled := not txt_Nome.Enabled;
  txt_Telefone.Enabled := not txt_Telefone.Enabled;
  txt_Email.Enabled := not txt_Email.Enabled;
  txt_Observacao.Enabled := not txt_Observacao.Enabled;
end;

procedure TFormContato.limpa;
begin
  txt_ID.Text := '';
  txt_Nome.Text := '';
  txt_Telefone.Text := '';
  txt_Email.Text := '';
  txt_Observacao.Text := '';

  txt_Nome.SetFocus;
end;

procedure TFormContato.SpeedButton1Click(Sender: TObject);
begin
    if not FDContato.FindKey([txt_Pesquisa.Text]) then
       showmessage('N�o encontrado!')
    else
       carrega;
end;

procedure TFormContato.btn_AnteriorClick(Sender: TObject);
begin
  FDContato.Prior;
  carrega;
end;

procedure TFormContato.btn_CancelaClick(Sender: TObject);
begin
    limpa;
    if estado = 1 then
      FDContato.Prior;
    carrega;
    bloqueia;

    estado := 0;
end;

procedure TFormContato.btn_DeleteClick(Sender: TObject);
begin
    FDContato.Delete;
    carrega;
end;

procedure TFormContato.btn_EditarClick(Sender: TObject);
begin
    bloqueia;
    FDContato.Edit;
end;

procedure TFormContato.btn_ImagemClick(Sender: TObject);
begin
   opendialog.Execute();
   img_Foto.Picture.LoadFromFile(opendialog.FileName);
   FDContato.Edit;
   FDContato.FieldByName('foto').Value := opendialog.FileName;
   FDContato.Post;
end;

procedure TFormContato.btn_NovoClick(Sender: TObject);
begin
   FDContato.Insert;
   bloqueia;
   limpa;

   estado := 1;
end;

procedure TFormContato.btn_ProximoClick(Sender: TObject);
begin
   FDContato.Next;
   carrega;
end;

procedure TFormContato.btn_SairClick(Sender: TObject);
begin
    FormContato.Hide;
    FormPrincipal.Show;
end;

procedure TFormContato.btn_SalvarClick(Sender: TObject);
begin
    FDContato.Post;
    bloqueia;
    showmessage('Informa��es gravadas com sucesso!');
end;

procedure TFormContato.carrega;
begin
  if FDContato.FieldByName('id').Value = null then
      txt_ID.Text := ''
  else
      txt_ID.Text := FDContato.FieldByName('id').Value;

  if FDContato.FieldByName('nome').Value = null then
      txt_Nome.Text := ''
  else
      txt_Nome.Text := FDContato.FieldByName('nome').Value;

  if FDContato.FieldByName('Telefone').Value = null then
      txt_Telefone.Text := ''
  else
      txt_Telefone.Text := FDContato.FieldByName('Telefone').Value;

  if FDContato.FieldByName('email').Value = null then
      txt_Email.Text := ''
  else
      txt_Email.Text := FDContato.FieldByName('email').Value;

  if FDContato.FieldByName('observacao').Value = null then
      txt_Observacao.Text := ''
  else
      txt_Observacao.Text := FDContato.FieldByName('observacao').Value;

  if FDContato.FieldByName('foto').Value <> null then
      begin
        if fileexists(FDContato.FieldByName('foto').Value) then
            img_foto.Picture.LoadFromFile(FDContato.FieldByName('foto').Value)
      end
  else
       img_foto.Picture := nil;

end;

procedure TFormContato.DBGridDblClick(Sender: TObject);
begin
   carrega;
end;

procedure TFormContato.FDContatoBeforePost(DataSet: TDataSet);
begin
  FDContato.FieldByName('nome').Value := txt_Nome.Text;
  FDContato.FieldByName('Telefone').Value := txt_Telefone.Text;
  FDContato.FieldByName('email').Value := txt_Email.Text;
  FDContato.FieldByName('observacao').Value := txt_Observacao.Text;
end;

procedure TFormContato.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Database := GetCurrentDir + '\assets\contatos.mdb';
  FDConnection1.Connected := true;
  FDContato.TableName := 'contatos';
  FDContato.Active := true;

  if FDConnection1.Connected = true then
    begin
      conexao.caption := 'Conectado';
      carrega;
    end;
end;

end.
