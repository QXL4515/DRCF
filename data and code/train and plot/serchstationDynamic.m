function [y1,right,judge]=serchstationDynamic(station,number)
%动态搜索符合要求的站点，对应rainForecastDynamic.m
a=importdata('E:\data\station.txt');
[m,n]=size(a);
judge=0;
for i=1:1:m
    if(a(i,1)==station)
        judge=1;
        jindu=a(i,2);
        weidu=a(i,3);
        break;
    end
end
if(judge==0)
    y=0;
else
    y=zeros(2,number);
    sta=zeros(m,2);
    for i=1:1:m
        sta(i,2)=a(i,1);
        sta(i,1)=(a(i,2)-jindu)*(a(i,2)-jindu)+(a(i,3)-weidu)*(a(i,3)-weidu);
    end
    sta=sortrows(sta,1);
    station1=zeros(1,number);
    stationt=zeros(1,number);
    for i=1:1:number
        station1(1,i)=sta(i+1,2);
        y(1,i)=sta(i+1,2);
        y(2,i)=sta(i+1,1);
        if(sta(i+1,1)<6)
            stationt(1,i)=1;
        else
            stationt(1,i)=2;
        end
    end
    [rain,rainfor,judge2]=rainforexe1(station,station1,stationt);
    if(judge2==0)
        judge=0;
        y=0;
        return;
    end
    
    i=1;
    while(i<=number&&y(2,i)<=15*0.4)
        i=i+1;
    end
    number1=i-1;
    
    i=1;
    while(i<=number&&y(2,i)<=5*0.4)
        i=i+1;
    end
    number2=i-1;
    
    i=1;
    while(i<=number&&y(2,i)<=25*0.4)
        i=i+1;
    end
    number3=i-1;
    
    i=1;
    while(i<=number&&y(2,i)<=15*0.4)
        i=i+1;
    end
    number4=i-1;
    
    i=1;
    while(i<=number&&y(2,i)<=10*0.4)
        i=i+1;
    end
    number5=i-1;
    
    i=1;
    while(i<=number&&y(2,i)<=5*0.4)
        i=i+1;
    end
    number6=i-1;
    for i=1:1:number
       right(:,i)=rrr(rainfor(:,1:i),rain,1);
     end            
     y1=rrr1(rainfor,rain,2,number1,number2,number3,number4,number5,number6);
end