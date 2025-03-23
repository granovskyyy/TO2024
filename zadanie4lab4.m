f = @(x) x.^2 + 4*x - 3;
df= @(x) 2*x+4;
f2=@(x) x.^6-6*x.^3;
df2= @(x) 6*x.^5-18*x.^2;
a = -2; %początek przedziału
b = 2;  %koniec przedziału 
n = 100;  %iteracje potrzebne do wyliczenia x0 
x=a:0.01:b; %przedział x do wyrysowania wykresu
y=f(x); %wartosc funkcji w zaleznosci od x (wykres)
aprox = 1e-6;  %dokładnosc aproksymacji 

x0default=fzero(f,a);
disp(x0default)
x0s=siecznee(a,b,f,n,aprox);
x0n=niuuton(f,df,n,aprox);

x02default=fzero(f2,b);
disp(x02default)
x02s=siecznee(a,b,f2,n,aprox);  %nie dziala jak obierzemy sobie przedzial z elementem ktorego nie mamy w dziedzinie 
x02n=niuuton(f2,df2,n,aprox);