load hospital.mat


X=hospital.Age; 
Y=hospital.Weight;

xm=mean(X); %sredni x 
ym=mean(Y); %sredni y

a=sum((X-xm).*(Y-ym))/(sum((X-xm).^2)); %wzur na a

N=length(X); 

b=(1/N)*(sum(Y)-a*sum(X)); %wzur na y (z wykladu no bo skond)



yval=a*X+b; %wtf
figure;
plot(X,yval,'-g');
hold on 
plot(X,Y,'.');
xlabel('wiek');
ylabel('waga');
title('REGLINP');