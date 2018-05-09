package math;

public class Array {
  private double[] array;
  private int size;
  public Array() {}
  public Array(int size) {
	  this.size=size;
	  this.array=new double[size];
	  for(int i=0;i<size;i++)
		  this.array[i]=0;
  }
  public Array(double[] array,int size) {
	  this.size=size;
	  this.array=new double[size];
	  for(int i=0;i<size;i++)
		  this.array[i]=array[i];
  }
  public Array(Array array1) {
	  this.size=array1.getSize();
	  this.array=new double[this.size];
	  for(int i=0;i<size;i++)
		  this.array[i]=array1.get(i);
  }
  public int getSize() {
	  return size;
  }
  public double get(int i) {
	  if(i>=size||i<0) {
		  System.out.println("向量检索超过实际维数");
		  return(double) -1;
	  }
	  return array[i];
  }
  public void set(int i,double x) {
	  array[i]=x;
  }
  public Array copy(Array array1) {
	  Array array2=new Array(array1.getSize());
	  for(int i=0;i<array1.getSize();i++)
		  array2.set(i, array1.get(i));
	  return array2;
  }
  public double multWithArray(Array array1) {
	  if(array1.getSize()!=this.size) {
		  System.out.println("向量相乘维数出错");
		  return(double) -1;
	  }
	  double sum=0;
	  for(int i=0;i<size;i++)
		  sum+=array[i]*array1.get(i);
	  return sum;
  }
  public void multWithDouble(Array array,double a) {
	  if(array.getSize()!=size) {
		  System.out.println("错误1");
		  return;
	  }
	  for(int i=0;i<size;i++)
		  this.array[i]=array.get(i)*a;
  }
  public void addArray(Array array) {
	  if(array.getSize()!=size) {
		  System.out.println("错误2");
		  return;
	  }
	  for(int i=0;i<size;i++)
		  this.array[i]=this.array[i]+array.get(i);
  }
  public void print() {
	  for(int i=0;i<size;i++)
		  System.out.print(array[i]+"  ");
  }
  
  public void standard() {
	  double sum=0;
	  for(int i=0;i<size;i++)
		  sum=sum+array[i];
	  double mean=sum/size;
	  for(int i=0;i<size;i++)
		  array[i]=array[i]-mean;
  }
  
  public void standardmean(int day) {
	  double sum=0;
	  for(int i=0;i<day*24;i++)
		  sum=sum+array[i];
	  double mean=sum/(day*24);
	  for(int i=0;i<day*24;i++)
		  array[i]=array[i]-mean;
	  for(int i=day*24;i<size;i++) {
		  sum=0;
		  for(int j=i-day*24;j<i;j++)
			  sum=sum+array[j];
		  mean=sum/(day*24);
		  array[i]=array[i]-mean;
	  }	  
  }
  
  public int sort() {
	  double aa=array[0];
	  int j=0;
	  for(int i=0;i<size;i++)
		  if(array[i]>aa) {
			  aa=array[i];
			  j=i;
		  }
	  return j;
  }
}
