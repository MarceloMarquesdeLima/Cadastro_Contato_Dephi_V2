object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 314
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 19
    Height = 19
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
    Top = 16
    Width = 47
    Height = 19
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 72
    Height = 19
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 168
    Top = 88
    Width = 52
    Height = 19
    Caption = 'E-mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 152
    Width = 102
    Height = 19
    Caption = 'Observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object conexao: TLabel
    Left = 24
    Top = 293
    Width = 41
    Height = 13
  end
  object txt_ID: TEdit
    Left = 24
    Top = 41
    Width = 52
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object txt_Nome: TEdit
    Left = 104
    Top = 41
    Width = 345
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object txt_Telefone: TEdit
    Left = 24
    Top = 113
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object txt_Email: TEdit
    Left = 168
    Top = 113
    Width = 281
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object txt_Observacao: TMemo
    Left = 24
    Top = 184
    Width = 425
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object btn_Novo: TButton
    Left = 480
    Top = 184
    Width = 65
    Height = 41
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object btn_Salvar: TButton
    Left = 551
    Top = 184
    Width = 65
    Height = 41
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Button1: TButton
    Left = 695
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 7
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Treinamento\curso_basico_delphi\Cadastro_Contato_Dep' +
        'hi_V2\Win32\Debug\assets\contatos.mdb'
      'DriverID=MSAcc')
    Left = 472
    Top = 272
  end
  object FDContato: TFDTable
    Connection = FDConnection1
    Left = 536
    Top = 272
  end
  object DataSource: TDataSource
    DataSet = FDContato
    Left = 592
    Top = 272
  end
end
