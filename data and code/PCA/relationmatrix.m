function y=relationmatrix(a,b,t,yuzhi)
% 提取有降水时因子矩阵
[m1,n1]=size(a);
y=zeros(m1,n1);
j=0;
s=0;
for kk=1:1:n1
    if(abs(t(2,kk))>0.15)
        s=s+1;
    end
end
for i=17:1:m1
    if(b(i,1)>yuzhi)
        j=j+1;
        l=0;
        for k=1:1:n1
            if(abs(t(2,k))>0.15)
                l=l+1;
                y(j,l)=a(i-t(1,k),k);
            end
        end
    end
end     
y=y(1:j,1:s);