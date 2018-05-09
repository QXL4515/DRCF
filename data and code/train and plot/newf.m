function [net,maxi]=newf(y1)
%根据指定的结构训练出MLP
[m,n]=size(y1);
net=newff(y1(:,3:15)',y1(:,16)',[40,10]);
net=train(net,y1(:,3:15)',y1(:,16)');
ys=sim(net,y1(:,3:15)');
ys=ys';
mmean=mean(ys);
max1=0;maxi=0;
for i=(mmean-0.5):0.1:(mmean+1.5)
    a=0;
    for j=1:1:m
        if(y1(j,16)>0&&ys(j,1)>i)
            a=a+1;
        end
        if(y1(j,16)==0&&ys(j,1)<=i)
            a=a+1;
        end
    end
    b=a/m;
    if(b>max1)
        max1=b;
        maxi=i;
    end
end