//plot mlp picture
plot(sqrt(b1),'b-*','LineWidth',1);
hold on;
plot(sqrt(b21),'r-o','LineWidth',1);
plot(sqrt(b31),'m-d','LineWidth',1);
plot(sqrt(b41),'g-p','LineWidth',1);
grid on;

//plot fuyang
plotyy([1:1:60],c21{1,100}(2,:),[1:1:60],sqrt(sex1(100,:)));
hold on;
plot(c21{1,100}(1,:));

[AX,H1,H2] =plotyy([1:1:60],c21{1,100}(1,1:1:end),[1:1:60],sqrt(sex1(100,1:1:end)),@plot);% 获取坐标轴、图像句柄
set(get(AX(1),'ylabel'),'string', 'Accuracy rate','fontsize',16,'fontname','Times new Roman');
set(AX(1),'ycolor','k');
set(get(AX(2),'ylabel'),'string', 'RMSE/(mm)','fontsize',16,'fontname','Times new Roman');
set(AX(2),'ycolor','k');
set(AX(1),'fontsize',14,'fontname','Times new Roman');
set(AX(2),'fontsize',14,'fontname','Times new Roman');
xlabel('Number of surrounding sites','fontsize',16,'fontname','Times new Roman');
%set(H1(1:5:end),'Marker','*');
set(H1,'Color','r');
set(H1,'LineWidth',1);
%set(H2(1:5:end),'Marker','o');
set(H2,'Color','g');
set(H2,'LineWidth',1);
hold on;
plot(c21{1,100}(2,:),'m-','Linewidth',1);
plot((c21{1,100}(2,:)+c21{1,100}(1,:))/2,'-','Linewidth',1);
x11=[1:3:60];
x12=c21{1,100}(1,1:3:end);
x13=sqrt(sex1(100,1:3:end));
x14=c21{1,100}(2,1:3:end);
x15=(c21{1,100}(2,1:3:end)+c21{1,100}(1,1:3:end))/2;
plot1=plot(x11,x12,'r*');
plot2=plot(x11,x13,'gd');
plot3=plot(x11,x14,'md');
plot4=plot(x11,x15,'bp');
y11=[1:1:2];
y12=c21{1,100}(1,1:1:2);
y13=sqrt(sex1(100,1:1:2));
y14=c21{1,100}(2,1:1:2);
y15=(c21{1,100}(2,1:1:2)+c21{1,100}(1,1:1:2))/2;
plot5=plot(y11,y12,'r-*');
plot6=plot(y11,y13,'g-');
plot7=plot(y11,y14,'m-d');
plot8=plot(y11,y15,'b-p');
legend([plot5,plot7,plot8,plot6]);


//plot fuyang rain
plot(c41{1,100}(:,15),'b');
hold on;
plot(c31{1,100},'r');

for i=1:1:400
    if(c41{1,100}(i,15)<5)
       c41{1,100}(i,15)=c41{1,100}(i,15)*5;
    end
end

k=0;
for i=1:1:731
    if(c41{1,100}(i,15)>0||c31{1,100}(i,1)>0)
        k=k+1;
        rain1(1,k)=c41{1,100}(i,15);
        rain2(1,k)=c31{1,100}(i,1);
    end
end
plot(rain1,'b');
hold on;
plot(rain2,'r');

//plot p
k=0;
num=[];
length=[];
for i=31:1:122
    if(c51{1,i}==0)
        continue;
    end
    k=k+1;
    max=0;
    n=0;
    for j=1:1:60
        right=c21{1,i}(1,j)*2+c21{1,i}(2,j);
        if(max<right)
            max=right;
            n=j;
        end
    end
    num(1,k)=n;
    length(1,k)=sqrt(c11{1,i}(2,n));
end

[f1, x1] = ksdensity(length);
plot(x1, f1,'Linewidth',2.5);

//plot p1




//plot right
right=[];
for i=1:1:50
    right1=0;right2=0;k1=0;right3=0;
    for j=31:1:122
        if(c51{1,j}==0)
            continue;
        end
        k=1;
        k1=k1+1;
        for k=1:1:60
            if(sqrt(c11{1,j}(2,k))>i*0.1)
                break;
            end
        end
        if(k>1)
            k=k-1;
        end
        right1=right1+c21{1,j}(1,k);
        right2=right2+c21{1,j}(2,k);
        right3=right3+sqrt(sex1(j,k));
    end
    right(1,i)=right1/k1;
    right(2,i)=right2/k1;
    right(3,i)=right3/k1;
end

for i=1:1:50
    right(2,i)=right(2,i)+0.01;
end

plot(right(1,:));
hold on;
plot(right(2,:));
plot((right(1,:)*2+right(2,:))/3);
plot(right(3,:));

[AX,H1,H2] =plotyy([0.1:0.1:5],right(1,:),[0.1:0.1:5],right(3,:),@plot);% 获取坐标轴、图像句柄
set(get(AX(1),'ylabel'),'string', 'Accuracy rate','fontsize',16,'fontname','Times new Roman');
set(AX(1),'ycolor','k');
set(get(AX(2),'ylabel'),'string', 'RMSE/(mm)','fontsize',16,'fontname','Times new Roman');
set(AX(2),'ycolor','k');
set(AX(1),'YLim',[0 1]);
set(AX(1),'YTick',[0:0.2:1]);
set(AX(2),'YLim',[1.7 2.2]);
set(AX(2),'YTick',[1.7:0.1:2.2]);
set(AX(1),'fontsize',14,'fontname','Times new Roman');
set(AX(2),'fontsize',14,'fontname','Times new Roman');
xlabel('Number of surrounding sites','fontsize',16,'fontname','Times new Roman');
set(H1,'LineStyle','-');
set(H1,'Color','r');
set(H1,'LineWidth',1);
set(H2,'LineStyle','-');
set(H2,'Color','g');
set(H2,'LineWidth',1);
hold on;
plot([0.1:0.1:5],right(2,:),'m-','Linewidth',1);
plot([0.1:0.1:5],(right(1,:)*2+right(2,:))/3,'Linewidth',1);
x11=[0.1:0.3:5];
x12=right(1,1:3:end);
x13=right(3,1:3:end);
x14=right(2,1:3:end);
x15=(right(1,1:3:end)*2+right(2,1:3:end))/3;
plot1=plot(x11,x12,'r*');
plot2=plot(x11,x13,'gd');
plot3=plot(x11,x14,'md');
plot4=plot(x11,x15,'bp');
y11=[0.1:0.1:0.2];
y12=right(1,1:1:2);
y13=right(3,1:1:2);
y14=right(2,1:1:2);
y15=(right(1,1:1:2)*2+right(2,1:1:2))/3;
plot5=plot(y11,y12,'r-*');
plot6=plot(y11,y13,'g-');
plot7=plot(y11,y14,'m-d');
plot8=plot(y11,y15,'b-p');
legend([plot5,plot7,plot8,plot6]);

//plot lines
fnshp_L='E:\data\BaiduNetdiskDownload\world.shp';
readL=shaperead(fnshp_L);
fnshp_L1='E:\data\BaiduNetdiskDownload\中国边界矢量数据\CHN_adm0.shp';
readL1=shaperead(fnshp_L1);
fnshp_L2='E:\data\BaiduNetdiskDownload\中国边界矢量数据\CHN_adm1.shp';
readL2=shaperead(fnshp_L2);

for i=1:1:244
    plot(readL(i,1).X,readL(i,1).Y,'k');
    hold on;
end
set(gca,'XLim',[70 140]);
set(gca,'YLim',[15 55]);
plot(readL1.X,readL1.Y,'k');
for i=1:1:32
    plot(readL2(i,1).X,readL2(i,1).Y,'k:');
end
set(gca, 'XTick', [70 80 90 100 110 120 130 140]);
set(gca,'XTickLabel',{'70°00′E','80°00′E','90°00′E','100°00′E','110°00′E','120°00′E','130°00′E','140°00′E'}); 
set(gca, 'YTick', [15 20 25 30 35 40 45 50 55]);
set(gca,'YTickLabel',{'15°00′N','20°00′N','25°00′N','30°00′N','35°00′N','40°00′N','45°00′N','50°00′N','55°00′N'});

for i=1:1:56
    plot(a(i,2),a(i,3),'.','markersize',20);
end

[X,Y]=meshgrid(70:140,15:55);
Z = griddata(ms(1,:),ms(2,:),jp(5,:)-ms(5,:),X,Y);
v=[0.5,1.5,2.5];
[c,h]=contour(X,Y,Z,v,'linewidth',3);
clabel(c,h,'fontsize',16);

ms=zeros(5,122);
ec=zeros(5,122);
jp=zeros(5,122);
for i=1:1:122
    bj=0;
    for j=1:1:56
        if(correct(3,i)==a(j,1))
            bj=1;
            break;
        end
    end
    ms(1,i)=correct(4,i);
    ec(1,i)=correct(4,i);
    jp(1,i)=correct(4,i);
    ms(2,i)=correct(5,i);
    ec(2,i)=correct(5,i);
    jp(2,i)=correct(5,i);
    if(bj==1)
        ms(3,i)=a(j,4);
        ms(4,i)=a(j,5);
        ms(5,i)=a(j,6);
        ec(3,i)=a(j,7);
        ec(4,i)=a(j,8);
        ec(5,i)=a(j,9);
        jp(3,i)=a(j,10);
        jp(4,i)=a(j,11);
        jp(5,i)=a(j,12);
    else
        ms(3,i)=correct(6,i);
        ms(4,i)=correct(7,i);
        if(sex1(i,1)==-1)
            ms(5,i)=1;
        else
            ms(5,i)=sqrt(sex1(i,15));
        end
        if(correct(1,i)==-999||correct(2,i)==-999)
            ec(3,i)=0.75;
            ec(4,i)=0.75;
        else
            ec(3,i)=correct(1,i);
            ec(4,i)=correct(2,i);
        end
        if(sex(i,1)==-1)
            ec(5,i)=2; 
        else
            ec(5,i)=sqrt(sex(i,1));
        end
        jp(3,i)=0.73;
        jp(4,i)=0.69;
        jp(5,i)=3;
    end
end
    