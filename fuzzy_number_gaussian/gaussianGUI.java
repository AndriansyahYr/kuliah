import java.awt.*;
import java.awt.geom.*;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import java.util.*;

public class gaussianGUI {
 public static void main(String[] args) {
  SwingUtilities.invokeLater(new Runnable() {
   @Override
   public void run() {
    CartesianFrame frame = new CartesianFrame();
    frame.showUI();
   }
  });
 }

}

class CartesianFrame extends JFrame {
 CartesianPanel panel;
 
 public CartesianFrame() {
  
  panel = new CartesianPanel();
  add(panel);
 }
 
 public void showUI() {
  setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  setTitle("Cartesian");
  setSize(700, 700);
  setVisible(true);
 }
}

class CartesianPanel extends JPanel {
  public static double std[];
  public static int sig[];
  public static double alfa;
  public static int xCoordNumbers, nilaiAwal;
  public static int yCoordNumbers = 10;
  public static int jumlahGrafik;
  public CartesianPanel(){
    double data[];
    Scanner in = new Scanner(System.in);
    double alfa = in.nextDouble();
    int rangeAtas = in.nextInt();
    int rangeBawah = in.nextInt(); 
    int variabelLinguistik = in.nextInt();
    std = new double[variabelLinguistik];
    sig = new int[variabelLinguistik];
    int temp = 0;
    while(temp<variabelLinguistik){
      int n = in.nextInt();
      data = new double[n];
      int t = 0;
      while(t<n){
        data[t] = in.nextDouble();
        t++;
      }
      std[temp] = findSTDEV(data);
      sig[temp] = (int) rangeBawah/2;
      temp++;
    }
    this.alfa = alfa;
    this.xCoordNumbers = rangeBawah;
    this.nilaiAwal = rangeAtas;
    this.jumlahGrafik = variabelLinguistik;
  }
 // x-axis coord constants
 public static final int X_AXIS_FIRST_X_COORD = 50;
 public static final int X_AXIS_SECOND_X_COORD = 600;
 public static final int X_AXIS_Y_COORD = 600;
 
 // y-axis coord constants
 public static final int Y_AXIS_FIRST_Y_COORD = 50;
 public static final int Y_AXIS_SECOND_Y_COORD = 600;
 public static final int Y_AXIS_X_COORD = 50;
 
 //arrows of axis are represented with "hipotenuse" of 
 //triangle
 // now we are define length of cathetas of that triangle
 public static final int FIRST_LENGHT = 10;
 public static final int SECOND_LENGHT = 5;
 
 // size of start coordinate lenght
 public static final int ORIGIN_COORDINATE_LENGHT = 6;
 
 // distance of coordinate strings from axis
 public static final int AXIS_STRING_DISTANCE = 20;
 
 public static double findSTDEV(double[] data){
    double hasilRata = 0;
    double s = 0;
    int n = data.length;
    for(int i=0;i<data.length;i++){
      hasilRata += data[i];
      // System.out.println(data[i]);
    }
    hasilRata = hasilRata/n;
    for(int i=0;i<data.length;i++){
      s = s + Math.pow((data[i]-hasilRata),2)/(n-1);
    }
    return Math.sqrt(s);
  }

    private void doDrawing(Graphics g, double std, int sig,int val) {
        double gaus;
        Graphics2D g2d = (Graphics2D) g;
        double Xawal =  X_AXIS_FIRST_X_COORD ;
        double Yawal = Y_AXIS_SECOND_Y_COORD;
        Point2D.Double point = new Point2D.Double(Xawal, Yawal);
        int xLength = (X_AXIS_SECOND_X_COORD - X_AXIS_FIRST_X_COORD)/ xCoordNumbers;
        int yLength = (Y_AXIS_SECOND_Y_COORD - Y_AXIS_FIRST_Y_COORD)/ yCoordNumbers;
        if(val == 0){
          g2d.setColor(Color.blue);
        }
        else if(val == 1){
          g2d.setColor(Color.red);
        }
        else if(val == 2){
          g2d.setColor(Color.green);
        }
        double tempX = 0.0, tempY=0.0;
        for(int i=nilaiAwal;i<=xCoordNumbers;i++){
            gaus = Math.exp(-((Math.pow((i - sig)/std,2))));
            System.out.println(gaus);
            if(gaus>1.0){
              gaus = 0.0;
            }
            Xawal = X_AXIS_FIRST_X_COORD + (i * xLength)-3;
            Yawal = Y_AXIS_SECOND_Y_COORD - ((gaus*10)* yLength);
            if(i==nilaiAwal){
              tempX = X_AXIS_FIRST_X_COORD + (i * xLength)-3;;
              tempY =  Y_AXIS_SECOND_Y_COORD - ((gaus*10)* yLength);
            }
            g2d.draw(new Line2D.Double(tempX, tempY, Xawal, Yawal));
            tempX = X_AXIS_FIRST_X_COORD + (i * xLength)-3;
            tempY =  Y_AXIS_SECOND_Y_COORD - ((gaus*10)* yLength);
        }
        
    }
    public void alpaCut(Graphics g, double alfa, int val){
        Graphics2D g2d = (Graphics2D) g;

        double Xawal =  X_AXIS_FIRST_X_COORD ;
        double Yawal = Y_AXIS_SECOND_Y_COORD;
        Point2D.Double point = new Point2D.Double(Xawal, Yawal);
        int xLength = (X_AXIS_SECOND_X_COORD - X_AXIS_FIRST_X_COORD)/ xCoordNumbers;
        int yLength = (Y_AXIS_SECOND_Y_COORD - Y_AXIS_FIRST_Y_COORD)/ yCoordNumbers;
        //g2d.setStroke(new BasicStroke(3));
        Stroke dashed = new BasicStroke(1, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL, 0, new float[]{9}, 0);
        g2d.setStroke(dashed);
        g2d.setColor(Color.black);
        g2d.draw(new Line2D.Double(X_AXIS_FIRST_X_COORD,Y_AXIS_SECOND_Y_COORD - ((alfa*10)* yLength),
          X_AXIS_FIRST_X_COORD + (xCoordNumbers * xLength)-3,Y_AXIS_SECOND_Y_COORD - ((alfa*10)* yLength)));
        // double BA, BB;
        double BB,BA;
        BB = sig[val]*2 - (sig[val]+(std[val]*Math.sqrt(Math.log(1/alfa))));
        BA = sig[val]+(std[val]*Math.sqrt(Math.log(1/alfa)));
        // System.out.println(BB+"\n"+BA);
        System.out.println("Batas Atas Gambar "+(val+1)+"  = "+BA);
        System.out.println("Batas Bawah Gambar "+(val+1)+" = "+BB);
        g2d.draw(new Line2D.Double(X_AXIS_FIRST_X_COORD + (BA * xLength)-3,
          Y_AXIS_SECOND_Y_COORD,X_AXIS_FIRST_X_COORD + (BA * xLength)-3,Y_AXIS_SECOND_Y_COORD - ((alfa*10)* yLength)));
        g2d.draw(new Line2D.Double(X_AXIS_FIRST_X_COORD + (BB * xLength)-3,
          Y_AXIS_SECOND_Y_COORD,X_AXIS_FIRST_X_COORD + (BB * xLength)-3,Y_AXIS_SECOND_Y_COORD - ((alfa*10)* yLength)));
    }

 public void paintComponent(Graphics g) {
  
  super.paintComponent(g);
  
  Graphics2D g2 = (Graphics2D) g;
  
  g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
    RenderingHints.VALUE_ANTIALIAS_ON);
  
  // x-axis
  g2.drawLine(X_AXIS_FIRST_X_COORD, X_AXIS_Y_COORD,
     X_AXIS_SECOND_X_COORD, X_AXIS_Y_COORD);
  // y-axis
  g2.drawLine(Y_AXIS_X_COORD, Y_AXIS_FIRST_Y_COORD,
     Y_AXIS_X_COORD, Y_AXIS_SECOND_Y_COORD);
  
  // // x-axis arrow
  g2.drawLine(X_AXIS_SECOND_X_COORD - FIRST_LENGHT,
     X_AXIS_Y_COORD - SECOND_LENGHT,
     X_AXIS_SECOND_X_COORD, X_AXIS_Y_COORD);
  g2.drawLine(X_AXIS_SECOND_X_COORD - FIRST_LENGHT,
    X_AXIS_Y_COORD + SECOND_LENGHT,
    X_AXIS_SECOND_X_COORD, X_AXIS_Y_COORD);
  
  // // y-axis arrow
  g2.drawLine(Y_AXIS_X_COORD - SECOND_LENGHT,
     Y_AXIS_FIRST_Y_COORD + FIRST_LENGHT,
     Y_AXIS_X_COORD, Y_AXIS_FIRST_Y_COORD);
  g2.drawLine(Y_AXIS_X_COORD + SECOND_LENGHT, 
     Y_AXIS_FIRST_Y_COORD + FIRST_LENGHT,
     Y_AXIS_X_COORD, Y_AXIS_FIRST_Y_COORD);
  
  // // draw origin Point
  g2.fillOval(
    X_AXIS_FIRST_X_COORD - (ORIGIN_COORDINATE_LENGHT / 2), 
    Y_AXIS_SECOND_Y_COORD - (ORIGIN_COORDINATE_LENGHT / 2),
    ORIGIN_COORDINATE_LENGHT, ORIGIN_COORDINATE_LENGHT);
  
  // draw text "X" and draw text "Y"
  g2.drawString("X", X_AXIS_SECOND_X_COORD - AXIS_STRING_DISTANCE / 2,
     X_AXIS_Y_COORD + AXIS_STRING_DISTANCE);
  g2.drawString("Y", Y_AXIS_X_COORD - AXIS_STRING_DISTANCE,
     Y_AXIS_FIRST_Y_COORD + AXIS_STRING_DISTANCE / 2);
  g2.drawString("(0, 0)", X_AXIS_FIRST_X_COORD - AXIS_STRING_DISTANCE,
     Y_AXIS_SECOND_Y_COORD + AXIS_STRING_DISTANCE);
  
  // numerate axis
  int xLength = (X_AXIS_SECOND_X_COORD - X_AXIS_FIRST_X_COORD)
      / xCoordNumbers;
  int yLength = (Y_AXIS_SECOND_Y_COORD - Y_AXIS_FIRST_Y_COORD)
      / yCoordNumbers;
  
  //draw x-axis numbers
  for(int i = 1; i < xCoordNumbers; i++) {
   g2.drawLine(X_AXIS_FIRST_X_COORD + (i * xLength),
     X_AXIS_Y_COORD - SECOND_LENGHT,
     X_AXIS_FIRST_X_COORD + (i * xLength),
     X_AXIS_Y_COORD + SECOND_LENGHT);
   g2.drawString(Integer.toString(i), 
     X_AXIS_FIRST_X_COORD + (i * xLength) - 3,
     X_AXIS_Y_COORD + AXIS_STRING_DISTANCE);
  }
  
  // //draw y-axis numbers
  for(int i = 1; i < yCoordNumbers; i++) {
   g2.drawLine(Y_AXIS_X_COORD - SECOND_LENGHT,
     Y_AXIS_SECOND_Y_COORD - (i * yLength), 
     Y_AXIS_X_COORD + SECOND_LENGHT,
     Y_AXIS_SECOND_Y_COORD - (i * yLength));
   g2.drawString("0,"+Integer.toString(i), 
     Y_AXIS_X_COORD - AXIS_STRING_DISTANCE, 
     Y_AXIS_SECOND_Y_COORD - (i * yLength));  
 }
  for(int i=0;i<jumlahGrafik;i++){
    doDrawing(g, this.std[i], this.sig[i], i);
  }
  for(int i=0;i<jumlahGrafik;i++){
    alpaCut(g,this.alfa, i);
  }
 }

}