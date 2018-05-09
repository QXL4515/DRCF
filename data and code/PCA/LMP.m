function [y1,y2]=LMP(y16,y2017,r2017,num,a)
b=zeros(1,a);
for i=1:1:a
    b(1,i)=3;
end
c=cell(1,a+1);
for i=1:1:a+1
    c{1,i}='purelin';
end
net=newff(y16(:,1:num)',y16(:,num+1)',b,c);
net=train(net,y16(:,1:num)',y16(:,num+1)');
net.trainParam.epochs=100;
y17=sim(net,y2017');
y17=y17';
num=zeros(2,21);
for i=1:1:20
    right=0;right1=0;right2=0;
    for j=1:1:2168
        if(r2017(j,1)>0)
            right2=right2+1;
        end
        if(y17(j,1)>i*0.1&&r2017(j,1)>0)
            right=right+1;
        elseif(y17(j,1)<=i*0.1&&r2017(j,1)<0.1)
            right1=right1+1;
        end
    end
        num(1,i)=(right+right1)/2168;
        num(2,i)=right/right2;
end
y1=zeros(1,3);
nn=1;
nnn=0;
for i=1:1:20
    nn1=abs(num(1,i)-num(2,i));
    if(nn>nn1)
         nn=nn1;
         nnn=i;
    end
end
y1(1,1)=nnn*0.1;
y1(1,2)=num(1,nnn);
y1(1,3)=num(2,nnn);
y2=num;