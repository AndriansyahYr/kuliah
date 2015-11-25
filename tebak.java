import java.util.*;
public class tebak{
	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int point = 100;
		int nilai = (int) (Math.random()*10)+1;
		int tebak;
		do{
			tebak = in.nextInt();
			if(tebak>nilai) {
				System.out.println("TOO BIG");
				point -= 10;
			}
			else if(tebak<nilai) {
				System.out.println("TOO SMALL");
				point -= 10;
			}
		}while(tebak!=nilai);
		System.out.println(tebak);
		System.out.println(point);
	}
}