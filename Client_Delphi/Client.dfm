object ClientForm: TClientForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Client'
  ClientHeight = 240
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AddressEdit: TEdit
    Left = 10
    Top = 13
    Width = 85
    Height = 21
    TabOrder = 0
  end
  object PortSpinEdit: TSpinEdit
    Left = 100
    Top = 12
    Width = 55
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 1
    Value = 49152
  end
  object ConnectButton: TButton
    Left = 160
    Top = 10
    Width = 50
    Height = 25
    Caption = 'Connect'
    TabOrder = 2
    OnClick = ConnectButtonClick
  end
  object MessageEdit: TEdit
    Left = 10
    Top = 48
    Width = 200
    Height = 21
    TabOrder = 3
    OnKeyPress = MessageEditKeyPress
  end
  object MessageLogMemo: TMemo
    Left = 10
    Top = 80
    Width = 200
    Height = 150
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object MainMenu: TMainMenu
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = ExitItemClick
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = AboutItemClick
      end
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocketRead
  end
end
