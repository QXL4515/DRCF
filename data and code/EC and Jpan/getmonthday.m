function y2=getmonthday(month)
if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
    y2=31;
elseif(month==2)
    y2=28;
else
    y2=30;
end