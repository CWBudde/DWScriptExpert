object DataModuleScript: TDataModuleScript
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 356
  Width = 404
  object DelphiWebScript: TDelphiWebScript
    Left = 40
    Top = 16
  end
  object dwsDebugger: TdwsDebugger
    Left = 40
    Top = 160
  end
  object dwsRTTIConnector: TdwsRTTIConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 112
  end
  object dwsGUIFunctions: TdwsGUIFunctions
    Left = 40
    Top = 208
  end
  object dwsComConnector: TdwsComConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 64
  end
end
