unit DWScriptExpertAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Vcl.Imaging.pngimage, ExtCtrls;

type
  TFormAbout = class(TForm)
    Image: TImage;
    ButtonOK: TButton;
    LabelTitle: TLabel;
    LabelCopyright: TLabel;
    LabelUses: TLabel;
  end;

implementation

{$R *.dfm}

end.

