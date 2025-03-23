xval=0:0.1:2;
yval=0:0.1:2;
[X,Y]=meshgrid(xval,yval);

n=20;

Ztest=exp(X+Y);
Ztaylor=zeros(size(Ztest));
for i=1:length(xval)
    for j=1:length(yval)
        x=xval(i);
        y=yval(j);
        taysum=1;
        one=1;
        for k=1:n-1
            one=one*((x+y)/k);
            taysum=taysum+one;
        end
        Ztaylor(i,j)=taysum;
    end
end

figure
subplot(1,2,1)
mesh(X,Y,Ztaylor)
title('przyblizenie taylora dla N=20');
xlabel('x');
ylabel('y');
zlabel('e^{x+y}');

subplot(1,2,2)
mesh(X,Y,Ztest)
title('Z=e^(x+y)');
xlabel('x');
ylabel('y');
zlabel('e^{x+y}');
wzglarr3d=[];
wzglbld3d=mean(Ztest-Ztaylor)/mean(Ztest);
for k=1:n
for i=1:length(xval)
    for j=1:length(yval)
        x=xval(i);
        y=yval(j);
        taysum=1;
        one=1;
        for k=1:n-1
            one=one*((x+y)/k);
            taysum=taysum+one;
        end
        Ztaylor(i,j)=taysum;
    end
end
wzglbld3d=mean(Ztest-Ztaylor)/mean(Ztest);
wzglarr3d(end+1)=wzglbld3d;


end

figure;
contourf(X, Y, wzglarr3d(n));
colorbar;
title('blad wzgledny w przyblizeniu taylora dla N=20');
xlabel('x');
ylabel('y');
