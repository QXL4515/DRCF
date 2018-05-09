a=importdata('2016.txt');
rain1=a(:,20);
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