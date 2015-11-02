object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Fungsi Gaussian 3 Feature'
  ClientHeight = 444
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 119
    Top = 32
    Width = 74
    Height = 13
    Caption = 'IKAN BANDENG'
  end
  object Label2: TLabel
    Left = 408
    Top = 32
    Width = 67
    Height = 13
    Caption = 'IKAN MUJAER'
  end
  object Label3: TLabel
    Left = 19
    Top = 329
    Width = 46
    Height = 13
    Caption = 'PANJANG'
  end
  object Label4: TLabel
    Left = 19
    Top = 356
    Width = 32
    Height = 13
    Caption = 'BERAT'
  end
  object Label5: TLabel
    Left = 19
    Top = 378
    Width = 20
    Height = 13
    Caption = 'RGB'
  end
  object StringIkanB: TStringGrid
    Left = 306
    Top = 51
    Width = 266
    Height = 257
    ColCount = 4
    RowCount = 10
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24
      25
      24
      24
      24
      24)
  end
  object StringIkanA: TStringGrid
    Left = 16
    Top = 51
    Width = 265
    Height = 257
    ColCount = 4
    RowCount = 10
    TabOrder = 1
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 206
    Top = 378
    Width = 75
    Height = 25
    Caption = 'PROSES'
    TabOrder = 2
    OnClick = Button1Click
  end
  object edOutput: TEdit
    Left = 72
    Top = 407
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edInputPjg: TEdit
    Left = 71
    Top = 326
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edInputBrt: TEdit
    Left = 72
    Top = 353
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edinputRgb: TEdit
    Left = 72
    Top = 380
    Width = 121
    Height = 21
    TabOrder = 6
  end
end
