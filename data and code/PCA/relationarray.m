function y=relationarray(a,b,t,yuzhi)
%有降水时序列转换
[m1,n1]=size(a);
[m2,n2]=size(b);
y=zeros(m1,2);
j=0;
for i=(t+1):1:m1
    if(b(i,1)>yuzhi)
        j=j+1;
        y(j,1)=a(i-t,1);
        y(j,2)=b(i,1);
    end
end     
y=y(1:j,1:2);