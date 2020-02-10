object fMain: TfMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1091#1088#1086#1082#1094#1080#1092#1088#1099'.'#1092#1089#1073
  ClientHeight = 280
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Данные: TPanel
    Left = 0
    Top = 89
    Width = 273
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label3: TLabel
      Left = 17
      Top = 144
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1083
    end
    object Label2: TLabel
      Left = 17
      Top = 94
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1083#1072#1089#1089
    end
    object Label1: TLabel
      Left = 17
      Top = 120
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1046#1077#1088#1090#1074#1072
      Transparent = False
    end
    object Город: TLabeledEdit
      Left = 64
      Top = 35
      Width = 201
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = #1043#1086#1088#1086#1076
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object Жертва: TComboBox
      Left = 63
      Top = 116
      Width = 202
      Height = 21
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 1
      Text = #1056#1086#1076#1080#1090#1077#1083#1100
      Items.Strings = (
        #1059#1095#1077#1085#1080#1082
        #1059#1095#1080#1090#1077#1083#1100
        #1056#1086#1076#1080#1090#1077#1083#1100)
    end
    object Класс: TComboBox
      Left = 63
      Top = 89
      Width = 202
      Height = 21
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 2
      Text = '8-11'
      Items.Strings = (
        '1-4'
        '5-7'
        '8-11')
    end
    object Пол: TComboBox
      Left = 63
      Top = 140
      Width = 202
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = #1052#1091#1078#1089#1082#1086#1081
      Items.Strings = (
        #1052#1091#1078#1089#1082#1086#1081
        #1046#1077#1085#1089#1082#1080#1081)
    end
    object Регион: TLabeledEdit
      Left = 64
      Top = 8
      Width = 201
      Height = 21
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = #1056#1077#1075#1080#1086#1085
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object Школа: TLabeledEdit
      Left = 63
      Top = 62
      Width = 202
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = #1064#1082#1086#1083#1072
      LabelPosition = lpLeft
      TabOrder = 5
    end
  end
  object Получить: TButton
    Left = 0
    Top = 255
    Width = 273
    Height = 25
    Align = alBottom
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
    Default = True
    TabOrder = 1
    OnClick = ПолучитьClick
  end
  object Общее: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 17
      Top = 65
      Width = 40
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1059#1088#1086#1082
    end
    object КодСессии: TLabeledEdit
      Left = 63
      Top = 8
      Width = 202
      Height = 21
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1076' '#1089#1077#1089#1089#1080#1080
      LabelPosition = lpLeft
      MaxLength = 12
      TabOrder = 0
      OnChange = КодСессииChange
    end
    object Урок: TComboBox
      Left = 63
      Top = 62
      Width = 202
      Height = 21
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 1
      Text = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1087#1086#1084#1086#1097#1085#1080#1082#1080
      Items.Strings = (
        #1041#1086#1083#1100#1096#1080#1077' '#1076#1072#1085#1085#1099#1077
        #1057#1077#1090#1080' '#1080' '#1086#1073#1083#1072#1095#1085#1099#1077' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1080
        #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1087#1086#1084#1086#1097#1085#1080#1082#1080)
    end
    object Имя: TLabeledEdit
      Left = 63
      Top = 35
      Width = 202
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103
      LabelPosition = lpLeft
      TabOrder = 2
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.pdf'
    FileName = #1089#1077#1088#1090#1080#1092#1080#1082#1072#1090'.pdf'
    Filter = 'PDF|*.pdf'
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoReadOnlyReturn, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableIncludeNotify, ofEnableSizing, ofDontAddToRecent]
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' '#1082#1072#1082'...'
    Left = 224
    Top = 8
  end
end
