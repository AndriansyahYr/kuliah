unit IKAN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    StringDataTest: TStringGrid;
    Label1: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    BitBtn1: TBitBtn;
    StringGrid3: TStringGrid;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure readData(str :TStringGrid; txt:string);
    function hitungPeluang(str :TStringGrid; val:integer):double;
    procedure isiStringGrid(str :TStringGrid);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure klasifikasiMissingValue();
    procedure BitBtn1Click(Sender: TObject);
    procedure knn();
    procedure sorting(hasil : array of real; atr:integer;c:integer);
    procedure findString(hasil:array of String; c:integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  data1,noA,noB, miss, complete:integer;
  dataTest : array[1..100,1..100] of String;
  dataMissing : array[1..100,1..100] of String;
  completeData : array[1..100,1..100] of String;
  nilaiKnn : array[0..10] of String;
implementation
{$R *.dfm}
function TForm1.hitungPeluang(str :TStringGrid; val:integer):double;
var i, j,count,temp,temp2:integer;
    status : boolean;
    list : TStrings;
    hasil : string;
begin
  i:=1;
  j:=2;
  temp:=0;
  temp2:=1;
  hasil:='0';
  list:=TStringList.Create;
  status:=true;
  while(status) do
  begin
    if(str.Cells[1,i] = 'JUMLAH') then
      break;
    ExtractStrings(['-'],[],Pchar(str.Cells[1,i]),list);
    if (val > StrToInt(list[temp])) and (val <= StrToInt(list[temp2])) then
    begin
       hasil:=str.Cells[j,i];
       status:=false;
       break;
    end;
    i:=i+1;
    temp:=temp+2;
    temp2:=temp2+2;
  end;
  hitungPeluang:=StrToFloat(hasil);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  knn();
end;

procedure TForm1.knn();
var i,j, counter:integer;
    hitung:real;
    hasil : array[1..100] of real;
    n,nilaiMiss, atribut : integer;
begin
  nilaiMiss:=4;
  n:=1;
  while(n<=nilaiMiss) do
  begin
    counter:=1;
    for i := 1 to StringGrid2.RowCount-1 do
    begin
      hitung:=0;
      for j := 1 to StringGrid2.ColCount-3 do
      begin
        if dataMissing[j, n]= '?' then
          atribut:= j;
        if(completeData[j, i]=dataMissing[j, n]) then
        begin
          hitung:=hitung+0;
        end
        else if(completeData[j, i]<>dataMissing[j,n]) and (dataMissing[j, n] <> '?')then
        begin
          hitung:=hitung+1;
        end;
      end;
      hasil[counter]:=sqrt(hitung);
      counter:=counter+1;
    end;
    sorting(hasil, atribut, n-1);
    n:=n+1;
  end;
end;

procedure TForm1.sorting(hasil : array of real; atr:integer; c:integer);
var i,j, size,nilaiK, ketemu,n, k:integer;
temp, minimum : real;
//n:integer;
s : String;
nilai : array [0..100, 0..100] of real;
tempString : array[0..100] of String;
hasil2 : array[0..100] of real;
begin
//    ShowMessage(IntToStr(atr));
      size:=5;
      nilaiK:=3;
      //isi array
      for i := 0 to size do
        hasil2[i] := hasil[i];

      for i := size downto 0 do
        for j := 0 to i do
        begin
          if(hasil[i]<hasil[j]) then
          begin
            temp:=hasil[i];
            hasil[i]:=hasil[j];
            hasil[j]:=temp;
          end;
        end;

      n:=0;

      while(n<nilaiK) do
      begin
        for i := 0 to size do
        begin
          if(hasil[n]=hasil2[i]) then
          begin
            ketemu:=i;
            hasil2[i]:=100;
            break;
          end;
        end;
//          n:=n+1;
          tempString[n]:=completeData[atr, ketemu+1];
//          ShowMessage(IntToStr(ketemu+1)+' '+tempString[n]);
          n:=n+1;
      end;
      findString(tempString, c);
end;

procedure TForm1.findString(hasil:array of String; c : integer);
var i, nilaiY, nilaiN:integer;
  minimum : real;
  output:String;
begin
  nilaiY:=0;
  nilaiN:=0;
  for i := 0 to 2 do
    begin
      if(hasil[i]='y') then
        nilaiY:=nilaiY+1
      else nilaiN:=nilaiN+1;
    end;

  if(nilaiY>nilaiN) then
  begin
//    ShowMessage('y');
    nilaiKnn[c] := 'y';
  end
  else
  begin
    nilaiKnn[c]:='n';
//  ShowMessage('n');
  end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  readData(StringDataTest,'data test - Copy.txt');
  Button1.Enabled := false;
  Button2.Enabled := true;
end;
procedure TForm1.isiStringGrid(str : TStringGrid);
var
  i,j:integer;
begin
  for i := 0 to str.RowCount-1 do
    for j := 0 to str.ColCount-1 do
        begin
            if (i=0) then
              str.Cells[i,j]:=IntToStr(j);
            if (i=0) and (j=0) then
              str.Cells[j,i]:='No Records'
            else if (i=0) and (j=1) then
              str.Cells[j,i]:='Infants'
            else if (i=0) and (j=2) then
              str.Cells[j,i]:='Crime'
            else if (i=0) and (j=3) then
              str.Cells[j,i]:='Imigration'
            else if (i=0) and (j=4) then
              str.Cells[j,i]:='Duty Free'
            else if (i=0) and (j=5) then
              str.Cells[j,i]:='mx-missile'
            else if (i=0) and (j=6) then
              str.Cells[j,i]:='class'
        end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  isiStringGrid(StringGrid2);
  isiStringGrid(StringGrid1);
  klasifikasiMissingValue();
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
begin
//  for i := 0 to 3 do
//    ShowMessage(nilaiKnn[i]);


  for i := 0 to StringGrid3.ColCount-1 do
    for j := 0 to StringGrid3.RowCount-1 do
        begin
            if (i=0) then
              StringGrid3.Cells[i,j]:=IntToStr(j);
            if (i=0) and (j=0) then
              StringGrid3.Cells[j,i]:='No Records'
            else if (i=0) and (j=1) then
              StringGrid3.Cells[j,i]:='Infants'
            else if (i=0) and (j=2) then
              StringGrid3.Cells[j,i]:='Crime'
            else if (i=0) and (j=3) then
              StringGrid3.Cells[j,i]:='Imigration'
            else if (i=0) and (j=4) then
              StringGrid3.Cells[j,i]:='Duty Free'
            else if (i=0) and (j=5) then
              StringGrid3.Cells[j,i]:='mx-missile'
            else if (i=0) and (j=6) then
              StringGrid3.Cells[j,i]:='class'
        end;
        readData(StringGrid3,'data test - Copy.txt');
end;

procedure TForm1.klasifikasiMissingValue();
var
  i,j, k:integer;
  text:string;
  ketemu:bool;
begin
    text:='?';
     miss:=0;
     complete:=0;
     for i := 1 to StringDataTest.RowCount-1 do
     begin
        ketemu:=false;
        for j := 1 to StringDataTest.ColCount-2 do
        begin
          if(dataTest[j, i] = text) then
          begin
            miss := miss+1;
            for k := 1 to StringDataTest.ColCount-2 do
            begin
              dataMissing[k, miss] := dataTest[k, i];
              StringGrid1.Cells[k, miss] := dataMissing[k, miss];
              ketemu:=true;
            end;
          end
          else if (ketemu=false) and (j=6) then
          begin
            complete:=complete+1;
            for k := 1 to StringDataTest.ColCount-2 do
              begin
                completeData[k, complete] := dataTest[k, i];
                StringGrid2.Cells[k, complete] := completeData[k, complete];
              end;
          end;
        end;
     end;

end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:integer;
  myFile : TextFile;
  text:string;
begin
     for i := 0 to StringDataTest.ColCount-1 do
        for j := 0 to StringDataTest.RowCount-1 do
        begin
            if (i=0) then
              StringDataTest.Cells[i,j]:=IntToStr(j);
            if (i=0) and (j=0) then
              StringDataTest.Cells[j,i]:='No Records'
            else if (i=0) and (j=1) then
              StringDataTest.Cells[j,i]:='Infants'
            else if (i=0) and (j=2) then
              StringDataTest.Cells[j,i]:='Crime'
            else if (i=0) and (j=3) then
              StringDataTest.Cells[j,i]:='Imigration'
            else if (i=0) and (j=4) then
              StringDataTest.Cells[j,i]:='Duty Free'
            else if (i=0) and (j=5) then
              StringDataTest.Cells[j,i]:='mx-missile'
            else if (i=0) and (j=6) then
              StringDataTest.Cells[j,i]:='class'
        end;
        for i := 0 to 3 do
          nilaiKnn[i] :='?';
end;
procedure TForm1.readData(str :TStringGrid; txt:string);
var i,j,count, count2,panjang,k:integer;
    myFile:TextFile;
    list : TStrings;
//    list : array[1..100] of String;
begin
    i:=1;
    j:=1;
    count:=0;
    count2:=0;
    k:=0;
//    jumFrek:=0;
    list:=TStringList.Create;
//    SetLength(list, 100);
    AssignFile(myFile, txt);
    Reset(myFile);
    while not Eof(myFile) do
    begin
      while i<=18 do
      begin
        Readln(myFile, txt);
        ExtractStrings([chr(9)],[],Pchar(txt),list);
        if(i=18) then
          begin
            i := 1;
            j:= j+1;
          end;
        if (count=170) then
          break;
        str.Cells[i,j]:= list[count];
        dataTest[i,j] := list[count];
        if (dataTest[i,j]='?') then
        begin
          dataTest[i,j]:= nilaiKnn[k];
          str.Cells[i,j]:=nilaiKnn[k];
//          ShowMessage(nilaiKnn[k]);
          k:=k+1;
        end;
        i:=i+1;
        count:=count+1;
      end;
    end;
    CloseFile(myFile);
end;
end.
