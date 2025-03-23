f = @(x) x.^2 + 4*x - 3;
df= @(x) 2*x+4;
a = -2; %początek przedziału
b = 3;  %koniec przedziału 
n = 100;  %iteracje potrzebne do wyliczenia x0 
x=a:0.01:b; %przedział x do wyrysowania wykresu
y=f(x); %wartosc funkcji w zaleznosci od x (wykres)
aprox = 1e-6;  %dokładnosc aproksymacji 

x0default=fzero(f,a);
disp(x0default)
x0s=siecznee(a,b,f,n,aprox);
x0n=niuuton(f,df,n,aprox);

figure 
plot(x,y,'r')
hold on 
plot(x0default,f(x0default),'-go')
hold on 
plot(x0s,f(x0s),'-bo')
hold on 
plot(x0n,f(x0n),'-wo')
xlabel('x')
ylabel('y')
title('obliczanie miejsc zerowych roznymi metodami')
