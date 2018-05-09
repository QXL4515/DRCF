function yyy=getdata(month,station)
yyy=cell(1,122);
m=0;
for i=1:1:month
    num1=getmonthday(i);
    for j=1:1:num1
        m=m+1;
        n=0;
        for k=12:3:33
            n=n+1;
            if(i==1&&j==1)
                path=getpath(2016,12,31,k);
            elseif(i>1&&j==1)
                path=getpath(2017,i-1,getmonthday(i-1),k);
            else
                path=getpath(2017,i,j-1,k);
            end
            if(exist(path,'file'))
                 a=importdata(path,'\n');
                 [m1,n1]=size(a);
                 if(m1==7657)
                     for p=1:1:122
                         x=station(p,2);y=station(p,3);
                         if(x<145&&x>60&&y>15&&y<50)
                             num=round((50-y)*8)*681+round((x-60)*8)+1;
                             rol=fix(num/25)+3;
                             col=num-(rol-3)*25+1;
                             c=regexp(a{rol,1},'\s+','split');
                             [m2,n2]=size(c);
                             if(n2==26)
                                 yyy{1,p}(m,n)=str2num(c{1,col+1});
                             else
                                 yyy{1,p}(m,n)=str2num(c{1,col}); 
                             end
                         else
                              yyy{1,p}(m,n)=-999;   
                         end
                     end
                 else
                      for p=1:1:122
                           yyy{1,p}(m,n)=-999;
                      end
                 end
            else
                 for p=1:1:122
                      yyy{1,p}(m,n)=-999;
                 end
            end
        end
    end
end               