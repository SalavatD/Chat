object ServerForm: TServerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Server'
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
  object PortSpinEdit: TSpinEdit
    Left = 10
    Top = 12
    Width = 60
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 0
    Value = 49152
  end
  object EnableButton: TButton
    Left = 80
    Top = 10
    Width = 60
    Height = 25
    Caption = 'Enable'
    TabOrder = 1
    OnClick = EnableButtonClick
  end
  object DisableButton: TButton
    Left = 150
    Top = 10
    Width = 60
    Height = 25
    Caption = 'Disable'
    TabOrder = 2
    OnClick = DisableButtonClick
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
    object FileItem: TMenuItem
      Caption = 'File'
      object ExitItem: TMenuItem
        Caption = 'Exit'
        OnClick = ExitItemClick
      end
    end
    object HelpItem: TMenuItem
      Caption = 'Help'
      object AboutItem: TMenuItem
        Caption = 'About'
        OnClick = AboutItemClick
      end
    end
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
  end
end
