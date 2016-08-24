library DWScriptExpert;

{$IFDEF VER210} // RAD Studio 2010
{$LIBSUFFIX 'D2010'}
{$ENDIF}
{$IFDEF VER220} // RAD Studio XE
{$LIBSUFFIX 'XE'}
{$ENDIF}
{$IFDEF VER230} // RAD Studio XE2
{$LIBSUFFIX 'XE2'}
{$ENDIF}
{$IFDEF VER240} // RAD Studio XE3
{$LIBSUFFIX 'XE3'}
{$ENDIF}
{$IFDEF VER250} // RAD Studio XE4
{$LIBSUFFIX 'XE4'}
{$ENDIF}
{$IFDEF VER260} // RAD Studio XE5
{$LIBSUFFIX 'XE5'}
{$ENDIF}
{$IFDEF VER270} // RAD Studio XE6
{$LIBSUFFIX 'XE6'}
{$ENDIF}
{$IFDEF VER280} // RAD Studio XE7
{$LIBSUFFIX 'XE7'}
{$ENDIF}
{$IFDEF VER290} // RAD Studio XE8
{$LIBSUFFIX 'XE8'}
{$ENDIF}

uses
  ShareMem,
  SysUtils,
  Classes,
  DWScriptExpertForm in '..\Source\DWScriptExpertForm.pas' {DWScriptExpertDockForm},
  DWScriptExpertModule in '..\Source\DWScriptExpertModule.pas' {DataModuleScript: TDataModule},
  DWScriptExpertAbout in '..\Source\DWScriptExpertAbout.pas' {FormAbout},
  DWScriptExpertWizard in '..\Source\DWScriptExpertWizard.pas';

begin
end.

