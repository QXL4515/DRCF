function y3=getnumber(month,day)
if(month==1)
    y3=day;
elseif(month==2)
    y3=31+day;
elseif(mod(month,2)==1&&month<8)
    y3=59+fix((month-2)/2)*61+day;
elseif(mod(month,2)==0&&month<8)
    y3=59+fix((month-2)/2)*61-30+day;
elseif(mod(month,2)==0&&month>7)
    y3=212+fix((month-7)/2)*61+day;
else
    y3=212+fix((month-7)/2)*61-30+day;
end