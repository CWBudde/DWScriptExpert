unit DWScriptExpertForm;

interface

{$IFNDEF WIN64}
{-$DEFINE SupportJIT}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DockForm, StdCtrls, ExtCtrls, ComCtrls, SyncObjs, Menus, StdActns, ActnList,
  ToolWin, ImgList, ToolsAPI, Actions,

  dwsComp, dwsExprs, dwsSymbols, dwsErrors, dwsSuggestions, dwsVCLGUIFunctions,
  dwsStrings, dwsUnitSymbols, dwsFunctions, dwsTokenizer, dwsScriptSource,
  {$IFDEF SupportJIT} dwsJIT, dwsJITx86, {$ENDIF}

  SynEdit, SynEditHighlighter, SynHighlighterDWS, SynCompletionProposal,
  SynEditPlugins, SynEditMiscClasses, SynEditSearch, SynEditOptionsDialog,
  SynMacroRecorder, SynEditTypes,

  {$IFDEF WebUpdate}
  WebUpdate.Classes.WebUpdate,
  {$ENDIF}

  VirtualTrees,

  DWScriptExpertModule;

type
  TEditorFrameSynEditPlugin = class(TSynEditPlugin)
  protected
    procedure AfterPaint(ACanvas: TCanvas; const AClip: TRect;
      FirstLine, LastLine: Integer); override;
  end;

  TOnCompilationCompleted = procedure(Sender: TObject; CompiledProgram: IdwsProgram) of object;

  TBackgroundCompilationThread = class(TThread)
  private
    FCompiler: TDelphiWebScript;
    FCompilationIsDue: Boolean;
    FOnCompilationCompleted: TOnCompilationCompleted;
  public
    constructor Create(Compiler: TDelphiWebScript);
    procedure Execute; override;
    procedure ScheduleCompilation;

    property OnCompilationCompleted: TOnCompilationCompleted read FOnCompilationCompleted write FOnCompilationCompleted;
    property CompilationIsDue: Boolean read FCompilationIsDue;
  end;

  TExecutionThread = class(TThread)
  private
    FCompiledProgram: IdwsProgram;
    FJustInTimeCompilation: Boolean;
    FProgramExecution: IdwsProgramExecution;
    FOnExecutionDone: TNotifyEvent;
    function GetOutput: string;
  public
    constructor Create(CompiledProgram: IdwsProgram; JustInTimeCompilation: Boolean = False);

    procedure Execute; override;
    procedure Abort;

    property Output: string read GetOutput;
    property OnExecutionDone: TNotifyEvent read FOnExecutionDone write FOnExecutionDone;
  end;

  TCompilerMessage = record
    Text: string;
    &Message: TdwsMessage;
  end;
  PCompilerMessage = ^TCompilerMessage;

  TDWScriptExpertDockForm = class(TDockableForm)
    ActionAbout: TAction;
    ActionDocumentation: TAction;
    ActionEditCopy: TEditCopy;
    ActionEditCut: TEditCut;
    ActionEditDelete: TEditDelete;
    ActionEditPaste: TEditPaste;
    ActionEditSelectAll: TEditSelectAll;
    ActionEditUndo: TEditUndo;
    ActionFileOpen: TFileOpen;
    ActionFileSave: TAction;
    ActionFileSaveAs: TFileSaveAs;
    ActionList: TActionList;
    ActionScriptAbort: TAction;
    ActionScriptRun: TAction;
    ActionSearchFind: TSearchFind;
    Images: TImageList;
    MemoOutput: TMemo;
    MenuItemClear: TMenuItem;
    MenuSaveMessagesAs: TMenuItem;
    PageControl: TPageControl;
    PopupMenuMessages: TPopupMenu;
    SplitterVertical: TSplitter;
    StatusBar: TStatusBar;
    SynCodeSuggestions: TSynCompletionProposal;
    SynDWSSyn: TSynDWSSyn;
    SynEdit: TSynEdit;
    SynEditOptionsDialog: TSynEditOptionsDialog;
    SynEditSearch: TSynEditSearch;
    SynMacroRecorder: TSynMacroRecorder;
    SynParameters: TSynCompletionProposal;
    TabSheetCompiler: TTabSheet;
    TabSheetOutput: TTabSheet;
    TreeCompiler: TVirtualStringTree;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButtonAbout: TToolButton;
    ToolButtonCopy: TToolButton;
    ToolButtonCut: TToolButton;
    ToolButtonDelete: TToolButton;
    ToolButtonHelp: TToolButton;
    ToolButtonOpen: TToolButton;
    ToolButtonPaste: TToolButton;
    ToolButtonRun: TToolButton;
    ToolButtonSave: TToolButton;
    ToolButtonSearch: TToolButton;
    ToolButtonSelectAll: TToolButton;
    ToolButtonSeparator1: TToolButton;
    ToolButtonSeparator2: TToolButton;
    ToolButtonSeparator3: TToolButton;
    ToolButtonSeparator4: TToolButton;
    ToolButtonUndo: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionAboutExecute(Sender: TObject);
    procedure ActionDocumentationExecute(Sender: TObject);
    procedure ActionFileOpenAccept(Sender: TObject);
    procedure ActionFileSaveAsAccept(Sender: TObject);
    procedure ActionFileSaveExecute(Sender: TObject);
    procedure ActionScriptAbortExecute(Sender: TObject);
    procedure ActionScriptAbortUpdate(Sender: TObject);
    procedure ActionScriptRunExecute(Sender: TObject);
    procedure MenuItemClearClick(Sender: TObject);
    procedure MenuSaveMessagesAsClick(Sender: TObject);
    procedure SynCodeSuggestionsClose(Sender: TObject);
    procedure SynCodeSuggestionsExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure SynCodeSuggestionsPaintItem(Sender: TObject; Index: Integer; TargetCanvas: TCanvas; ItemRect: TRect; var CustomDraw: Boolean);
    procedure SynCodeSuggestionsShow(Sender: TObject);
    procedure SynEditChange(Sender: TObject);
    procedure SynEditGutterPaint(Sender: TObject; aLine, X, Y: Integer);
    procedure SynEditSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure SynEditStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure SynParametersExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure TreeCompilerDblClick(Sender: TObject);
    procedure TreeCompilerFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure TreeCompilerGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure TreeCompilerGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
  private
    FBackgroundCompilationThread: TBackgroundCompilationThread;
    FExecutionThread: TExecutionThread;
    FCompiledProgram: IdwsProgram;
    FCriticalSection: TCriticalSection;

    FModified: Boolean;
    FCurrentFileName: TFileName;
    FOriginalCaption: string;
    FSearchHighlighter: TEditorFrameSynEditPlugin;
    FSuggestions: IDWSSuggestions;
    FScriptModule: TDataModuleScript;
    FMessageGroupCompiler: IOTAMessageGroup;
    FMessageGroupOutput: IOTAMessageGroup;
    procedure LoadSettings;
    procedure SaveSettings;

    {$IFDEF WebUpdate}
    FWebUpdate: TWebUpdate;
    {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure CompilationCompletedHandler(Sender: TObject; CompiledProgram: IdwsProgram);
    procedure ExecutionDoneHandler(Sender: TObject);

    procedure LoadScript(FileName: TFileName);
    procedure SaveScript(FileName: TFileName);

    procedure SetCurrentFileName(const Value: TFileName);
    procedure SetModified(const Value: Boolean);
  protected
    procedure UpdateCaption;
  public
    procedure CompileScript;
    procedure RunScript(JIT: Boolean = False);

    procedure OutputMessage(Text: string);
    procedure CompilerMessages(Messages: TdwsMessageList);

    property CurrentFileName: TFileName read FCurrentFileName write SetCurrentFileName;
    property Modified: Boolean read FModified write SetModified;
  end;
  TDWScriptExpertDockFormClass = class of TDWScriptExpertDockForm;

implementation

{$R *.dfm}

uses
  DeskUtil, Registry, dwsUtils, dwsXPlatform, dwsSymbolDictionary,
  DWScriptExpertWizard, DWScriptExpertAbout;

{$IFDEF WebUpdate}
const
  CWebUpdateUrl = 'http://www.savioursofsoul.de/Christian/WebUpdate/DWScriptExpert/';
{$ENDIF}

{ TEditorFrameSynEditPlugin }

procedure TEditorFrameSynEditPlugin.AfterPaint(ACanvas: TCanvas;
  const AClip: TRect; FirstLine, LastLine: Integer);
var
  SearchText: string;
  Pt: TPoint;
  Rct: TRect;
  OldFont: TFont;
  LineIndex, Count, ItemIndex: Integer;
  CurrCoord: TBufferCoord;
begin
  inherited;

  SearchText := Editor.SearchEngine.Pattern;
  if SearchText = '' then
    Exit;

  OldFont := TFont.Create;
  try
    OldFont.Assign(ACanvas.Font);

    ACanvas.Brush.Color := $60A0F0;
    ACanvas.Brush.Style := bsSolid;

    for LineIndex := FirstLine to LastLine do
    begin
      Count := Editor.SearchEngine.FindAll(Editor.Lines[LineIndex - 1]);
      for ItemIndex := 0 to Count - 1 do
      begin
        CurrCoord := BufferCoord(Editor.SearchEngine.Results[ItemIndex], LineIndex);
        if CurrCoord = Editor.BlockBegin then
          Continue;

        Pt := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(CurrCoord));
        Rct := Rect(Pt.X, Pt.Y, Pt.X + Editor.CharWidth * Length(SearchText),
          Pt.Y + Editor.LineHeight);

        ACanvas.FillRect(Rct);
        ACanvas.TextRect(Rct, Pt.X, Pt.Y, SearchText);
      end
    end;

    ACanvas.Font.Assign(OldFont);
  finally
    OldFont.Free;
  end;
end;


{ TBackgroundCompilationThread }

constructor TBackgroundCompilationThread.Create(Compiler: TDelphiWebScript);
begin
  FCompiler := Compiler;

  inherited Create;
end;

procedure TBackgroundCompilationThread.Execute;
var
  SourceCode: string;
  CompiledProgram: IdwsProgram;
begin
  while not Terminated do
  begin
    if FCompilationIsDue then
    begin
      FCompilationIsDue := False;

      // fetch source code in a safe way
      Synchronize(procedure begin
        SourceCode := GDockForm.SynEdit.Lines.Text;
      end);

      // compile source code
      CompiledProgram := FCompiler.Compile(SourceCode);

      // call compilation complete
      Synchronize(procedure begin
        if Assigned(FOnCompilationCompleted) then
          FOnCompilationCompleted(Self, CompiledProgram);
      end);
    end;
    Sleep(100);
  end;
end;

procedure TBackgroundCompilationThread.ScheduleCompilation;
begin
  FCompilationIsDue := True;
end;


{ TExecutionThread }

constructor TExecutionThread.Create(CompiledProgram: IdwsProgram;
  JustInTimeCompilation: Boolean = False);
begin
  FCompiledProgram := CompiledProgram;
  FJustInTimeCompilation := JustInTimeCompilation;
  FreeOnTerminate := True;
  inherited Create;
end;

procedure TExecutionThread.Abort;
begin
  if Assigned(FProgramExecution) then
    FProgramExecution.Stop;
end;

procedure TExecutionThread.Execute;
var
  Success: Boolean;
begin
  FProgramExecution := nil;

  // abort if no compiled program is available or if it has errors
  if not Assigned(FCompiledProgram) or FCompiledProgram.Msgs.HasErrors then
    Exit;

   {$IFDEF SupportJIT}
   if FJustInTimeCompilation then
     with TdwsJITx86.Create do
     try
       Options := Options - [jitoNoBranchAlignment];
       GreedyJIT(FCompiledProgram.ProgramObject);
     finally
       Free;
     end;
   {$ENDIF}

  try
    FProgramExecution := FCompiledProgram.CreateNewExecution;
    FProgramExecution.Execute(5 * 60 * 1000); // 5 minutes!

    Success := not FProgramExecution.Msgs.HasErrors;
  except
    Success := False
  end;

  if Terminated then
    Exit;

  Synchronize(procedure
  var
    Index: Integer;
  begin
    if Success then
    begin
      if FProgramExecution.Result.ToString <> '' then
        GDockForm.OutputMessage(FProgramExecution.Result.ToString);
      GDockForm.StatusBar.Panels[1].Text := 'Executed';
    end
    else
    begin
      if FProgramExecution.Msgs.HasErrors then
      begin
        GDockForm.CompilerMessages(FProgramExecution.Msgs);
        GDockForm.PageControl.ActivePage := GDockForm.TabSheetCompiler;
      end;
      GDockForm.StatusBar.Panels[1].Text := 'Error';
    end;

    if Assigned(FOnExecutionDone) then
      FOnExecutionDone(Self);
  end);

  FProgramExecution := nil;
end;

function TExecutionThread.GetOutput: string;
begin
  if Assigned(FProgramExecution) then
    Result := FProgramExecution.Result.ToString
  else
    Result := '';
end;



{ TScriptableEditorDockForm }

constructor TDWScriptExpertDockForm.Create(AOwner: TComponent);
begin
  inherited;

  FScriptModule := TDataModuleScript.Create(Self);

  TreeCompiler.NodeDataSize := SizeOf(TCompilerMessage);

  FCriticalSection := TCriticalSection.Create;
  FBackgroundCompilationThread := TBackgroundCompilationThread.Create(FScriptModule.DelphiWebScript);
  FBackgroundCompilationThread.OnCompilationCompleted := CompilationCompletedHandler;

  FOriginalCaption := Caption;

{$IFDEF WebUpdate}
  FWebUpdate := TWebUpdate.Create(CWebUpdateUrl);
{$ENDIF}
  FSearchHighlighter := TEditorFrameSynEditPlugin.Create(SynEdit);

  DeskSection := Name;
  AutoSave := True;

  FMessageGroupCompiler := (BorlandIDEServices as IOTAMessageServices).AddMessageGroup('DWScript Compiler');
  FMessageGroupCompiler.AutoScroll := True;
  FMessageGroupOutput := (BorlandIDEServices as IOTAMessageServices).AddMessageGroup('DWScript Output');
  FMessageGroupOutput.AutoScroll := True;

  LoadSettings;

  // Instruct TDockableForm to save state
  SaveStateNecessary := True;
end;

destructor TDWScriptExpertDockForm.Destroy;
begin
  SaveSettings;

{$IFDEF WebUpdate}
  FWebUpdate.Free;
{$ENDIF}

  try
    (BorlandIDEServices as IOTAMessageServices).RemoveMessageGroup(FMessageGroupCompiler);
    (BorlandIDEServices as IOTAMessageServices).RemoveMessageGroup(FMessageGroupOutput);
  except
  end;

  // stop background compilation
  if Assigned(FBackgroundCompilationThread) then
  begin
    FBackgroundCompilationThread.Terminate;
    FBackgroundCompilationThread.WaitFor;
    FreeAndNil(FBackgroundCompilationThread);
  end;

  // eventually stop execution
  if Assigned(FExecutionThread) then
  begin
    FExecutionThread.Abort;
    FExecutionThread.Terminate;
    FExecutionThread := nil;
  end;

  FreeAndNil(FCriticalSection);

  // Instruct TDockableForm to save state
  SaveStateNecessary := True;
  inherited;
end;

procedure TDWScriptExpertDockForm.FormShow(Sender: TObject);
begin
  // schedule first compilation
  FBackgroundCompilationThread.ScheduleCompilation;
end;

procedure TDWScriptExpertDockForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GViewScriptMenuItem.Checked := False;
  Action := caHide;
end;

procedure TDWScriptExpertDockForm.LoadSettings;
begin
  with TRegistry.Create do
  try
    if OpenKey('Software\DWScriptExpert\', False) then
    begin
      // recall form position
      if ValueExists('Left') then
        Left := ReadInteger('Left');
      if ValueExists('Top') then
        Top := ReadInteger('Top');

      // recall caret position
      SynEdit.CaretX := ReadInteger('CaretX');
      SynEdit.CaretY := ReadInteger('CaretY');

      if ValueExists('CurrentFile') then
        CurrentFileName := ReadString('CurrentFile');

      if ValueExists('RecentScript') then
        SynEdit.Lines.Text := ReadString('RecentScript');

      if ValueExists('Visible') then
        Visible := ReadBool('Visible');
    end;
    CloseKey;
  finally
    Free;
  end;
end;

procedure TDWScriptExpertDockForm.SaveSettings;
begin
  with TRegistry.Create do
  try
    OpenKey('Software\DWScriptExpert\', True);

    // store form position
    WriteInteger('Left', Left);
    WriteInteger('Top', Top);

    // store caret position
    WriteInteger('CaretX', SynEdit.CaretX);
    WriteInteger('CaretY', SynEdit.CaretY);

    WriteBool('Visible', Visible);

    // store options
    WriteBool('AltSetsColumnMode', eoAltSetsColumnMode in SynEdit.Options);
    WriteBool('AutoIndent', eoAutoIndent in SynEdit.Options);
    WriteBool('AutoSizeMaxScrollWidth', eoAutoSizeMaxScrollWidth in SynEdit.Options);
    WriteBool('DisableScrollArrows', eoDisableScrollArrows in SynEdit.Options);
    WriteBool('DragDropEditing', eoDragDropEditing in SynEdit.Options);
    WriteBool('DropFiles', eoDropFiles in SynEdit.Options);
    WriteBool('EnhanceHomeKey', eoEnhanceHomeKey in SynEdit.Options);
    WriteBool('EnhanceEndKey', eoEnhanceEndKey in SynEdit.Options);
    WriteBool('GroupUndo', eoGroupUndo in SynEdit.Options);
    WriteBool('HalfPageScroll', eoHalfPageScroll in SynEdit.Options);
    WriteBool('HideShowScrollbars', eoHideShowScrollbars in SynEdit.Options);
    WriteBool('KeepCaretX', eoKeepCaretX in SynEdit.Options);
    WriteBool('NoCaret', eoNoCaret in SynEdit.Options);
    WriteBool('NoSelection', eoNoSelection in SynEdit.Options);
    WriteBool('RightMouseMovesCursor', eoRightMouseMovesCursor in SynEdit.Options);
    WriteBool('ScrollByOneLess', eoScrollByOneLess in SynEdit.Options);
    WriteBool('ScrollHintFollows', eoScrollHintFollows in SynEdit.Options);
    WriteBool('ScrollPastEof', eoScrollPastEof in SynEdit.Options);
    WriteBool('ScrollPastEol', eoScrollPastEol in SynEdit.Options);
    WriteBool('ShowScrollHint', eoShowScrollHint in SynEdit.Options);
    WriteBool('ShowSpecialChars', eoShowSpecialChars in SynEdit.Options);
    WriteBool('SmartTabDelete', eoSmartTabDelete in SynEdit.Options);
    WriteBool('SmartTabs', eoSmartTabs in SynEdit.Options);
    WriteBool('SpecialLineDefaultFg', eoSpecialLineDefaultFg in SynEdit.Options);
    WriteBool('TabIndent', eoTabIndent in SynEdit.Options);
    WriteBool('TabsToSpaces', eoTabsToSpaces in SynEdit.Options);
    WriteBool('TrimTrailingSpaces', eoTrimTrailingSpaces in SynEdit.Options);
    WriteString('CurrentFile', FCurrentFileName);

    WriteString('RecentScript', SynEdit.Lines.Text);

    CloseKey;
  finally
    Free;
  end;
end;

procedure TDWScriptExpertDockForm.ActionAboutExecute(Sender: TObject);
begin
  with TFormAbout.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TDWScriptExpertDockForm.ActionDocumentationExecute(Sender: TObject);
begin
  //
end;

procedure TDWScriptExpertDockForm.ActionFileOpenAccept(Sender: TObject);
begin
  LoadScript(ActionFileOpen.Dialog.FileName);
end;

procedure TDWScriptExpertDockForm.ActionFileSaveAsAccept(Sender: TObject);
begin
  SaveScript(ActionFileSaveAs.Dialog.FileName);
end;

procedure TDWScriptExpertDockForm.ActionFileSaveExecute(Sender: TObject);
begin
  if FCurrentFileName <> '' then
    SaveScript(FCurrentFileName)
  else
    ActionFileSaveAs.Execute;
end;

procedure TDWScriptExpertDockForm.ActionScriptAbortExecute(Sender: TObject);
begin
  if Assigned(FExecutionThread) then
  begin
    FExecutionThread.Abort;
    FExecutionThread.Terminate;
    FExecutionThread := nil;
  end;
end;

procedure TDWScriptExpertDockForm.ActionScriptAbortUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(FExecutionThread);
end;

procedure TDWScriptExpertDockForm.ActionScriptRunExecute(Sender: TObject);
begin
  MemoOutput.Clear;
  RunScript;
end;

procedure TDWScriptExpertDockForm.CompilationCompletedHandler(Sender: TObject;
  CompiledProgram: IdwsProgram);
var
  Index: Integer;
  Node: PVirtualNode;
  NodeData: PCompilerMessage;
begin
  StatusBar.Panels[1].Text := 'Compiled';

  FCompiledProgram := CompiledProgram;

  TreeCompiler.BeginUpdate;
  try
    TreeCompiler.Clear;
    CompilerMessages(FCompiledProgram.Msgs);
  finally
    TreeCompiler.EndUpdate;
  end;

  if TreeCompiler.TotalCount = 0 then
    PageControl.ActivePage := TabSheetOutput
  else
    PageControl.ActivePage := TabSheetCompiler;
end;

procedure TDWScriptExpertDockForm.ExecutionDoneHandler(Sender: TObject);
begin
  FExecutionThread := nil;
end;

procedure TDWScriptExpertDockForm.MenuItemClearClick(Sender: TObject);
begin
  MemoOutput.Clear;
end;

procedure TDWScriptExpertDockForm.MenuSaveMessagesAsClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  try
    Filter := 'Text (*.txt)|*.txt';
    if Execute then
      MemoOutput.Lines.SaveToFile(FileName);
  finally
    Free;
  end;
end;

procedure TDWScriptExpertDockForm.OutputMessage(Text: string);
var
  StringList: TStringList;
  Line: string;
  LineRef: Pointer;
begin
  GDockForm.MemoOutput.Lines.Add(Text);
  (BorlandIDEServices as IOTAMessageServices).ClearMessageGroup(FMessageGroupOutput);
  StringList := TStringList.Create;
  try
    StringList.Text := Text;
    for Line in StringList do
      (BorlandIDEServices as IOTAMessageServices).AddToolMessage('', Line,
        '', 0, 0, nil, LineRef, FMessageGroupOutput);
  finally
    StringList.Free;
  end;
end;

procedure TDWScriptExpertDockForm.LoadScript(FileName: TFileName);
begin
  SynEdit.Lines.LoadFromFile(FileName);
  CurrentFileName := FileName;
  FBackgroundCompilationThread.ScheduleCompilation;
end;

procedure TDWScriptExpertDockForm.SaveScript(FileName: TFileName);
begin
  SynEdit.Lines.SaveToFile(Filename);
  CurrentFileName := Filename;
  Modified := False;
end;

procedure TDWScriptExpertDockForm.CompilerMessages(Messages: TdwsMessageList);
var
  Index: Integer;
  Node: PVirtualNode;
  NodeData: PCompilerMessage;
  LineRef: Pointer;
  SourceFileName: string;
begin
  (BorlandIDEServices as IOTAMessageServices).ClearMessageGroup(FMessageGroupCompiler);
  for Index := 0 to Messages.Count - 1 do
  begin
    Node := GDockForm.TreeCompiler.AddChild(GDockForm.TreeCompiler.RootNode);
    NodeData := GDockForm.TreeCompiler.GetNodeData(Node);
    NodeData.Text := Messages[Index].AsInfo;
    NodeData.Message := Messages[Index];

    if Messages[Index] is TScriptMessage then
    begin
      SourceFileName := TScriptMessage(Messages[Index]).ScriptPos.SourceName;
      if SourceFileName = SYS_MAINMODULE then
        SourceFileName := FCurrentFileName;

      (BorlandIDEServices as IOTAMessageServices).AddToolMessage(
        SourceFileName, Messages[Index].AsInfo, 'DWScript',
        TScriptMessage(Messages[Index]).ScriptPos.Line,
        TScriptMessage(Messages[Index]).ScriptPos.Col,
        nil, LineRef, FMessageGroupCompiler);
    end;
  end;
end;

procedure TDWScriptExpertDockForm.CompileScript;
begin
  FBackgroundCompilationThread.ScheduleCompilation;
end;

procedure TDWScriptExpertDockForm.RunScript(JIT: Boolean = False);
begin
  // abort if no compiled program is available or if it has errors
  if not Assigned(FCompiledProgram) or FCompiledProgram.Msgs.HasErrors then
    Exit;

  // check if execution is still running
  if Assigned(FExecutionThread) then
  begin
    FExecutionThread.Abort;
    FExecutionThread.Terminate;
  end;

  // start new execution in a separate thread
  FExecutionThread := TExecutionThread.Create(FCompiledProgram, JIT);
  FExecutionThread.OnExecutionDone := ExecutionDoneHandler;
end;

procedure TDWScriptExpertDockForm.SetCurrentFileName(const Value: TFileName);
begin
  if FCurrentFileName <> Value then
  begin
    FCurrentFileName := Value;
    UpdateCaption;
  end;
end;

procedure TDWScriptExpertDockForm.SetModified(const Value: Boolean);
begin
  if FModified <> Value then
  begin
    FModified := Value;
    UpdateCaption;
  end;
end;

procedure TDWScriptExpertDockForm.SynCodeSuggestionsClose(Sender: TObject);
begin
  FSuggestions := nil;
end;

procedure TDWScriptExpertDockForm.SynCodeSuggestionsExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var x, y: Integer;
  var CanExecute: Boolean);
var
  CaretPos: TBufferCoord;
  Index: Integer;
  Token: string;
  CodeSuggestions: TSynCompletionProposal;
  Attrib: TSynHighlighterAttributes;
  ScriptSourceItem: TScriptSourceItem;
  ScriptPos: TScriptPos;
begin
  Assert(Sender is TSynCompletionProposal);

  CanExecute := False;

  // use this handler only in case the kind is set to ctCode!
  Assert(Kind = ctCode);

  // clear code suggestions lists
  CodeSuggestions := TSynCompletionProposal(Sender);
  CodeSuggestions.InsertList.Clear;
  CodeSuggestions.ItemList.Clear;

  // update form
  if Assigned(CodeSuggestions.Form) then
  begin
    CodeSuggestions.Form.DoubleBuffered := True;
    CodeSuggestions.Resizeable := True;
    CodeSuggestions.Form.Resizeable := True;
    CodeSuggestions.Form.BorderStyle := bsSizeToolWin;
    if CodeSuggestions.Form.Visible then
      Exit;
  end;

  // get current editor position
  CaretPos := TSynCompletionProposal(Sender).Editor.CaretXY;

  // don't invoke code completion within a string / comment
  SynEdit.GetHighlighterAttriAtRowCol(CaretPos, Token, Attrib);
  if Assigned(Attrib) and (SameText(Attrib.Name, 'string') or
    SameText(Attrib.Name, 'comment')) then
    Exit;

  // ensure the source list is present
  if not Assigned(FCompiledProgram.SourceList) then
    Exit;

  // get script source item
  ScriptSourceItem := FCompiledProgram.SourceList.MainScript;
  if not Assigned(ScriptSourceItem) then
    Exit;

  // setup script position
  ScriptPos := TScriptPos.Create(ScriptSourceItem.SourceFile, CaretPos.Line,
    CaretPos.Char);

  // and create suggestions element
  FSuggestions := TdwsSuggestions.Create(FCompiledProgram, ScriptPos, [soNoUnits]);

  // now populate the suggestion box
  for Index := 0 to FSuggestions.Count - 1 do
    if (FSuggestions.Caption[Index] <> '') and (FSuggestions.Symbols[Index].Name <> '') then
    begin
      Assert(FSuggestions.Symbols[Index] is TSymbol);
      CodeSuggestions.ItemList.AddObject(FSuggestions.Caption[Index],
        TObject(FSuggestions.Category[Index]));
      CodeSuggestions.InsertList.AddObject(FSuggestions.Code[Index],
        FSuggestions.Symbols[Index]);
    end;

  // allow execution if at least one item is available
  CanExecute := CodeSuggestions.ItemList.Count > 0;
end;

procedure TDWScriptExpertDockForm.SynParametersExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var x, y: Integer;
  var CanExecute: Boolean);

  procedure GetParameterInfosForCursor(const AProgram: IdwsProgram; Col,
    Line: Integer; var ParameterInfos: TStrings; InfoPosition: Integer = 0);

    procedure ParamsToInfo(const AParams: TParamsSymbolTable);
    var
      y: Integer;
      ParamsStr: string;
    begin
      ParamsStr := '';
      if (AParams <> nil) and (AParams.Count > 0) then
      begin
        if InfoPosition >= AParams.Count then
          Exit;

        ParamsStr := '"' + AParams[0].Description + ';"';
        for y := 1 to AParams.Count - 1 do
          ParamsStr := ParamsStr + ',"' + AParams[y].Description + ';"';
      end else
      if InfoPosition > 0 then
        Exit;

      if (ParameterInfos.IndexOf(ParamsStr) < 0) then
        ParameterInfos.Add(ParamsStr);
    end;

  var
    Overloads : TFuncSymbolList;

    procedure CollectMethodOverloads(methSym : TMethodSymbol);
    var
      Member: TSymbol;
      Struct: TCompositeTypeSymbol;
      LastOverloaded: TMethodSymbol;
    begin
      LastOverloaded := methSym;
      Struct := methSym.StructSymbol;
      repeat
        for Member in Struct.Members do
        begin
          if not UnicodeSameText(Member.Name, methSym.Name) then
            Continue;
          if not (Member is TMethodSymbol) then
            Continue;

          LastOverloaded := TMethodSymbol(Member);
          if not Overloads.ContainsChildMethodOf(LastOverloaded) then
            Overloads.Add(LastOverloaded);
        end;

        Struct := Struct.Parent;
      until (Struct = nil) or not LastOverloaded.IsOverloaded;
    end;

  var
    ItemIndex: Integer;
    FuncSymbol: TFuncSymbol;

    SymbolDictionary: TdwsSymbolDictionary;
    SymbolPos: TSymbolPositionList;
    Symbol, TestSymbol: TSymbol;
  begin
    // make sure the string list is present
    Assert(Assigned(ParameterInfos));

    // ensure a compiled program is assigned
    if not Assigned(AProgram) then
      Exit;

    SymbolDictionary := AProgram.SymbolDictionary;
    Symbol := SymbolDictionary.FindSymbolAtPosition(Col, Line, MSG_MainModule);

    if (Symbol is TSourceMethodSymbol) then
    begin
      Overloads := TFuncSymbolList.Create;
      try
        CollectMethodOverloads(TSourceMethodSymbol(Symbol));
        for ItemIndex := 0 to Overloads.Count - 1 do
        begin
          FuncSymbol := Overloads[ItemIndex];
          ParamsToInfo(FuncSymbol.Params);
        end;
      finally
        Overloads.Free;
      end;
    end else
    if (Symbol is TFuncSymbol) then
    begin
      ParamsToInfo(TFuncSymbol(Symbol).Params);

      if TFuncSymbol(Symbol).IsOverloaded then
      begin
        for SymbolPos in SymbolDictionary do
        begin
          TestSymbol := SymbolPos.Symbol;
          if (TestSymbol.ClassType = Symbol.ClassType) and
            SameText(TFuncSymbol(TestSymbol).Name, TFuncSymbol(Symbol).Name) and
            (TestSymbol <> Symbol) then
            ParamsToInfo(TFuncSymbol(TestSymbol).Params);
        end;
      end
    end;

    // check if no parameters at all is an option, if so: replace and move to top
    ItemIndex := ParameterInfos.IndexOf('');
    if ItemIndex >= 0 then
    begin
      ParameterInfos.Delete(ItemIndex);
      ParameterInfos.Insert(0, '"<no parameters required>"');
    end;
  end;

var
  Proposal: TSynCompletionProposal;
  LocLine: string;
  TmpX: Integer;
  TmpLocation, StartX, ParenCounter: Integer;
  ParameterInfoList: TStrings;
begin
  CanExecute := False;
  Assert(Kind = ctParams);

  // check the proposal type
  if not (Sender is TSynCompletionProposal) then
    Exit;

  Proposal := TSynCompletionProposal(Sender);
  Proposal.InsertList.Clear;
  Proposal.ItemList.Clear;
  ParameterInfoList := TStrings(Proposal.ItemList);

  with TSynCompletionProposal(Sender).Editor do
  begin
    // get current compiled program
    if not Assigned(FCompiledProgram) then
      Exit;

    LocLine := SynEdit.LineText;

    // go back from the cursor and find the first open paren
    TmpX := CaretX;
    if TmpX > Length(LocLine) then
      TmpX := Length(LocLine)
    else Dec(TmpX);
    TmpLocation := 0;

    while (TmpX > 0) and not CanExecute do
    begin
      if LocLine[TmpX] = ',' then
      begin
        Inc(TmpLocation);
        Dec(TmpX);
      end else if LocLine[TmpX] = ')' then
      begin
        // we found a close, go till it's opening paren
        ParenCounter := 1;
        Dec(TmpX);
        while (TmpX > 0) and (ParenCounter > 0) do
        begin
          if LocLine[TmpX] = ')' then
            Inc(ParenCounter)
          else
          if LocLine[TmpX] = '(' then
            Dec(ParenCounter);
          Dec(TmpX);
        end;
        if TmpX > 0 then Dec(TmpX);  // eat the open paren
      end else if LocLine[TmpX] = '(' then
      begin
        // we have a valid open paren, lets see what the word before it is
        StartX := TmpX;
        while (TmpX > 0) and not IsIdentChar(LocLine[TmpX])do
          Dec(TmpX);
        if TmpX > 0 then
        begin
          while (TmpX > 0) and IsIdentChar(LocLine[TmpX]) do
            Dec(TmpX);
          Inc(TmpX);

          GetParameterInfosForCursor(FCompiledProgram, TmpX, SynEdit.CaretY,
            ParameterInfoList, TmpLocation);

          CanExecute := ParameterInfoList.Count > 0;

          if not CanExecute then
          begin
            TmpX := StartX;
            Dec(TmpX);
          end
          else
            TSynCompletionProposal(Sender).Form.CurrentIndex := TmpLocation;
        end;
      end else Dec(TmpX)
    end;
  end;
end;

procedure TDWScriptExpertDockForm.SynCodeSuggestionsPaintItem(Sender: TObject;
  Index: Integer; TargetCanvas: TCanvas; ItemRect: TRect;
  var CustomDraw: Boolean);
var
  Offset: TPoint;
  ItemName, ItemHighlight: string;
  Symbol: TSymbol;
begin
  inherited;

  if Assigned(SynCodeSuggestions.Images) then
  begin
    TargetCanvas.FillRect(ItemRect);

    ItemHighlight := SynCodeSuggestions.InsertList[index];
    ItemName := SynCodeSuggestions.ItemList[index];

    case TdwsSuggestionCategory(SynCodeSuggestions.ItemList.Objects[index]) of
      scUnit:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 14);
      scType:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 15);
      scRecord, scClass:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 16);
      scInterface:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 17);
      scFunction:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 18);
      scProcedure:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 19);
      scDestructor, scMethod:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 20);
      scConstructor:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 21);
      scProperty:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 22);
      scEnum:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 23);
      scParameter:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 24);
      scConst, scVariable:
        begin
          Assert(SynCodeSuggestions.InsertList.Objects[index] is TSymbol);
          Symbol := TSymbol(SynCodeSuggestions.InsertList.Objects[index]);
          if Symbol is TConstSymbol then
          begin
            if Assigned(TConstSymbol(Symbol).Typ) then
            begin
              // handle custom constants (such as colors)
            end;
          end;
        end;
      scReservedWord:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 25);
      scSpecialFunction:
        SynCodeSuggestions.Images.Draw(TargetCanvas, ItemRect.Left, ItemRect.Top, 25);
    end;

    Offset.x := ItemRect.Left + 18;
    Offset.y := ItemRect.Top;

    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
    TargetCanvas.TextOut(Offset.X, Offset.Y, ItemHighlight);
    Delete(ItemName, 1, Length(ItemHighlight));
    Inc(Offset.X, TargetCanvas.TextWidth(ItemHighlight));
    TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsBold];
    TargetCanvas.TextOut(Offset.X, Offset.Y, ItemName);

    CustomDraw := True;
  end;
end;

procedure TDWScriptExpertDockForm.SynCodeSuggestionsShow(Sender: TObject);
var
  CompletionProposalForm: TSynBaseCompletionProposalForm;
begin
  inherited;

  if (Sender <> nil) and (Sender is TSynBaseCompletionProposalForm) then
  begin
    CompletionProposalForm := TSynBaseCompletionProposalForm(Sender);
    try
      CompletionProposalForm.DoubleBuffered := True;

      if CompletionProposalForm.Height > 300 then
        CompletionProposalForm.Height := 300
    except
      on Exception do;
    end;
  end;
end;

procedure TDWScriptExpertDockForm.SynEditChange(Sender: TObject);
begin
  FBackgroundCompilationThread.ScheduleCompilation;
  Modified := True;
end;

procedure TDWScriptExpertDockForm.SynEditGutterPaint(Sender: TObject; ALine, X, Y: Integer);
var
  StrLineNumber: string;
  LineNumberRect: TRect;
  GutterWidth, Offset: Integer;
  OldFont: TFont;
begin
  with TSynEdit(Sender), Canvas do
  begin
    Brush.Style := bsClear;
    GutterWidth := Gutter.Width - 5;
    if (ALine = 1) or (ALine = CaretY) or ((ALine mod 10) = 0) then
    begin
      StrLineNumber := IntToStr(ALine);
      LineNumberRect := Rect(x, y, GutterWidth, y + LineHeight);
      OldFont := TFont.Create;
      try
        OldFont.Assign(Canvas.Font);
        Canvas.Font := Gutter.Font;
        Canvas.TextRect(LineNumberRect, StrLineNumber, [tfVerticalCenter,
          tfSingleLine, tfRight]);
        Canvas.Font := OldFont;
      finally
        OldFont.Free;
      end;
    end
    else
    begin
      Canvas.Pen.Color := Gutter.Font.Color;
      if (ALine mod 5) = 0 then
        Offset := 5
      else
        Offset := 2;
      Inc(y, LineHeight div 2);
      Canvas.MoveTo(GutterWidth - Offset, y);
      Canvas.LineTo(GutterWidth, y);
    end;
  end;
end;

procedure TDWScriptExpertDockForm.SynEditSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var
  Index: Integer;
begin
  if FBackgroundCompilationThread.CompilationIsDue then
    Exit;

  if not Assigned(FCompiledProgram) then
    Exit;

  for Index := 0 to FCompiledProgram.Msgs.Count - 1 do
    if FCompiledProgram.Msgs[Index] is TScriptMessage then
    begin
      if TScriptMessage(FCompiledProgram.Msgs[Index]).ScriptPos.Line = Line then
      begin
        if FCompiledProgram.Msgs[Index].IsError then
          BG := $C0C0FF
        else
        if FCompiledProgram.Msgs[Index] is TInfoMessage then
          BG := $FFD8C0
        else
          BG := $C0FFFF;
        Special := True;
      end;
    end;
end;

procedure TDWScriptExpertDockForm.SynEditStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  if [scCaretX, scCaretY] * Changes <> [] then
  begin
    StatusBar.Panels[0].Text := Format('%d : %d', [TSynEdit(Sender).CaretX,
      TSynEdit(Sender).CaretY]);
  end;
end;

procedure TDWScriptExpertDockForm.TreeCompilerDblClick(Sender: TObject);
var
  NodeData: PCompilerMessage;
  CompilerMessage: TdwsMessage;
begin
  // check if item is selected at all
  if not Assigned(TreeCompiler.FocusedNode) then
    Exit;

  NodeData := TreeCompiler.GetNodeData(TreeCompiler.FocusedNode);
  CompilerMessage := NodeData^.Message;

  if CompilerMessage is TScriptMessage then
  begin
    SynEdit.GotoLineAndCenter(TScriptMessage(CompilerMessage).Line);
    SynEdit.CaretX := TScriptMessage(CompilerMessage).Col;
  end;
end;

procedure TDWScriptExpertDockForm.TreeCompilerFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NodeData: PCompilerMessage;
begin
  NodeData := Sender.GetNodeData(Node);
  Finalize(NodeData^);
end;

procedure TDWScriptExpertDockForm.TreeCompilerGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  NodeData: PCompilerMessage;
begin
  NodeData := Sender.GetNodeData(Node);
  if NodeData.Message is TErrorMessage then
    ImageIndex := 0
  else if NodeData.Message is TWarningMessage then
    ImageIndex := 1
  else if NodeData.Message is TInfoMessage then
    ImageIndex := 2;
end;

procedure TDWScriptExpertDockForm.TreeCompilerGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  NodeData: PCompilerMessage;
begin
  if not Assigned(Node) then
    Exit;

  NodeData := Sender.GetNodeData(Node);
  CellText := NodeData^.Text;
end;

procedure TDWScriptExpertDockForm.UpdateCaption;
begin
  if FCurrentFileName = '' then
    Caption := FOriginalCaption
  else
    Caption := FOriginalCaption + ' - ' + ExtractFileName(FCurrentFileName);

  if Modified then
    Caption := Caption + ' *';
end;

end.
