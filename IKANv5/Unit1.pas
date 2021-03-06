unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StringIkanB: TStringGrid;
    StringIkanA: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    edOutput: TEdit;
    edInputPjg: TEdit;
    Label3: TLabel;
    edInputBrt: TEdit;
    Label4: TLabel;
    edinputRgb: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure readData();
    procedure Button1Click(Sender: TObject);
    function  findRata(str :TStringGrid;col:integer): Double;
    function STDev(str:TStringGrid;rata:double;col:integer) : double;
    function fungsiGaussian(str:TStringGrid;rata : double; std:double;feature:integer) : double;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var rata1,rata3,std3,std1,ikanA1,ikanA2,ikanA3,ikanB3,ikanB1,ikanB2,rata2,std2:double;
    berat,rgb,pjg:integer;
begin

    rata1:=findRata(StringIkanA,1);
    std1:=(STDev(StringIkanA,rata1,1));
    pjg:=StrToInt(edInputPjg.Text);
    ikanA1:=(fungsiGaussian(StringIkanA,rata1,std1,pjg));

    rata2:=findRata(StringIkanA,2);
    std2:=(STDev(StringIkanA,rata2,2));
    berat:=StrToInt(edInputBrt.Text);
    ikanA2:=(fungsiGaussian(StringIkanA,rata2,std2,berat));

    rata3:=findRata(StringIkanA,3);
    std3:=(STDev(StringIkanA,rata3,3));
    rgb:=StrToInt(edInputRGB.Text);
    ikanA3:=(fungsiGaussian(StringIkanA,rata3,std3,rgb));

    ikanA1:=(ikanA1*ikanA3*ikanA2);


    rata1:=findRata(StringIkanB,1);
    std1:=(STDev(StringIkanB,rata1,1));
    pjg:=StrToInt(edInputPjg.Text);
    ikanB1:=(fungsiGaussian(StringIkanB,rata1,std1,pjg));

    rata2:=findRata(StringIkanB,2);
    std2:=(STDev(StringIkanB,rata2,2));
    berat:=StrToInt(edInputBrt.Text);
    ikanB2:=(fungsiGaussian(StringIkanB,rata2,std2,berat));

    rata3:=findRata(StringIkanB,3);
    std3:=(STDev(StringIkanB,rata3,3));
    rgb:=StrToInt(edInputRGB.Text);
    ikanB3:=(fungsiGaussian(StringIkanB,rata3,std3,rgb));

    ikanb1:=ikanb1*ikanB3*ikanA2;
    if(ikanA1>ikanB1) then
      edOutput.Text:='IKAN BANDENG'
    else
      edOutput.Text:='IKAN MUJAIR';
end;

function tform1.STDev(str:TStringGrid; rata:double;col : integer) : double;
var i,j,pembagi:integer;
  sum:double;
begin
     sum:=0;
    pembagi:=0;
    for j := 1 to str.RowCount-1 do
    begin
      if str.Cells[col,j]<>'' then
      begin
          sum:=sum+sqr(rata-StrToInt(str.Cells[col,j]));
          pembagi:=pembagi+1;
      end;
    end;
    STDev:=sqrt(sum/(pembagi-1));
end;

function tform1.fungsiGaussian(str:TStringGrid; rata : double; std:double;feature:integer) : double;
var nil1,temp:double;
begin
  temp:=-(sqr(feature-rata)/(2*sqr(std)));
  nil1:=1*exp(temp*ln(2.718))/(sqrt(2*3.14*std));
  fungsiGaussian:=nil1;
end;
function tform1.findRata(str :TStringGrid;col:integer): double;
var i,j,sum,pembagi:integer;
begin
    sum:=0;
    pembagi:=0;
    for j := 1 to str.RowCount-1 do
    begin
      if str.Cells[col,j]<>'' then
      begin
        sum:=sum+StrToInt(str.Cells[col,j]);
        pembagi:=pembagi+1;
      end;
    end;
    findRata:=sum/pembagi;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:integer;
  myFile : TextFile;
  text:string;
begin
     for i := 0 to StringIkanA.ColCount-1 do
        for j := 0 to StringIkanA.RowCount-1 do
        begin
            if (i=0) then
              StringIkanA.Cells[i,j]:=IntToStr(j);
            if (i=0) and (j=0) then
              StringIkanA.Cells[j,i]:='NO'
            else if (i=0) and (j=1) then
              StringIkanA.Cells[j,i]:='Panjang'
            else if (i=0) and (j=2) then
              StringIkanA.Cells[j,i]:='Berat'
            else if(i=0) and (j=3) then
              StringIkanA.Cells[j,i]:='RGB'
        end;

     for i := 0 to StringIkanB.ColCount-1 do
        for j := 0 to StringIkanB.RowCount-1 do
        begin
            if (i=0) then
              StringIkanB.Cells[i,j]:=IntToStr(j);
            if (i=0) and (j=0) then
              StringIkanB.Cells[j,i]:='NO'
            else if (i=0) and (j=1) then
              StringIkanB.Cells[j,i]:='Panjang'
            else if (i=0) and (j=2) then
              StringIkanB.Cells[j,i]:='Berat'
            else if(i=0) and (j=3) then
              StringIkanB.Cells[j,i]:='RGB'
        end;
        readData;
  end;
procedure tform1.readData();
var
  panjang,i,j,count,count2:integer;
  txt : string;
  myfile : TextFile;
  list : TStrings;
  begin
    j:=0;
    i:=2;
    count:=2;
    count2:=2;
    txt := 'ikan.txt';
    list:=TStringList.Create;
    AssignFile(myfile, txt);
    Reset(myfile);
    while not eof(myfile) do
    begin
      Readln(myfile, txt);
      ExtractStrings([chr(9)],[],Pchar(txt),list);
      inc(j);
    end;
    for i := 0 to (j*4)-1 do
    begin
      if(list[i]='bandeng') then
      begin
        StringIkanA.cells[1,count-1]:=list[i-3];
        StringIkanA.Cells[2,count-1]:=list[i-2];
        StringIkanA.Cells[3,count-1]:=list[i-1];
        inc(count);
      end
      ELSE if(list[i]='mujaer') then
      begin
        StringIkanB.Cells[1,count2-1]:=list[i-3];
        StringIkanB.Cells[2,count2-1]:=list[i-2];
        StringIkanB.Cells[3,count2-1]:=list[i-1];
        inc(count2);
      end;
    end;
    CloseFile(myfile);
  end;
end.
