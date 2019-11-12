object fMain: TfMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1091#1088#1086#1082#1094#1080#1092#1088#1099'.'#1092#1089#1073
  ClientHeight = 250
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 124
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1046#1077#1088#1090#1074#1072
  end
  object Label2: TLabel
    Left = 9
    Top = 97
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1050#1083#1072#1089#1089
  end
  object Label3: TLabel
    Left = 9
    Top = 148
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1086#1083
  end
  object Получить: TButton
    Left = 7
    Top = 221
    Width = 210
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1085#1072' '#1084#1099#1083#1086
    Default = True
    TabOrder = 0
    OnClick = ПолучитьClick
  end
  object Регион: TLabeledEdit
    Left = 56
    Top = 8
    Width = 161
    Height = 21
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = #1056#1077#1075#1080#1086#1085
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object Город: TLabeledEdit
    Left = 56
    Top = 35
    Width = 161
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1043#1086#1088#1086#1076
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object Имя: TLabeledEdit
    Left = 55
    Top = 167
    Width = 162
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    LabelPosition = lpLeft
    TabOrder = 3
  end
  object Мыло: TLabeledEdit
    Left = 55
    Top = 194
    Width = 162
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1099#1083#1086
    LabelPosition = lpLeft
    TabOrder = 4
  end
  object Жертва: TComboBox
    Left = 55
    Top = 116
    Width = 162
    Height = 21
    Style = csDropDownList
    ItemIndex = 2
    TabOrder = 5
    Text = #1056#1086#1076#1080#1090#1077#1083#1100
    Items.Strings = (
      #1059#1095#1077#1085#1080#1082
      #1059#1095#1080#1090#1077#1083#1100
      #1056#1086#1076#1080#1090#1077#1083#1100)
  end
  object Класс: TComboBox
    Left = 55
    Top = 89
    Width = 162
    Height = 21
    Style = csDropDownList
    ItemIndex = 2
    TabOrder = 6
    Text = '8-11'
    Items.Strings = (
      '1-4'
      '5-7'
      '8-11')
  end
  object Школа: TLabeledEdit
    Left = 55
    Top = 62
    Width = 162
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = #1064#1082#1086#1083#1072
    LabelPosition = lpLeft
    TabOrder = 7
  end
  object Пол: TComboBox
    Left = 55
    Top = 140
    Width = 162
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 8
    Text = #1052#1091#1078#1089#1082#1086#1081
    Items.Strings = (
      #1052#1091#1078#1089#1082#1086#1081
      #1046#1077#1085#1089#1082#1080#1081)
  end
end
