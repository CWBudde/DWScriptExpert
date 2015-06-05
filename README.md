# DWScriptExpert
DWScript Expert is a Delphi IDE expert to add the power of DWScript to the Delphi IDE

There are times during the development with the Delphi IDE, that a more extensive script language is needed. For example it's sometimes not enough to perform a replace operation and even the keyboard macro recorder might be not flexible enough.
In my case I wanted to delete all occurences of '_' in function names and instead make the following character upperspace, so that 'Some_function' becomes 'SomeFunction'. At the same time this should not be performed for strings (e.g. in C library imported names). With the power of the DelphiAST project, however, it's possible to understand the Delphi code and with this, it's possible to iterate only over functions. I could have written a dedicated expert for this, but I wanted something more general.

With the DWScript Expert it's possible to outsource the expert code to scripts, that can easily be loaded on demand.

It's also possible to write scripts to perform some calculations, which might be too heavy for a calculator. Such as spit out all prime numbers below 100, etc.

This expert is under the Mozilla Public License Version 1.1 and far from being complete. The internal API will be expanded one by one, so either help out, or be patient if a feature you'd like to use is missing.

What works so far (beyond everything that inhertis from DWScript) are simple things like:
* SetCursorPosition(Line, Column: Integer)
* LocateText(Pattern: String)
* ReplaceAll(Pattern, ReplaceText: String)
* SelectCurrentWord
* MoveOneWordRight/Left ([CTRL] + RightArrow/LeftArrow)

Also with the power of DelphiAST it's also possible to iterate through the abstract syntax tree of the active unit.
