function [rain,rainfor,judge2]=rainForecate(station1,station,stationt)
%½µË®Ô¤²â£¬Î´¿¼ÂÇ¶¯Ì¬µ÷Õû²ßÂÔ
judge2=1;
[nnn,m]=size(station);
model=cell(1,m);
data=cell(1,m);
biaozhi=zeros(1,m);
for i=1:1:m
        [y1,y2,judge1]=before1(station1,station(1,i),station1,stationt(1,i));
        if(judge1==0)
            judge2=0;
            rain=[];rainfor=[];
            return;
        end
        [net,maxi]=newf(y1);
        data{1,i}=y2;
        model{1,i}=net;
        biaozhi(1,i)=maxi;
end
number=0;rain=[];rainfor=[];
for i=1:1:2430
    ii=0;
    for j=1:1:m
        if(data{1,j}(i,2)==0)
            break;
        else
            ii=ii+1;
        end
    end
    if(ii<m)
        continue;
    end
    number=number+1;
    ii=0;
    coo=zeros(1,m);
    for j=1:1:m
        if(data{1,j}(i,15)>0)
            coo(1,j)=1;
        else
            ii=ii+1;
        end
    end
    if(ii==m)
        rain(number,1)=data{1,1}(i,16);
        rainfor(number,1)=0;
        continue;
    end
    rain(number,1)=data{1,1}(i,16);
    bbb=0;
    for j=1:1:m
        bbb=bbb+1;
        if(coo(1,j)==1)
            biao=sim(model{1,j},data{1,j}(i,3:14)');
            if(biao>biaozhi(1,j))
                rainfor(number,bbb)=1;
            else
                rainfor(number,bbb)=0;
            end
        else
           rainfor(number,bbb)=0; 
        end
    end
 end