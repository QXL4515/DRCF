package math;

import java.io.*;
import java.util.Scanner;

public class Matrix {
   private int m;
   private int n;
   private double[][] matrix;
   public Matrix() {}
   public Matrix(int m,int n) {
	   this.m=m;
	   this.n=n;
	   this.matrix=new double[m][n];
	   for(int i=0;i<m;i++)
		   for(int j=0;j<n;j++)
			   this.matrix[i][j]=0;
   }
   public Matrix(Matrix matrix1) {
	   this.m=matrix1.getM();
	   this.n=matrix1.getN();
	   this.matrix=new double[this.m][this.n];
	   for(int i=0;i<this.m;i++)
		   for(int j=0;j<this.n;j++)
			   this.matrix[i][j]=matrix1.get(i, j);
   }
   public Matrix(String path,int n) throws IOException{
	   this.n=n;
	   File file=new File(path);
	   if(!file.exists()) {
		   this.m=1;
		   System.out.println("file do not exist!");
		   this.matrix=new double[m][n];
		   for(int i=0;i<m;i++)
			   for(int j=0;j<n;j++)
				   this.matrix[i][j]=0;
	   }
	   else {
		//   Scanner sc1=new Scanner(file);
		//   int j=0;
		 //  while(sc1.hasNextLine())
		//	   j++;
		//   this.m=j;
		//   sc1.close();
		   matrix=new double[10000][this.n];
		   Scanner sc=new Scanner(file);
		   String read;
		   String[] string=new String[n+2];
		   int i=0;
		   while(sc.hasNextLine()) {
			   read=sc.nextLine();
			   string=read.split("\\s++");
			   for(int k=0;k<n;k++)
				   matrix[i][k]=Double.parseDouble(string[k]);
			   i=i+1;
		   }
		   this.m=i;
		   sc.close();
	   }
   }
   public int getM() {
	   return m;
   }
   public int getN() {
	   return n;
   }
   public double get(int i,int j) {
	   return matrix[i][j];
   }
   public void set(int i,int j,double x) {
	   matrix[i][j]=x;
   }
   public void deleteRow(int i) {
	   if(i<0||i>=m)
		   System.out.println("wrong!");
	   for(int k=i;k<m-1;k++)
		   for(int j=0;j<n;j++)
			   matrix[k][j]=matrix[k+1][j];
	   this.m=this.m-1;
   }
   public void deleteCol(int k) {
	   if(k<0||k>=n)
		   System.out.println("wrong!");
	   for(int i=0;i<m;i++)
		   for(int j=k;j<n-1;j++)
			   matrix[i][j]=matrix[i][j+1];
	   this.n=this.n-1;
   }
   public void printOut() {
	   for(int i=0;i<m;i++) {
		   for(int j=0;j<n;j++)
			   System.out.print(matrix[i][j]+"  ");
		   System.out.println(" ");
	   }
   }
   
   
   public static void main(String[] args) throws IOException{
      Matrix matrix=new Matrix("F:\\data\\2016Äê\\58102.txt",21);
      matrix.printOut();
   }
}
