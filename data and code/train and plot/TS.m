function right=TS(rainfor,rain,t)
%预报准确率统计，统计TS1和TS2
[mm,nn]=size(rainfor);
a=zeros(mm,1);
for i=1:1:mm
    k=0;
    for j=1:1:nn
        if(rainfor(i,j)>0)
            k=k+1;
        end
        if(k>t)
            a(i,1)=1;
        end
    end
end
n1=0;n2=0;n3=0;n4=0;
for i=1:1:mm
    if(a(i,1)==0&&rain(i,1)==0)
        n1=n1+1;
    elseif(a(i,1)==0&&rain(i,1)>0)
        n2=n2+1;
    elseif(a(i,1)>0&&rain(i,1)>0)
        n3=n3+1;
    elseif(a(i,1)>0&&rain(i,1)==0)
        n4=n4+1;
    end
end
right(1,1)=(n1+n3)/(n1+n2+n3+n4);
right(2,1)=n3/(n3+n2);





















