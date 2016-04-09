unit DWScriptExpertWizard;

interface

uses
  Menus, ToolsAPI, DWScriptExpertForm;

type
  TDWScriptExpertWizard = class(TNotifierObject, IOTAWizard)
  protected
    procedure Execute;

    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
//    function GetMenuText: string;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCustomMenuHandler = class(TObject)
    procedure HandleClick(Sender: TObject);
  end;

var
  GDockForm: TDWScriptExpertDockForm;
  GViewScriptMenuItem: TMenuItem;

procedure Register;

implementation

uses
  DeskUtil;

var
  GSeparatorMenuItem: TMenuItem;
  GCustomMenuHandler: TCustomMenuHandler;

{ TDWScriptExpertWizard }

constructor TDWScriptExpertWizard.Create;
begin
  inherited;

end;

destructor TDWScriptExpertWizard.Destroy;
begin

  inherited;
end;

procedure TDWScriptExpertWizard.Execute;
begin

end;

function TDWScriptExpertWizard.GetIDString: string;
begin
  Result := 'DWScriptExpert';
end;

(*
function TDWScriptExpertWizard.GetMenuText: string;
begin
  Result := 'DWScript Expert';
end;
*)

function TDWScriptExpertWizard.GetName: string;
begin
  Result := 'DWScript Expert';
end;

function TDWScriptExpertWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;


{ TCustomMenuHandler }

procedure TCustomMenuHandler.HandleClick(Sender: TObject);
begin
  GDockForm.Visible := not GDockForm.Visible;
  GViewScriptMenuItem.Checked := GDockForm.Visible;
end;


procedure AddIDEMenu;
var
  NTAServices: INTAServices40;
const
  CItemName = 'DWScript Expert';
begin
  NTAServices := BorlandIDEServices as INTAServices40;

  // avoid inserting twice
  if NTAServices.MainMenu.Items[3].Find(CItemName) = nil then
  begin
    GCustomMenuHandler := TCustomMenuHandler.Create;

    GSeparatorMenuItem := TMenuItem.Create(nil);
    GSeparatorMenuItem.Caption := '-';
    NTAServices.MainMenu.Items[3].Add(GSeparatorMenuItem);

    GViewScriptMenuItem := TMenuItem.Create(nil);
    GViewScriptMenuItem.Caption := CItemName;
    GViewScriptMenuItem.OnClick := GCustomMenuHandler.HandleClick;
    NTAServices.MainMenu.Items[3].Add(GViewScriptMenuItem);
  end;
end;

procedure RemoveIDEMenu;
var
  NTAServices: INTAServices40;
begin
  if Assigned(GViewScriptMenuItem) then
  begin
    NTAServices := BorlandIDEServices as INTAServices40;
    NTAServices.MainMenu.Items[3].Remove(GViewScriptMenuItem);
    GViewScriptMenuItem.Free;
  end;

  if Assigned(GSeparatorMenuItem) then
  begin
    NTAServices := BorlandIDEServices as INTAServices40;
    NTAServices.MainMenu.Items[3].Remove(GSeparatorMenuItem);
    GSeparatorMenuItem.Free;
  end;

  if Assigned(GCustomMenuHandler) then
    GCustomMenuHandler.Free;
end;

procedure RegisterDockableForm(FormClass: TDWScriptExpertDockFormClass;
  var FormVar; const FormName: string);
begin
  if @RegisterFieldAddress <> nil then
    RegisterFieldAddress(FormName, @FormVar);
  RegisterDesktopFormClass(FormClass, FormName, FormName);
end;

procedure UnRegisterDockableForm(var FormVar);
begin
  if @UnRegisterFieldAddress <> nil then
    UnregisterFieldAddress(@FormVar);
end;

procedure CreateDockForm;
begin
  // Create the form
  if GDockForm = nil then
  begin
    GDockForm := TDWScriptExpertDockForm.Create(nil);
    GDockForm.Visible := True;
    GViewScriptMenuItem.Checked := GDockForm.Visible;

    // Register to save position with the IDE
    RegisterDockableForm(TDWScriptExpertDockForm, GDockForm,
      'DWScriptExpertDockForm');
  end;
end;

procedure DestroyDockForm;
begin
  if Assigned(GDockForm) then
  begin
    // Cleanup dockable form instance
    UnRegisterDockableForm(GDockForm);
    GDockForm.Free;
    GDockForm := nil;
  end;
end;

procedure ShowDockableForm(Form: TDWScriptExpertDockForm);
begin
  if not Assigned(Form) then
    Exit;
  if not Form.Floating then
  begin
    Form.ForceShow;
    FocusWindow(Form);
//    Form.Focus;
  end
  else
  begin
    Form.Show;
//    Form.Focus;
  end;
end;

var
  Wizard: Integer = 0;

function InitializeWizard(BorlandIDEServices: IBorlandIDEServices): IOTAWizard;
begin
  Result := TDWScriptExpertWizard.Create as IOTAWizard;

  AddIDEMenu;

  // eventually destroy currently existing dock form
  DestroyDockForm;

  // create new dock form
  CreateDockForm;
end;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc;
  var Terminate: TWizardTerminateProc): Boolean; stdcall;
begin
  Result := BorlandIDEServices <> nil;
  RegisterProc(InitializeWizard(BorlandIDEServices));
end;

exports InitWizard name WizardEntryPoint;

procedure Register;
begin
  Wizard := (BorlandIDEServices as IOTAWizardServices).AddWizard(
    InitializeWizard(BorlandIDEServices));
end;

initialization
  GViewScriptMenuItem := nil;
  GSeparatorMenuItem := nil;
  GCustomMenuHandler := nil;

finalization
  RemoveIDEMenu;
  DestroyDockForm;
  if Wizard > 0 then
    (BorlandIDEServices as IOTAWizardServices).RemoveWizard(Wizard);

end.
