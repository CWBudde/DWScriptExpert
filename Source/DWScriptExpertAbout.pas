unit DWScriptExpertAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFormAbout = class(TForm)
    Image: TImage;
    ButtonOK: TButton;
    LabelTitle: TLabel;
    LabelCopyright: TLabel;
    LabelUses: TLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

end.

