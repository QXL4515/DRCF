package getdata;

import java.util.*;

public class Main{
  public static void main(String[] args) {
	  float a,b;
	  Scanner sc=new Scanner(System.in);
	  a=sc.nextFloat();
	  b=sc.nextFloat();
	  while(sc.hasNextFloat()&&a!=999) {
		  System.out.println((float)(int)((b-a)*100)/100);
		  a=b;
		  b=sc.nextFloat();
	  }
  }
}
