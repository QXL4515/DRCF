function [y1,y2]=dataPreprocess(a,b,c)
path1=strcat(num2str(a),'.txt');
path2=strcat(num2str(b),'.txt');
path3=strcat(num2str(c),'.txt');
a58102=importdata(path1);
a58=importdata(path2);
a581=importdata(path3);
[m,n]=size(a58102);
a58102=[a58102(1:m,1:7),a58102(1:m,12),a58102(1:m,14),a58102(1:m,17),a58102(1:m,10)];
a58=[a58(1:m,1:7),a58(1:m,12),a58(1:m,14),a58(1:m,17),a58(1:m,10)];
for i=1:1:(m-1)
    if(a58102(i,11)==9999)
        if(a58102(i+1,11)==9999)
            a58102(i,11)=0;
        else
            a58102(i,11)=a58102(i+1,11)/2;
        end
    end
end
for i=1:1:(m-1)
    if(a58(i,11)==9999)
        if(a58(i+1,11)==9999)
            a58(i,11)=0;
        else
            a58(i,11)=a58(i+1,11)/2;
        end
    end
end
m58102=zeros(1,10);
m58=zeros(1,10);
m581=zeros(1,7);
for i=3:1:10
    sum=0;j=0;
    for k=1:1:m
       if(a58102(k,2)>0&&a58102(k,i)~=9999)
           sum=sum+a58102(k,i);
           j=j+1;
       end
    end
    m58102(1,i)=sum/j;
end
for i=3:1:10
    sum=0;j=0;
    for k=1:1:m
       if(a58(k,2)>0&&a58(k,i)~=9999)
           sum=sum+a58(k,i);
           j=j+1;
       end
    end
    m58(1,i)=sum/j;
end
for i=3:1:7
    sum=0;j=0;
    for k=1:1:m
       if(a581(k,2)>0&&a581(k,i)~=9999)
           sum=sum+a581(k,i);
           j=j+1;
       end
    end
    m581(1,i)=sum/j;
end
for i=3:1:10
    for j=1:1:m
        if(a58102(j,i)==9999)
            a58102(j,i)=m58102(1,i);
        end
        if(a58(j,i)==9999)
            a58(j,i)=m58(1,i);
        end
    end
end
for i=3:1:7
    for j=1:1:m
        if(a581(j,i)==9999)
            a581(j,i)=0;
        else
            a581(j,i)=a581(j,i)-m581(1,i);
        end
    end
end
y1=[];j=0;
for i=1:1:4639
    if(a58102(i,2)>0&&a58(i,2)>0&&a581(i,2)>0&&a58(i,11)>0&&a58102(i+1,2)>0)
        j=j+1;
        y1(j,1)=a58102(i,1);
        y1(j,2)=1;
        for k=3:1:10
            y1(j,k)=a58102(i,k)-a58(i,k);
        end
        for k=11:1:15
            y1(j,k)=a581(i,k-8);
        end
        y1(j,16)=a58(i,11);
        y1(j,17)=a58102(i,11);
    end
end
y2=zeros(2431,17);
for i=4641:1:7071
    if(a58102(i,2)>0&&a58(i,2)>0&&a581(i,2)>0&&a58102(i+1,2)>0)
        y2(i-4640,1)=a58102(i,1);
        y2(i-4640,2)=1;
        for k=3:1:10
            y2(i-4640,k)=a58102(i,k)-a58(i,k);
        end
        for k=11:1:15
            y2(i-4640,k)=a581(i,k-8);
        end
        y2(i-4640,16)=a58(i,11);
        y2(i-4640,17)=a58102(i,11);
    else
        y2(i-4640,1)=a58102(i,1);
        y2(i-4640,2)=0;
    end
end
y1=[y1(:,1:5),y1(:,7:17)];
y2=[y2(:,1:5),y2(:,7:17)];