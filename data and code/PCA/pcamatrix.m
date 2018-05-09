function [y,relation,coeff,explained]=pcamatrix(a,rain,t,tag1,tag2,yuzhi,tag3)       
%通过pca转换输入，a是物理量，rain是降水，t是背景时间，tag1标志相关性计算是否取有降水，
%tag2标志是3小时训练还是1小时训练，yuzhi表示降水阈值，tag3=1表示有降水
relation=relationf(a,rain,t,tag1,tag2,yuzhi);
[mr,nr]=size(relation);
[m,n]=size(a);
a1=meanzhou(a,t,tag2);
if(tag3==1)
    matrix=relationmatrix(a1,rain,relation,0);
    corr=cov(matrix);
    [coeff,latent,explained]=pcacov(corr);
else
    matrix=relationmatrix(a1,rain,relation,-0.1);
    corr=cov(matrix);
    [coeff,latent,explained]=pcacov(corr);
end
sum=0;
matrix1=relationmatrix(a1,rain,relation,-0.1);
[mm,nn]=size(matrix1);
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
        y(k,j)=matrix1(k,:)*coeff(:,j);
    end
end

