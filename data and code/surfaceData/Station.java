package getdata;

import java.io.*;
import java.util.Scanner;

public class Station {
   public Station() {}
   public void station()throws IOException {
	   File file=new File("F:\\data\\2016定\\surface\\15031002.000");
	   File file1=new File("F:\\data\\2016定\\station.txt");
	   FileWriter fw=new FileWriter(file1);
	   Scanner sc=new Scanner(file);
	   String string,read,string1,string2;
	   String[] strings;
	   string="1";
	   read=sc.nextLine();
	   read=sc.nextLine();
	   while(sc.hasNextLine()&&!string.equals("99999")) {
		   read=sc.nextLine();
		   strings=read.split("\\s+");
		   if(strings[0].length()<=3) {
			   string=strings[1];
			   string1=strings[2];
			   string2=strings[3];
		   }
		   else {
			   string1=strings[1];
			   string2=strings[2];
		       string=strings[0];
		   }
		   fw.write(string+"       "+string1+"       "+string2+"\r\n");
		   read=sc.nextLine();
	   }
	   sc.close();
	   fw.close();
   }
   public void height() throws IOException{
	   File file=new File("F:\\data\\2016定\\height\\17103120.000");
	   File file1=new File("F:\\data\\2016定\\height.txt");
	   Scanner sc=new Scanner(file);
	   FileWriter fw= new FileWriter(file1);
	   String string1,string2,string,read;
	   String[] strings;
	   read=sc.nextLine();
	   read=sc.nextLine();
	   while(sc.hasNextLine()) {
		   read=sc.nextLine();
		   strings=read.split("\\s+");
		   string=strings[1];
		   string1=strings[2];
		   string2=strings[3];
		   fw.write(string+"     "+string1+"      "+string2+"\r\n");
	   }
	   sc.close();
	   fw.close();
   }
   public static void main(String[] args) throws IOException{
	   Station st=new Station();
	   st.height();
   }
}
