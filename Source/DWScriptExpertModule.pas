unit DWScriptExpertModule;

interface

{$DEFINE UseCryptoModule}
{$DEFINE UseClassesLib}
{-$DEFINE UseGraphicLib}
{-$DEFINE UseIndyLib}
{-$DEFINE UseSymbolsLib}

uses
  Windows, SysUtils, Classes, Controls, ToolsAPI, TypInfo, Dialogs, Forms,

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
    dwsUnitEditor: TdwsUnit;
    dwsUnitHelp: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dwsTSyntaxNodeMethodsGetAttributeCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetAttributeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetAttributeKeyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetChildCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsGetChildNodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsTSyntaxNodeMethodsHasAttributeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval(info: TProgramInfo);
    procedure dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval(info: TProgramInfo);
    procedure dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval(info: TProgramInfo);
    procedure dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval(info: TProgramInfo);
    procedure dwsUnitHelpFunctionsGetIOTAHelpServicesEval(info: TProgramInfo);
    procedure dwsUnitInternalFunctionsWriteLnEval(info: TProgramInfo);
    procedure dwsUnitSimpleEditorFunctionsLocateTextEval(info: TProgramInfo);
    procedure dwsUnitSimpleEditorFunctionsSetCursorPositionEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsCenterCursorEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsPageDownEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsPageUpEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsGotoBookmarkEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsReplaceAllEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsMoveCursorEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsSelectCurrentWordEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsMoveOneWordLeftEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsMoveOneWordRightEval(info: TProgramInfo);
    procedure dwsUnitEditorFunctionsInsertTextEval(info: TProgramInfo);
    procedure dwsUnitEditorClassesIOTAEditorServicesMethodsGetEditOptionsIDStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsDeleteEditOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsAddEditOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsForFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopViewEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopBufferEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices60MethodsGetKeyboardServicesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEditorClassesIOTAEditorServices60MethodsGetEditOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTCommentNodeMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDelphiASTClassesTCommentNodeMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
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
    function GetEditBuffer: IOTAEditBuffer;
    function GetEditView: IOTAEditView;
    procedure SetEditorFocus(EditView: IOTAEditView);
  public
  end;

  TIUnknownContainer = class
    Intf: IUnknown;
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
  Info.ResultAsInteger := Length(TSyntaxNode(ExtObject).Attributes);
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetAttributeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsString := TSyntaxNode(ExtObject).GetAttribute(TAttributeName(Info.ParamAsInteger[0]));
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetAttributeKeyEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := Integer(TSyntaxNode(ExtObject).Attributes[Info.ParamAsInteger[0]].Key);
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetChildCountEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := Length(TSyntaxNode(ExtObject).ChildNodes);
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsGetChildNodeEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  ChildNode: TSyntaxNode;
  ChildNodeObj: IScriptObj;
begin
  Assert(ExtObject is TSyntaxNode);
  ChildNode := TSyntaxNode(ExtObject).ChildNodes[Info.ParamAsInteger[0]];
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

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCommentNodeMethodsGetTextEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCommentNode);
  Info.ResultAsString := TCommentNode(ExtObject).Text;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCommentNodeMethodsSetTextEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCommentNode);
  TCommentNode(ExtObject).Text := Info.ParamAsString[0];
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCompoundSyntaxNode);
  Info.ResultAsInteger := TCompoundSyntaxNode(ExtObject).EndCol;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TCompoundSyntaxNode);
  Info.ResultAsInteger := TCompoundSyntaxNode(ExtObject).EndLine;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsInteger := TSyntaxNode(ExtObject).Col;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetFileNameEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsString := TSyntaxNode(ExtObject).FileName;
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

procedure TDataModuleScript.dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsGetValueEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TValuedSyntaxNode);
  Info.ResultAsString := TValuedSyntaxNode(ExtObject).Value;
end;

procedure TDataModuleScript.dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsSetValueEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TValuedSyntaxNode);
  TValuedSyntaxNode(ExtObject).Value := Info.ParamAsString[0];
end;

procedure TDataModuleScript.dwsTSyntaxNodeMethodsHasAttributeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Assert(ExtObject is TSyntaxNode);
  Info.ResultAsBoolean := TSyntaxNode(ExtObject).HasAttribute(TAttributeName(Info.ParamAsInteger[0]));
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

procedure CreateScriptClassForInterface(Info: TProgramInfo; Intf: IUnknown; Name: string);
var
  Container: TIUnknownContainer;
begin
  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := Intf;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars[Name].GetConstructor('Create',
    Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices60MethodsGetEditOptionsEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditOptions: IOTAEditOptions;
  Container: TIUnknownContainer;
begin
  // get edit options
  EditOptions := (BorlandIDEServices as IOTAEditorServices).EditOptions;

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := EditOptions;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAEditOptions'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices60MethodsGetKeyboardServicesEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  KeyboardServices: IOTAKeyboardServices;
  Container: TIUnknownContainer;
begin
  // get keyboard service
  KeyboardServices := (BorlandIDEServices as IOTAEditorServices).KeyboardServices;

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := KeyboardServices;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAKeyboardServices'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopBufferEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditBuffer: IOTAEditBuffer;
  Container: TIUnknownContainer;
begin
  // get buffer
  EditBuffer := (BorlandIDEServices as IOTAEditorServices).TopBuffer;

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := EditBuffer;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAEditBuffer'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopViewEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditView: IOTAEditView;
  Container: TIUnknownContainer;
begin
  // get edit view
  EditView := (BorlandIDEServices as IOTAEditorServices).TopView;

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := EditView;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAEditView'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsAddEditOptionsEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditOptions: IOTAEditOptions;
  Container: TIUnknownContainer;
begin
  // adds a new IOTAEditOptions for IDString or return, if already existing
  EditOptions := (BorlandIDEServices as IOTAEditorServices).AddEditOptions(Info.ParamAsString[0]);

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := EditOptions;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAEditView'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsDeleteEditOptionsEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (BorlandIDEServices as IOTAEditorServices).DeleteEditOptions(Info.ParamAsString[0]);
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsCountEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := (BorlandIDEServices as IOTAEditorServices).EditOptionsCount;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditOptions: IOTAEditOptions;
  Container: TIUnknownContainer;
begin
  EditOptions := (BorlandIDEServices as IOTAEditorServices).GetEditOptions(Info.ParamAsString[0]);

  // create interface container (ugly hack to store the interface)
  Container := TIUnknownContainer.Create;
  Container.Intf := EditOptions;

  // create script-side class "containing" the interface
  Info.ResultAsVariant := Info.Vars['IOTAEditView'].GetConstructor('Create', Container).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsForFileEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditOptions: IOTAEditOptions;
begin
  EditOptions := (BorlandIDEServices as IOTAEditorServices).GetEditOptionsForFile(Info.ParamAsString[0]);
  Info.ResultAsVariant := Info.Vars['IOTAEditView'].GetConstructor('Create', nil).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsIndexEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditOptions: IOTAEditOptions;
begin
  EditOptions := (BorlandIDEServices as IOTAEditorServices).EditorOptions[Info.ParamAsInteger[0]];
  Info.ResultAsVariant := Info.Vars['IOTAEditView'].GetConstructor('Create', nil).Call.Value;
end;

procedure TDataModuleScript.dwsUnitEditorClassesIOTAEditorServicesMethodsGetEditOptionsIDStringEval(
  Info: TProgramInfo; ExtObject: TObject);
var
  EditorServices: IOTAEditorServices;
begin
  EditorServices := BorlandIDEServices as IOTAEditorServices;
  Info.ResultAsString := EditorServices.GetEditOptionsIDString(Info.ParamAsString[0]);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsCenterCursorEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // center cursor
  EditView.Center(Info.ParamAsInteger[0], Info.ParamAsInteger[1]);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsGotoBookmarkEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // goto bookmark
  EditView.BookmarkGoto(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsInsertTextEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // goto bookmark
  EditView.Position.InsertText(Info.ParamAsString[0]);
  SetEditorFocus(EditView);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsMoveCursorEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // goto bookmark
  EditView.Position.MoveCursor(Info.ParamAsInteger[0]);
  SetEditorFocus(EditView);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsMoveOneWordLeftEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  EditView.Position.MoveCursor(mmSkipWord + mmSkipLeft + mmSkipStream);
  EditView.Position.MoveCursor(mmSkipNonWord + mmSkipLeft + mmSkipStream);

  SetEditorFocus(EditView);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsMoveOneWordRightEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  EditView.Position.MoveCursor(mmSkipWord + mmSkipRight + mmSkipStream);
  EditView.Position.MoveCursor(mmSkipNonWord + mmSkipRight + mmSkipStream);

  SetEditorFocus(EditView);
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsPageDownEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // goto bookmark
  EditView.PageDown;
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsPageUpEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // goto bookmark
  EditView.PageUp;
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsReplaceAllEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
  EditBuffer: IOTAEditBuffer;
  ErrorCode, Result: Integer;
  Old, New: string;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // get edit buffer
  EditBuffer := EditView.Buffer;
  Assert(Assigned(EditBuffer));

  Old := Info.ParamAsString[0];
  New := Info.ParamAsString[1];

  // perform replace
  Result := EditBuffer.EditPosition.Replace(Old, New, True, False, True,
    sdForward, ErrorCode);

  Info.ResultAsBoolean := Result <> 0;

  // check for an error code and handle
  if ErrorCode <> 0 then
    raise Exception.Create(
      EditBuffer.EditPosition.GetSearchErrorString(ErrorCode));

  // replace again
  while Result <> 0 do
    Result := EditBuffer.EditPosition.ReplaceAgain;
end;

procedure TDataModuleScript.SetEditorFocus(EditView: IOTAEditView);
var
  Form: TCustomForm;

  function SetEditorControlFocus(AControl: TControl): Boolean;
  var
    Index: Integer;
  begin
    Result := False;
    if AControl = nil then
      Exit;

    if AControl is TWinControl then
    begin
      if AControl.Name = 'Editor' then
      begin
        TWinControl(AControl).SetFocus;
        Exit(True);
      end;
      for Index := 0 to TWinControl(AControl).ControlCount - 1 do
      begin
        Result := SetEditorControlFocus(TWinControl(AControl).Controls[Index]);
        if Result then
          Exit;
      end;
    end;
  end;

begin
  // ensure that an edit view has been passed
  if not Assigned(EditView) then
    Exit;

  // show buffer and re-paint
  EditView.Buffer.Show;
  EditView.Paint;
  EditView.Buffer.Show;

  Form := EditView.GetEditWindow.Form;
  SetEditorControlFocus(Form);

  // show buffer and re-paint
  EditView.Buffer.Show;
  EditView.Paint;
  EditView.Buffer.Show;
end;

procedure TDataModuleScript.dwsUnitEditorFunctionsSelectCurrentWordEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
  EditPosition: IOTAEditPosition;
  EditBlock: IOTAEditBlock;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  EditPosition := EditView.Position;
  EditBlock := EditView.Block;
  if EditPosition.IsWordCharacter then
    EditPosition.MoveCursor(mmSkipLeft or mmSkipWord or mmSkipStream);
  if EditPosition.IsWhiteSpace then
    EditPosition.MoveCursor(mmSkipRight or mmSkipWhite or mmSkipStream);
  if not EditPosition.IsWhiteSpace then
  begin
    if not EditPosition.IsWordCharacter then
    EditPosition.MoveCursor(mmSkipRight or mmSkipNonWord or mmSkipStream);
    if EditPosition.IsWordCharacter then
    begin
      EditBlock.Reset;
      EditBlock.Style := btNonInclusive;
      EditBlock.BeginBlock;
      EditPosition.MoveCursor(mmSkipRight or mmSkipWord or mmSkipStream);
      EditBlock.EndBlock;
    end;
  end;

  SetEditorFocus(EditView);
end;

procedure TDataModuleScript.dwsUnitHelpFunctionsGetIOTAHelpServicesEval(
  info: TProgramInfo);
var
  HelpServices: IOTAHelpServices;
begin
  HelpServices := BorlandIDEServices as IOTAHelpServices;
  Info.ResultAsVariant := HelpServices as IDispatch;
end;

procedure TDataModuleScript.dwsUnitInternalFunctionsWriteLnEval(
  info: TProgramInfo);
begin
  Assert(Owner is TDWScriptExpertDockForm);
  TDWScriptExpertDockForm(Owner).OutputMessage(Info.ParamAsString[0]);
end;

function TDataModuleScript.GetEditView: IOTAEditView;
var
  EditorServices: IOTAEditorServices;
begin
  EditorServices := BorlandIDEServices as IOTAEditorServices;
  Result := EditorServices.TopView;
end;

function TDataModuleScript.GetEditBuffer: IOTAEditBuffer;
var
  EditView: IOTAEditView;
begin
  // check for availability of an edit view
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit(nil);

  Result := EditView.Buffer;
end;

procedure TDataModuleScript.dwsUnitSimpleEditorFunctionsLocateTextEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
  ErrorCode: Integer;
  Found: Boolean;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  // search for given string
  Found := EditView.Buffer.EditPosition.Search(Info.ParamAsString[0], False,
    False, True, sdForward, ErrorCode);

  // eventually paint the view
  if Found then
    SetEditorFocus(EditView);

  Info.ResultAsBoolean := Found;
end;

procedure TDataModuleScript.dwsUnitSimpleEditorFunctionsSetCursorPositionEval(
  info: TProgramInfo);
var
  EditView: IOTAEditView;
  CursorPos: TOTAEditPos;
begin
  // get edit view and check for availability
  EditView := GetEditView;
  if not Assigned(EditView) then
    Exit;

  CursorPos.Line := Info.ParamAsInteger[0];
  CursorPos.Col := Info.ParamAsInteger[1];
  EditView.CursorPos := CursorPos;

  // set cursor position
  EditView.MoveViewToCursor;
  SetEditorFocus(EditView);
end;

function TDataModuleScript.GetSyntaxNode(InterfaceOnly: Boolean = False): TSyntaxNode;
var
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
  // get edit buffer and check for availability
  EditBuffer := GetEditBuffer;
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
