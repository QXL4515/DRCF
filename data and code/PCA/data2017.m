function [y2017,r2017]=data2017(relation,coeff,explained)
a=importdata('2017.txt');
rain1=a(:,20);
[m,n]=size(rain1);
a=a(:,1:19);
[m2,n2]=size(a);
m1=m2/3;
a1=zeros(m1,3*n2);
for i=1:1:m1
    for j=1:1:n2
        a1(i,3*j-2)=(a(i*3-2,j)+a(i*3-1,j)+a(i*3,j))/3;
        a1(i,3*j-1)=max([a(i*3-2,j),a(i*3-1,j),a(i*3,j)]);
        a1(i,3*j)=min([a(i*3-2,j),a(i*3-1,j),a(i*3,j)]);
    end
end
rain=zeros(m1,1);
for i=1:1:m1
    rain(i,1)=rain1(i*3-2,1)+rain1(i*3-1,1)+rain1(i*3,1);
end
[m,n]=size(rain);
a1=meanzhou(a1,180,1); %1h or 3h
rain1=rain;
a7=relationmatrix(a1,rain1,relation,-0.1);
rain=rain1(17:m,1);
sum=0;
[mm,nn]=size(a7);
for i=1:1:nn
    sum=sum+explained(i,1);
    if(sum>=99.99)
        break;
    end
end
rol=i;
y=zeros(mm,rol);
for j=1:1:rol
    for k=1:1:mm
        y(k,j)=a7(k,:)*coeff(:,j);
    end
end
y2017=y;r2017=rain;