function y=corref(x,y1)
%计算相关系数
[m,n]=size(x);
var1=0;
var2=0;
cov=0;
for i=1:1:m
    cov=cov+x(i,1)*y1(i,1);
    var1=var1+x(i,1)*x(i,1);
    var2=var2+y1(i,1)*y1(i,1);
end
y=cov/sqrt(var1*var2);