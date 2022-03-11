object Form1: TForm1
  Left = 232
  Top = 65
  Width = 921
  Height = 660
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1085#1072#1076' '#1084#1072#1090#1088#1080#1094#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  DesignSize = (
    905
    601)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 368
    Width = 55
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
  end
  object Label2: TLabel
    Left = 280
    Top = 0
    Width = 54
    Height = 13
    Caption = #1052#1072#1090#1088#1080#1094#1072' '#1040
  end
  object LabMatB: TLabel
    Left = 712
    Top = 0
    Width = 54
    Height = 13
    Caption = #1052#1072#1090#1088#1080#1094#1072' '#1042
  end
  object ListBox1: TListBox
    Left = 0
    Top = 16
    Width = 161
    Height = 353
    ItemHeight = 13
    Items.Strings = (
      #1059#1084#1085#1086#1078#1077#1085#1080#1077
      #1057#1083#1086#1078#1077#1085#1080#1077
      #1042#1099#1095#1080#1090#1072#1085#1080#1077
      #1059#1084#1085#1086#1078#1077#1085#1080#1077' '#1085#1072' '#1095#1080#1089#1083#1086
      #1042#1086#1079#1074#1077#1076#1077#1085#1080#1077' '#1074' '#1089#1090#1077#1087#1077#1085#1100
      #1058#1088#1072#1085#1089#1087#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077
      #1054#1073#1088#1072#1090#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
      #1058#1088#1077#1091#1075#1086#1083#1100#1085#1099#1081' '#1074#1080#1076
      #1054#1087#1088#1077#1076#1077#1083#1080#1090#1077#1083#1100
      #1057#1074#1086#1105' '#1074#1099#1088#1072#1078#1077#1085#1080#1077)
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Panel1: TPanel
    Left = 168
    Top = 16
    Width = 300
    Height = 300
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 592
    Top = 16
    Width = 300
    Height = 300
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object AddRowBut1: TButton
    Left = 168
    Top = 320
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
    TabOrder = 3
    OnClick = AddRowBut1Click
  end
  object AddColBut1: TButton
    Left = 288
    Top = 320
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
    TabOrder = 4
    OnClick = AddColBut1Click
  end
  object DelRowBut1: TButton
    Left = 168
    Top = 344
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
    TabOrder = 5
    OnClick = DelRowBut1Click
  end
  object ResultBut: TButton
    Left = 472
    Top = 320
    Width = 113
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 6
    OnClick = ResultButClick
  end
  object DelColBut1: TButton
    Left = 288
    Top = 344
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
    TabOrder = 7
    OnClick = DelColBut1Click
  end
  object AddCol2But: TButton
    Left = 776
    Top = 320
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
    TabOrder = 8
    OnClick = AddCol2ButClick
  end
  object Console: TStringGrid
    Left = 453
    Top = 403
    Width = 155
    Height = 65
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    ParentBiDiMode = False
    ScrollBars = ssNone
    TabOrder = 9
  end
  object AddRow2But: TButton
    Left = 656
    Top = 320
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
    TabOrder = 10
    OnClick = AddRow2ButClick
  end
  object DelRow2But: TButton
    Left = 656
    Top = 344
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
    TabOrder = 11
    OnClick = DelRow2ButClick
  end
  object DelCol2But: TButton
    Left = 776
    Top = 344
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
    TabOrder = 12
    OnClick = DelCol2ButClick
  end
  object ByNumber: TEdit
    Left = 656
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object FieldExpr: TEdit
    Left = 472
    Top = 112
    Width = 113
    Height = 21
    TabOrder = 14
    Visible = False
  end
  object Clean: TButton
    Left = 48
    Top = 376
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 15
    OnClick = CleanClick
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 376
    object Story: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103
      OnClick = StoryClick
    end
    object N1: TMenuItem
      Caption = #1055#1088#1072#1074#1080#1083#1072
      OnClick = N1Click
    end
    object About: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = AboutClick
    end
  end
end
