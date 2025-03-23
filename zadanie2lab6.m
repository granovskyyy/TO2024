f = @(x) x.^2 + 4*x - 3;
df= @(x) 2*x+4;
a = -2; %początek przedziału
b = 3;  %koniec przedziału 
n = 100;  %iteracje potrzebne do wyliczenia x0 
x=a:0.01:b; %przedział x do wyrysowania wykresu
y=f(x); %wartosc funkcji w zaleznosci od x (wykres)
aprox = [1e-2,1e-4,1e-6,1e-8,1e-10];  %dokładnosc aproksymacji 
x0s=zeros(size(aprox)); %inicjacja tablicy miejsc zerowych wyznaczonych metoda siecznych 
x0n=zeros(size(aprox)); %inicjacja tablicy miejsc zerowych wyznaczonych metoda stycznych (niuton)
x0default=fzero(f,a);
disp(x0default)
for i=1:length(aprox)
    x0s(i)=siecznee(a,b,f,n,aprox(i));
end

for i=1:length(aprox)
    x0n(i)=niuuton(f,df,n,aprox(i));
end

