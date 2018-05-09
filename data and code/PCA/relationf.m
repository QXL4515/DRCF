function y=relationf(a1,rain,t,tag1,tag2,yuzhi)
[m,n]=size(a1);
%a2=meanzhou(a1,t,tag2);
a2=a1;
relation=zeros(2,n);
for i=1:1:n
    time1=1;
    rela=0;
    for j=1:1:16
        if(tag1==1)
            relatay=relationarray(a2(:,i),rain,j,yuzhi);
            relat1=corrcoef(relatay(:,1),relatay(:,2));
            relat=relat1(1,2);
        else
            relat1=corrcoef(a2(:,i),rain);
            relat=relat1(1,2);
        end
        if(rela<abs(relat))
            rela=abs(relat);
            time1=j;
        end
    end
    relation(1,i)=time1;
    relation(2,i)=relat;
end
y=relation;
        
        
    
        
        