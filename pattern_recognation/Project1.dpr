program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Koordinat in 'Koordinat.pas';

{$R *.res}

begin
  Application.Initialize;
 Application.MainFormOnTaskbar := True;
  //Application.CreateForm(Tfrmfullscreen, frmfullscreen);
  //Application.CreateForm(Tfrmfullscreen, frmfullscreen);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(Tfrmfullscreen, frmfullscreen);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(Tfrmfullscreen, frmfullscreen);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
