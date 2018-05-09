package getdata;

import math.Array;
import java.io.*;
import java.util.Scanner;

public class GetSurfaceData {
	private String path="F:\\data\\2016年\\surface\\";
	private String path1="F:\\data\\2016年\\height\\";
	private String path2="F:\\data\\2016年\\plot\\";
	
	public GetSurfaceData() {}
	
	public int dateNum(int year,int month) {        //根据年月输出当月日数
		  if(month==2)
			  if(year%4==0)
				  if(year%100==0&&year%400!=0)
					  return 28;
				  else
					  return 29;
			  else
				  return 28;
		  else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
			  return 31;
		  else
			  return 30;
	}
	
	public Array getDataSingle(int pathNumber,int number) throws IOException {             //根据路径和站号提取数据
		String pathLocal=this.path+String.valueOf(pathNumber)+".000";
		Array array=new Array(21);
		array.set(0, pathNumber);
		File file=new File(pathLocal);
		if(!file.exists()) 
			return array;
		Scanner scn=new Scanner(file);
		String read=scn.nextLine();
		String[] string=new String[16];
		while(scn.hasNextLine()&&scn.hasNextLine()) {
			read=scn.nextLine();
			   string=read.split("\\s++");
			   try {
         	       if(string[0].length()>0&&Double.parseDouble(string[0])==number)
		     	      break;
			   }catch(Exception e) {
				   scn.close();
				   return array;
			   }
		}
		if(scn.hasNextLine()) {
			array.set(1, 1.0);
			for(int i=5;i<12;i++) {
				array.set(i-3, Double.parseDouble(string[i]));
			}
			read=scn.nextLine();
			string=read.split("\\s+");
			for(int i=1;i<11;i++)
				array.set(i+8, Double.parseDouble(string[i]));
			for(int i=13;i<15;i++)
				array.set(i+6, Double.parseDouble(string[i]));
			scn.close();
			return array;
		}
		else {
			scn.close();
			return array;
		}
	}
	
	public void getDataWhole(int number) throws IOException {           //根据站点号提取数据
		File file=new File(this.path2+String.valueOf(number)+".txt");
		FileWriter fw=new FileWriter(file);
		String string,stringi,stringj,stringk;
		Array array=new Array();
		int pathNumber;
		for(int i=3;i<13;i++)
			for(int j=1;j<this.dateNum(2015, i)+1;j++)
				for(int k=1;k<9;k++) {
				    if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4)
				    	stringk='0'+String.valueOf(3*k-1);
				    else
				    	stringk=String.valueOf(3*k-1);
				    string="15"+stringi+stringj+stringk;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    array=this.getDataSingle(pathNumber, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		for(int i=1;i<10;i++)
			for(int j=1;j<this.dateNum(2016, i)+1;j++)
				for(int k=1;k<9;k++) {
				    if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4)
				    	stringk='0'+String.valueOf(3*k-1);
				    else
				    	stringk=String.valueOf(3*k-1);
				    string="16"+stringi+stringj+stringk;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    array=this.getDataSingle(pathNumber, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		//
		for(int i=1;i<11;i++)
			for(int j=1;j<this.dateNum(2017, i)+1;j++)
				for(int k=1;k<9;k++) {
				    if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4)
				    	stringk='0'+String.valueOf(3*k-1);
				    else
				    	stringk=String.valueOf(3*k-1);
				    string="17"+stringi+stringj+stringk;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    array=this.getDataSingle(pathNumber, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		fw.close();		    
	}
	
	
	public static void main(String[] args) throws IOException{
		GetSurfaceData gsd=new GetSurfaceData();
		File file=new File("F:\\data\\2016年\\height.txt");
		Scanner sc=new Scanner(file);
		String read,string;
		String[] strings;
		while(sc.hasNextLine()) {
			read=sc.nextLine();
			strings=read.split("\\s+");
			string=strings[0];
			gsd.getHighDataWhole(Integer.valueOf(string));
		}
		sc.close();
	}
	
	
	public Array getHighDataSingle(int pathNumber,int pathNumber1,int number) throws IOException {             //根据路径和站号提取high数据
		String pathLocal=this.path1+String.valueOf(pathNumber1)+".000";
		Array array=new Array(7);
		array.set(0, pathNumber);
		File file=new File(pathLocal);
		if(!file.exists()) 
			return array;
		Scanner scn=new Scanner(file);
		String read;
		if(scn.hasNextLine())
		    read=scn.nextLine();
		else {
			scn.close();
			return array;
		}
		String[] string=new String[15];
		while(scn.hasNextLine()&&scn.hasNextLine()) {
			read=scn.nextLine();
			   string=read.split("\\s++");
			   try {
         	       if(string[1].length()>0&&Double.parseDouble(string[1])==number)
		     	      break;
			   }catch(Exception e) {
				   scn.close();
				   return array;
			   }
		}
		if(scn.hasNextLine()) {
			array.set(1, 1.0);
			for(int i=6;i<11;i++) {
				array.set(i-4, Double.parseDouble(string[i]));
			}
			scn.close();
			return array;
		}
		else {
			scn.close();
			return array;
		}
	}
	
	public void getHighDataWhole(int number) throws IOException {           //根据站点号提取high数据
		File file=new File(this.path2+String.valueOf(number)+".txt");
		FileWriter fw=new FileWriter(file);
		String string,string1,stringi,stringj,stringk,stringk1;
		Array array=new Array();
		int pathNumber,pathNumber1;
		for(int i=3;i<13;i++)
			for(int j=1;j<this.dateNum(2015, i)+1;j++)
				for(int k=1;k<9;k++) {
				    if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4) 
				    	stringk='0'+String.valueOf(3*k-1);
				    else 
				    	stringk=String.valueOf(3*k-1);
				    if(k<5)
				    	stringk1="08";
				    else
				    	stringk1="20";
				    string="15"+stringi+stringj+stringk;
				    string1="15"+stringi+stringj+stringk1;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    pathNumber1=Integer.parseInt(string1);
				    array=this.getHighDataSingle(pathNumber,pathNumber1, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		for(int i=1;i<10;i++)
			for(int j=1;j<this.dateNum(2016, i)+1;j++)
				for(int k=1;k<9;k++) {
					if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4) 
				    	stringk='0'+String.valueOf(3*k-1);
				    else 
				    	stringk=String.valueOf(3*k-1);
				    if(k<5)
				    	stringk1="08";
				    else
				    	stringk1="20";
				    string="16"+stringi+stringj+stringk;
				    string1="16"+stringi+stringj+stringk1;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    pathNumber1=Integer.parseInt(string1);
				    array=this.getHighDataSingle(pathNumber,pathNumber1, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		//
		for(int i=1;i<11;i++)
			for(int j=1;j<this.dateNum(2017, i)+1;j++)
				for(int k=1;k<9;k++) {
					if(i<10)
				    	stringi='0'+String.valueOf(i);
				    else
				    	stringi=String.valueOf(i);
				    if(j<10)
				    	stringj='0'+String.valueOf(j);
				    else
				    	stringj=String.valueOf(j);
				    if(k<4) 
				    	stringk='0'+String.valueOf(3*k-1);
				    else 
				    	stringk=String.valueOf(3*k-1);
				    if(k<5)
				    	stringk1="08";
				    else
				    	stringk1="20";
				    string="17"+stringi+stringj+stringk;
				    string1="17"+stringi+stringj+stringk1;
				    System.out.println("正在提取"+string+"数据");
				    pathNumber=Integer.parseInt(string);
				    pathNumber1=Integer.parseInt(string1);
				    array=this.getHighDataSingle(pathNumber,pathNumber1, number);
				    for(int ii=0;ii<array.getSize();ii++)
					     fw.write(array.get(ii)+"   ");
				    fw.write("\r\n");
				}
		fw.close();		    
	}
}
