function y=serchstation(station,number)
%搜索符合要求的站点
a=importdata('E:\data\station.txt');
[m,n]=size(a);
for i=1:1:m
    if(a(i,1)==station)
        jindu=a(i,2);
        weidu=a(i,3);
        break;
    end
end
if(i<m)
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
    if(sta(i+1,1)<3)
        stationt(1,i)=1;
    else
        stationt(1,i)=2;
    end
end
[rain,rainfor]=rainforexe(station,station1,stationt);
for i=1:1:number
    y(:,i)=rrr(rainfor(:,1:i),rain,0);
end
else
    y=0;
end