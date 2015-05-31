unit DWScriptExpertModule;

interface

uses
  System.SysUtils, System.Classes,

  dwsComp, dwsExprs, dwsSymbols, dwsErrors, dwsSuggestions, dwsVCLGUIFunctions,
  dwsStrings, dwsUnitSymbols, dwsFunctions, dwsTokenizer, dwsDebugger,
  dwsRTTIConnector, dwsCOMConnector;

type
  TDataModuleScript = class(TDataModule)
    DelphiWebScript: TDelphiWebScript;
    dwsDebugger: TdwsDebugger;
    dwsRTTIConnector: TdwsRTTIConnector;
    dwsGUIFunctions: TdwsGUIFunctions;
    dwsComConnector: TdwsComConnector;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FUnitRTTI: TdwsUnit;
    procedure DoGetSelfInstance(Info: TProgramInfo);
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModuleScript }

procedure TDataModuleScript.DataModuleCreate(Sender: TObject);
begin
  FUnitRTTI := TdwsUnit.Create(nil);
  FUnitRTTI.UnitName := 'IDE';
  FUnitRTTI.Script := DelphiWebScript;
  FUnitRTTI.Dependencies.Add(RTTI_UnitName);

  with FUnitRTTI.Functions.Add do
  begin
    Name := 'Self';
    ResultType := 'RTTIVariant';
    OnEval := DoGetSelfInstance;
  end;
end;

procedure TDataModuleScript.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FUnitRTTI);
end;

procedure TDataModuleScript.DoGetSelfInstance(Info: TProgramInfo);
begin
  Info.ResultAsVariant := TdwsRTTIVariant.FromObject(Self);
end;

end.
