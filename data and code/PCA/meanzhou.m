function y=meanzhou(a1,t,tag2)      
[m,n]=size(a1);
a2=zeros(m,n);
if(tag2==1)
    zhouqi=8;
else
    zhouqi=24;
end
for j=1:1:n
    mean1=zeros(m,1);
    for i=1:1:m
        if(i<=t*zhouqi)
            mean1(i,1)=mean(a1(1:(t*zhouqi),j));
        else
            mean1(i,1)=mean(a1((i-t*zhouqi):(i-1),j));
        end
    end
    for i=1:1:m
        a2(i,j)=a1(i,j)-mean1(i,1);
    end
end
y=a2;