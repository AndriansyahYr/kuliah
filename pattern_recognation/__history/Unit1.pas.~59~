unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.FileCtrl, System.Math, Vcl.Grids;
 const
   PixelCountMax = 32768;
   pembagiPixel = 3;
type
   pRGBArray = ^TRGBArray;
   TRGBArray = array[0..PixelCountMax-1] of TRGBTriple;
type
  TForm1 = class(TForm)
    drvgambar: TDriveComboBox;
    fdgambar: TDirectoryListBox;
    flgambar: TFileListBox;
    Rggambar: TRadioGroup;
    EdAlamatFile: TEdit;
    Bevel1: TBevel;
    Bevel3: TBevel;
    TLearn: TButton;
    TRecognize: TButton;
    btfullscreen: TButton;
    imggambar: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LalamatFld: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    TObjek: TEdit;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure tampilkan;
procedure Belajar(nilaiI : integer);
    function CropImage(x,y,a,b:integer;gambar:TBitmap):real;
    function presentase(img:TBitmap):real;
    procedure RggambarClick(Sender: TObject);
    procedure flgambarClick(Sender: TObject);
    procedure TLearnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
procedure LearnObjek(status : bool);
    procedure TRecognizeClick(Sender: TObject);
    procedure minimum();
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
private
    { Private declarations }
  public
    { Public declarations }
  end;

var
myFilelearn,myFileRecognize : TextFile;
nilaiXawal,nilaiYawal : integer;
  Form1: TForm1;
  tambah:integer;
  count : integer;
  counter:integer;
  cekData : array[1..100] of real;
   nilaiHitam : array[1..100] of real;
   data : array[1..100] of real;
   coord : array[1..100] of integer;
   coord2 : array[1..100] of integer;
  Ipos,lebarawal,panjangawal:integer;
  image,image2,image3 : TBitmap;
implementation
// uses koordinat;
{$R *.dfm}

procedure TForm1.LearnObjek(status : bool);
var
   i : INTEGER;
   j : INTEGER;
   IsBlack : Integer;
   MyTop, MyBottom, MyLeft, MyRight : Integer;
   TempTop, TempBottom : Integer;
begin
if(status=true) then
  count:=count+1;

  image:= TBitmap.Create;
  image.LoadFromFile(flgambar.FileName);

  image.PixelFormat:=pf4bit;
  image3:=TBitmap.Create;
  image3.PixelFormat:=pf4bit;
  image2:=TBitmap.Create;
  image2.PixelFormat:=pf4bit;
   MyTop := 0;
   TempTop := 0;
   MyBottom := 0;
   TempBottom := image.Height;
   MyLeft := image.Width;
   MyRight := 0;

   //mencari pixel paling atas
   for j := 0 to image.Height-1 do
   begin
     isBlack := 0;
     for i := 0 to image.Width-1 do
     begin
     if image.Canvas.Pixels[i,j]<>clWhite then
          inc(isBlack);
     end;
     if isBlack = 0 then Inc(TempTop);
     if isBlack <> 0 Then MyTop := TempTop;
   end;

   //mencari pixel paling bawah
   for j := image.Height-1 Downto 0 do
   begin
     isBlack := 0;
     for i := 0 to image.Width-1 do
     begin
     if image.Canvas.Pixels[i,j]<>clWhite then
     inc(isBlack);
     end;
     if isBlack = 0 then Dec(TempBottom);
     if isBlack <> 0 Then MyBottom := TempBottom;
   end;

   //mencari pixel paling kiri
   for j := 0 to image.Height-1 do
   begin
     for i := 0 to image.Width-1 do
     begin
       if image.Canvas.Pixels[i,j]<>clWhite then
       if i < MyLeft then MyLeft := i;
     end;
   end;

   //mencari pixel paling kanan
   for j := 0 to image.Height-1 do
   begin
     for i := image.Width-1  downto 0 do
     begin
       if image.Canvas.Pixels[i,j]<>clWhite then

       if i > MyRight then MyRight := i;
     end;
   end;


   image2.Width := MyRight - MyLeft;
   image2.Height := MyBottom - MyTop;

   image3.Width := MyRight - MyLeft;
   image3.Height := MyBottom - MyTop;
//   ShowMessage(IntToStr(MyRight)+' '+IntToStr(MyLeft));
//   ShowMessage(IntToStr(MyTop)+' '+IntToStr(MyBottom));

  //BitBlt untuk croping image sesuai dengan algoritma pencarian nilai terpinggir
   BitBlt(image2.canvas.Handle,0,0,image2.Width,image2.Height
        , image.Canvas.Handle,myleft,mytop,
         SRCCOPY);
    BitBlt(image3.canvas.Handle,0,0,image3.Width,image3.Height
        , image.Canvas.Handle,myleft,mytop,
         SRCCOPY);

   image3.SaveToFile('F:\image\pengenalan ttd\temp\temp2.bmp');
   image3.saveToFile('F:\image\pengenalan ttd\temp\temp.bmp');
//   belajar(image2);
    counter:=0;
   for i := 1 to 8 do
   begin
      counter:=counter+1;
      Belajar(i);
   end;

//   image2.Free;
 end;
procedure TForm1.TLearnClick(Sender: TObject);
begin
  LearnObjek(true);
  TObjek.Enabled:=true;
  Button1.Enabled:=true;
end;

 procedure TForm1.Button1Click(Sender: TObject);
 var i,sum1,sum2:integer;

 begin
  sum1:=0;
  sum2:= 0;
 Append(myFilelearn);
  counter:=(counter*2);
  StringGrid1.Cells[0,count] := TObjek.Text;
  Write(myFilelearn,StringGrid1.Cells[0,count]+' ');
  for i := 1 to counter do
  begin
    if(i mod 2 = 1) then
    begin
      StringGrid1.Cells[i,count]:=IntToStr(coord[i-sum1]);
      sum1:=sum1+1;
      sum2:=sum1;
    end
    else
    begin
      StringGrid1.Cells[i,count]:=IntToStr(coord2[i-sum2]);
    end;
    write(myFilelearn,StringGrid1.Cells[i,count]+' ');
    end;
    writeln(myFilelearn,' ');
    CloseFile(myFilelearn);
    Reset(myFilelearn);

  TObjek.Enabled:=false;
  Button1.Enabled:=false;
  TObjek.Text:='';
 end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:integer;
begin
  count:=0;
  counter:=0;
  tambah:=0;
  for i := 1 to StringGrid1.ColCount-1 do
  begin
    for j := 0 to StringGrid1.RowCount-1 do
    begin
      StringGrid1.Cells[j,i]:='';
    end;
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var i:integer;
begin
  for i := 1 to 6 do
    ShowMessage(IntToStr(coord[i])+' '+IntToStr(coord2[i]));
end;

procedure TForm1.Belajar(nilaiI:integer);
var i, j,x,y,a,b,sum : integer;
    img1 : TBitmap;
    rata1,rata2: integer;
begin
      img1:=TBitmap.Create;
      img1.PixelFormat:=pf4bit;
      if(nilaiI mod 2=0) then
        img1.loadFromFile('F:\image\pengenalan ttd\temp\temp.bmp')
      else
        img1.LoadFromFile('F:\image\pengenalan ttd\temp\temp2.bmp');

      sum:=0;
      x:=0;
      y:=0;
      for i := 0 to img1.Height-1 do
        begin
          for j := 0 to img1.Width-1 do
          begin
            if(img1.Canvas.Pixels[j,i]<>clWhite) then
            begin
              sum:=sum+1;
              x:=x+j;
              y:=y+i;
            end;
          end;
        end;
        rata1:=x div sum;
        rata2:=y div sum;
        coord[nilaiI]:=rata1;
        coord2[nilaiI]:=rata2;
        if(nilaiI<=2) then
        begin
            if(nilaiI=1) then
            begin
              nilaiXAwal:=rata1;
              CropImage(rata1,0,img1.Width-rata1,img1.Height-1,img1);
            end
            else
              CropImage(nilaiXawal+rata1,0,(img1.Width-1)-rata1,img1.Height-1,img1);
        end
        else if(nilaiI<=4) then
        begin
          CropImage(0,0,rata1,image3.Height-1,img1);
        end
        else if (nilaiI<=6) then
        begin
          if(nilaiI = 5) then
          begin
            CropImage(0,rata2,img1.Width-1,(img1.Height-1)-rata2,img1);
            nilaiYawal:=rata2;
          end
          else
          begin
            CropImage(0,nilaiYawal+rata2,img1.Width-1,(img1.Height-1)-(rata2),img1);
          end;

        end
          else if nilaiI<=8 then
            CropImage(0,0,img1.Width-1,(img1.Height-1)-rata2,img1);


end;
function TForm1.CropImage(x,y,a,b:integer;gambar:TBitmap):real;
//var
//  img : TBitmap;
begin

  image3:=TBitmap.Create;
  image3.PixelFormat:=pf4bit;
  gambar:=TBitmap.Create;
  gambar.PixelFormat:=pf4bit;
  //img.LoadFromFile('F:\image\temp.bmp');
  image3.Width:=a;
  image3.Height:=b;
  BitBlt(image3.Canvas.Handle,0,0,a,b,image2.Canvas.Handle,x,y,SRCCOPY);
//  algortima untuk mmengcrop gambar sesuai dengan x dan y atau coordinat dari sebuah gambar

    image3.SaveToFile('F:\image\pengenalan ttd\temp\pengpol'+IntToStr(tambah)+'.bmp');
    image3.SaveToFile('F:\image\pengenalan ttd\temp\temp.bmp');
  tambah:=tambah+1;
//  CropImage:= presentase(img);
end;

function tform1.presentase(img:TBitmap):real;
//algoritma untuk mencari persentase hitam dan putih dengan membandingkan nilai
//counthitam dibagi dengan jumlah pixel hitam dan putih
var i,j,countHitam,countPutih:integer;
begin
//    countHitam:=0;
//    countPutih:=0;
//     for i := 1 to img.Height-1 do
//     begin
//        for j := 1 to img.Width-1 do
//        begin
//          if(img.Canvas.Pixels[j,i]<>clWhite) then
//            countHitam:=countHitam+1
//          else
//            countPutih:=countPutih+1;
//        end;
//     end;
//     presentase:=countHitam/(countHitam+countPutih);
end;

procedure TForm1.TRecognizeClick(Sender: TObject);
var i,j,sum1,sum2:integer;
    temp: real;
begin
  LearnObjek(false);
  Rewrite(myFileRecognize);
  sum1:=0;sum2:=0;
  for i := 1 to 16 do
  begin
//    StringGrid2.Cells[i,1]:=FloatToStr(nilaiHitam[i]);
    if(i mod 2 = 1) then
    begin
      StringGrid2.Cells[i,1]:=IntToStr(coord[i-sum1]);
      sum1:=sum1+1;
      sum2:=sum1;
    end
    else
    begin
      StringGrid2.Cells[i,1]:=IntToStr(coord2[i-sum2]);
    end;
    write(myFileRecognize,StringGrid2.Cells[i,1]+' ');
    //inisialisasi nilai StringGrid2 dari nilai yang akan direcognize
    end;
    writeln(myFileRecognize,' ');
    CloseFile(myFileRecognize);
    Reset(myFileRecognize);
  for i := 1 to count do
  begin
    temp:=0;
    for j:= 1 to StringGrid1.RowCount-3 do
    begin
      if(i<=count) then
      begin
        temp:= temp+sqr((StrToInt(StringGrid1.Cells[j,i])-StrToInt(StringGrid2.Cells[j,1])));
        //algoritma untuk mencari rumus euclidean distance
//        ShowMessage((StringGrid2.Cells[j,1]));
      end;
    end;
  cekData[i]:= sqrt(temp);
  end;
  minimum;
end;

procedure tform1.minimum();
//mencari nilai objek apa yang mempunyai nilai terkecil yang kemudian di masukkan ke StringGrid
//untuk mendapatkan objek apa yang terkecil
var min : real;
    i,iterasi:integer;
begin
    min := cekData[1];
    iterasi := 1;
    for i := 1 to count do
    begin
      if(min>cekdata[i]) then
      begin
        min:=cekData[i];
        iterasi:=i;
      end;
    end;
    ShowMessage('Recognize Object As : '+StringGrid1.Cells[0,iterasi]);
end;

procedure TForm1.flgambarClick(Sender: TObject);
begin
    TLearn.Enabled:=true;
    TRecognize.Enabled:=true;
    tampilkan;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:integer;
begin
  AssignFile(myFilelearn, 'learn.txt');
  AssignFile(myFileRecognize,'recognize.txt');
  //set awal untuk table
  for i := 0 to StringGrid1.ColCount-1 do
    for j := 0 to StringGrid1.RowCount-1 do
    begin
      if(i=0) and (j=0) then
        StringGrid1.Cells[j,i]:='Objek'
      else if (i=0) and (j=1) then
        StringGrid1.Cells[j,i]:= 'X1'
      else if (i=0) and (j=2) then
        StringGrid1.Cells[j,i]:= 'Y1'
      else if (i=0) and (j=3) then
        StringGrid1.Cells[j,i]:= 'X2'
      else if (i=0) and (j=4) then
        StringGrid1.Cells[j,i]:= 'Y2'
      else if (i=0) and (j=5) then
        StringGrid1.Cells[j,i]:= 'X3'
      else if (i=0) and (j=6) then
        StringGrid1.Cells[j,i]:= 'Y3'
      else if (i=0) and (j=7) then
        StringGrid1.Cells[j,i]:= 'X4'
      else if (i=0) and (j=8) then
        StringGrid1.Cells[j,i]:= 'Y4'
      else if (i=0) and (j=9) then
        StringGrid1.Cells[j,i]:= 'X5'
      else if (i=0) and (j=10) then
        StringGrid1.Cells[j,i]:= 'Y5'
      else if (i=0) and (j=11) then
        StringGrid1.Cells[j,i]:= 'X6'
      else if (i=0) and (j=12) then
        StringGrid1.Cells[j,i]:= 'Y6'
      else if (i=0) and (j=13) then
        StringGrid1.Cells[j,i]:= 'X7'
      else if (i=0) and (j=14) then
        StringGrid1.Cells[j,i]:= 'Y7'
      else if (i=0) and (j=15) then
        StringGrid1.Cells[j,i]:= 'X8'
      else if (i=0) and (j=16) then
        StringGrid1.Cells[j,i]:= 'X8';
    end;

end;

procedure TForm1.RggambarClick(Sender: TObject);
begin
      case Rggambar.ItemIndex of
      0: flgambar.Mask:= '*.bmp';
      1: flgambar.Mask:= '*.jpg';
      2: flgambar.Mask:= '*.wmf';
      3: flgambar.Mask:= '*.ico';
      end;
end;

procedure tform1.tampilkan;
begin
  imggambar.Top:=140;
  imggambar.Left:=377;

  //tampilkan gambar
  imggambar.Stretch:=False;
  imggambar.AutoSize:=true;
  imggambar.Picture.LoadFromFile(flgambar.FileName );

  //ambil nilai awal
  lebarawal:=imggambar.Width;
  panjangawal:=imggambar.Height;

  //set ukuran normal
  imggambar.Height:=panjangawal;
  imggambar.Width:=lebarawal;
end;

end.
