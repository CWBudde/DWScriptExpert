unit DWScriptExpertModule;

interface

{$DEFINE UseCryptoModule}
{$DEFINE UseClassesLib}
{-$DEFINE UseGraphicLib}
{-$DEFINE UseIndyLib}
{-$DEFINE UseSymbolsLib}

uses
  Windows, SysUtils, Classes, ToolsAPI, TypInfo,

  dwsComp, dwsExprs, dwsSymbols, dwsErrors, dwsSuggestions, dwsVCLGUIFunctions,
  dwsStrings, dwsUnitSymbols, dwsFunctions, dwsTokenizer, dwsDebugger,
  dwsRTTIConnector, dwsCOMConnector,
  {$IFDEF UseCryptoModule}
  dwsCryptoLibModule,
  {$ENDIF}
  {$IFDEF UseClassesLib}
  dwsClassesLibModule,
  dwsEncodingLibModule,
  {$ENDIF}
  {$IFDEF UseGraphicLib}
  dwsGraphicLibrary,
  {$ENDIF}
  {$IFDEF UseIndyLib}
  dwsIndyLibModule,
  {$ENDIF}
  {$IFDEF UseSymbolsLib}
  dwsSymbolsLibModule,
  {$ENDIF}
  DelphiAST, DelphiAST.Consts, DelphiAST.Classes, DelphiAST.Writer;

type
  TDataModuleScript = class(TDataModule)
    DelphiWebScript: TDelphiWebScript;
    dwsDebugger: TdwsDebugger;
    dwsRTTIConnector: TdwsRTTIConnector;
    dwsGUIFunctions: TdwsGUIFunctions;
    dwsComConnector: TdwsComConnector;
    dwsUnitDelphiAST: TdwsUnit;
    dwsUnitInternal: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval(
      info: TProgramInfo);
    procedure dwsTSyntaxNodeMethodsGetAttributeEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsHasAttributeEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval(
      info: TProgramInfo);
    procedure dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval(
      info: TProgramInfo);
    procedure dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval(
      info: TProgramInfo);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetAttributeCountEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetChildCountEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetChildNodeEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetAttributeKeyEval(Info: TProgramInfo;
      ExtObject: TObject);
    procedure dwsUnitInternalFunctionsWriteLnEval(info: TProgramInfo);
    procedure dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval(
      Info: TProgramInfo; ExtObject: TObject);
  private
    FUnitRTTI: TdwsUnit;
    {$IFDEF UseCryptoModule}
    FCryptoLib: TdwsCryptoLib;
    {$ENDIF}
    {$IFDEF UseClassesLib}
    FClassesLib: TdwsClassesLib;
    FEncodingLib: TdwsEncodingLib;
    {$ENDIF}
    {$IFDEF UseIndyLib}
    FIndyLib: TdwsIndyLib;
    {$ENDIF}
    {$IFDEF UseSymbolsLib}
    FSymbolsLib: TdwsSymbolsLib;
    {$ENDIF}
    procedure DoGetSelfInstance(Info: TProgramInfo);
    function GetSyntaxNode(InterfaceOnly: Boolean = False): TSyntaxNode;
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  dwsUtils, dwsXPlatform, DWScriptExpertForm;

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

{$IFDEF UseCryptoModule}
  FCryptoLib := TdwsCryptoLib.Create(nil);
  FCryptoLib.dwsCrypto.Script := DelphiWebScript;
{$ENDIF}

{$IFDEF UseClassesLib}
  FClassesLib := TdwsClassesLib.Create(nil);
  FClassesLib.Script := DelphiWebScript;

  FEncodingLib := TdwsEncodingLib.Create(nil);
  FEncodingLib.dwsEncoding.Script := DelphiWebScript;
{$ENDIF}

{$IFDEF UseIndyLib}
  FIndyLib := TdwsIndyLib.Create(nil);
  FIndyLib.Script := DelphiWebScript;
{$ENDIF}

{$IFDEF UseSymbolsLib}
  FSymbolsLib := TdwsSymbolsLib.Create(nil);
  FSymbolsLib.Script := DelphiWebScript;
{$ENDIF}
end;

procedure TDataModuleScript.DataModuleDestroy(Sender: TObject);
begin
{$IFDEF UseSymbolsLib}
  FreeAndNil(FSymbolsLib);
{$ENDIF}
{$IFDEF UseIndyLib}
  FreeAndNil(FIndyLib);
{$ENDIF}
{$IFDEF UseClassesLib}
  FreeAndNil(FEncodingLib);
  FreeAndNil(FClassesLib);
{$ENDIF}
{$IFDEF UseCryptoModule}
  FreeAndNil(FCryptoLib);
{$ENDIF}
  FreeAndNil(FUnitRTTI);
end;

procedure TDataModuleScript.DoGetSelfInstance(Info: TProgramInfo);
begin
  Info.ResultAsVariant := TdwsRTTIVariant.FromObject(Self);
end;

function IsValidFileName(const FileName: TFileName): Boolean;
var
  S: string;
  I: Integer;
begin
  Result := False;
  S := FileName;
  repeat
    I := LastDelimiter('\/', S);
    MoveFile(nil, PChar(S));
    if (GetLastError = ERROR_ALREADY_EXISTS) or ((GetFileAttributes(
      PChar(Copy(S, I + 1, MaxInt))) = INVALID_FILE_ATTRIBUTES) and
      (GetLastError=ERROR_INVALID_NAME)) then
      Exit;
    if I > 0 then
      S := Copy(S, 1, I - 1);
  until I = 0;
  Result := True;
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetAttributeCountEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := TSyntaxNode(ExtObject).Attributes.Keys.Count;
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetAttributeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsString := TSyntaxNode(ExtObject).GetAttribute(Info.ParamAsString[0]);
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetAttributeKeyEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsString := TSyntaxNode(ExtObject).Attributes.Keys.ToArray[Info.ParamAsInteger[0]];
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetChildCountEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := TSyntaxNode(ExtObject).ChildNodes.Count;
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetChildNodeEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  ChildNode: TSyntaxNode;
  ChildNodeObj: IScriptObj;
begin
  Assert(ExtObject is TSyntaxNode);
  ChildNode := TSyntaxNode(ExtObject).ChildNodes.Items[Info.ParamAsInteger[0]];
  if Assigned(ChildNode) then
  begin
    Info.ResultAsVariant := Info.Vars['TSyntaxNode'].GetConstructor('Create', ChildNode).Call.Value;
(*
    ChildNodeObj := Info.ResultAsVariant as IScriptObj;
    ChildNodeObj.
    // ToDo: store ParentNode
*)
  end;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCompoundSyntaxNode);
  Info.ResultAsInteger := TCompoundSyntaxNode(ExtObject).Col;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCompoundSyntaxNode);
  Info.ResultAsInteger := TCompoundSyntaxNode(ExtObject).Col;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := TSyntaxNode(ExtObject).Col;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsBoolean := TSyntaxNode(ExtObject).HasAttributes;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsBoolean := TSyntaxNode(ExtObject).HasChildren;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := TSyntaxNode(ExtObject).Line
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := Integer(TSyntaxNode(ExtObject).Typ);
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsHasAttributeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsBoolean := TSyntaxNode(ExtObject).HasAttribute(Info.ParamAsString[0])
end;

procedure TDataModuleScript.dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval(
  Info: TProgramInfo);
var
  SyntaxNode: TSyntaxNode;
  FileName: TFileName;
  Output: string;
begin
  SyntaxNode := GetSyntaxNode;
  if Assigned(SyntaxNode) then
  begin
    Output := TSyntaxTreeWriter.ToXML(SyntaxNode);

    FileName := Info.ParamAsString[0];

    // now eventually save output to UTF8 encoded file
    if IsValidFileName(FileName) then
      SaveTextToUTF8File(FileName, Output);
  end;
end;

procedure TDataModuleScript.dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval(
  info: TProgramInfo);
var
  SyntaxNode: TSyntaxNode;
begin
  SyntaxNode := GetSyntaxNode(Info.ParamAsBoolean[0]);

  if Assigned(SyntaxNode) then
    Info.ResultAsVariant := Info.Vars['TSyntaxNode'].GetConstructor('Create', SyntaxNode).Call.Value;
end;

procedure TDataModuleScript.dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval(
  info: TProgramInfo);
begin
  Info.ResultAsString := SyntaxNodeNames[TSyntaxNodeType(Info.ParamAsInteger[0])];
end;

procedure TDataModuleScript.dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval(
  info: TProgramInfo);
begin
  Info.ResultAsString := GetEnumName(TypeInfo(TSyntaxNodeType), Info.ParamAsInteger[0]);
end;

procedure TDataModuleScript.dwsUnitInternalFunctionsWriteLnEval(
  info: TProgramInfo);
begin
  Assert(Owner is TDWScriptExpertDockForm);
  TDWScriptExpertDockForm(Owner).MemoOutput.Lines.Add(Info.ParamAsString[0])
end;

function TDataModuleScript.GetSyntaxNode(InterfaceOnly: Boolean = False): TSyntaxNode;
var
  EditorServices: IOTAEditorServices;
  EditView: IOTAEditView;
  EditBuffer: IOTAEditBuffer;
  EditReader: IOTAEditReader;
  Position: Integer;
  ByteReaded: Integer;
  Buffer: PAnsiChar;
  Stream: TWriteOnlyBlockStream;
  StringStream: TStringStream;
  PasSyntaxTreeBuilder: TPasSyntaxTreeBuilder;
const
  CChunkSize = 8192;
begin
  EditorServices := BorlandIDEServices as IOTAEditorServices;

  // check for availability of an edit view
  EditView := EditorServices.TopView;
  if not Assigned(EditView) then
    Exit(nil);

  // check for availability of an edit buffer (should be there)
  EditBuffer := EditView.Buffer;
  if not Assigned(EditBuffer) then
    Exit(nil);

  EditReader := EditBuffer.CreateReader;

  Stream := TWriteOnlyBlockStream.Create;
  try
    GetMem(Buffer, CChunkSize);
    try
      // read data in chunks of size CChunkSize (must be <= 65535)
      Position := 0;
      repeat
        ByteReaded := EditReader.GetText(Position, Buffer, CChunkSize);
        Stream.Write(Buffer^, ByteReaded);
        Position := Position + ByteReaded;
      until ByteReaded < CChunkSize;
    finally
      Dispose(Buffer);
    end;

    StringStream := TStringStream.Create(UTF8ToString(Stream.ToRawBytes));
    try
      // reset string stream position
      StringStream.Position := 0;

      // build abstract syntax tree
      PasSyntaxTreeBuilder := TPasSyntaxTreeBuilder.Create;
      try
        PasSyntaxTreeBuilder.InterfaceOnly := InterfaceOnly;
        Result := PasSyntaxTreeBuilder.Run(StringStream);
      finally
        PasSyntaxTreeBuilder.Free;
      end;
    finally
      StringStream.Free;
    end;
  finally
    Stream.Free;
  end;
end;

end.
