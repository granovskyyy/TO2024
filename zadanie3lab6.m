f = @(x) x.^2 + 4*x - 3;
df= @(x) 2*x+4;
a = -2; %początek przedziału
b = 3;  %koniec przedziału 
n = 100;  %iteracje potrzebne do wyliczenia x0 
p=1000; %liczba powtorzen do wyliczania czasow
x=a:0.01:b; %przedział x do wyrysowania wykresu
y=f(x); %wartosc funkcji w zaleznosci od x (wykres)
aprox = [1e-2,1e-4,1e-6,1e-8,1e-10];  %dokładnosc aproksymacji 


tic
for i=1:p
    sieczneg(a,b,n,f,aprox)
end
tsieczne=toc;
disp('czas wyliczony metoda siecznych')
disp(tsieczne)

tic
for i=1:p
    niuton(f,df,n,aprox)
end
tniuton=toc;
disp('czas wyliczony metoda niutona')
disp(tniuton)

tic
for i=1:p
    fzero(f,a)
end
tdefault=toc;
disp('czas wyliczony funkcja wbudowana(zabroniona)')
disp(tdefault)
