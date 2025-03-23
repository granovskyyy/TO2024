%legenda tego kodu MOJEGO AUTORSTWA
%n stopien wielomianu 
%xval przedział x
%f funkcja z polecenia 
%cn - wspolczynnik aproksymacji czebyszewa (zwał jak zwał ale kazdy wie o co biega) 
%x0 miejsca zerowe( u nas jako wektor o n elementach) (docelowo nalezy od
%-1 do 1 dlatego przemnazamy 4 razy ) 
%chebval - wartosc wielomianu czebyszewa 
%czebaprox- wartosc aproksymacji czebyszewa wyliczana ze wzoru z wykładu 
%czebyszewsigma - funkcja rekurencyjna do wyliczania wielomianow czebyszewa
n = 6;
xval = -4:0.01:4;
f = @(x) sin(x) + x;
cn=zeros(1,n); 
x0=cos(pi*((1:n)-0.5)/n);% probowałem policzyc to petla ale wylicza tylko jedna wartosc dlatego musialem za nasza zmienna podstawic rozne wartosci n (na wykladzie prezes korohoda tez tak robił)
x0=4*x0;
for i=1:n

    chebval=czebyszewsigma(x0/4,i); %dzielimy x0 przez 4 ze wzgledu na wyrownanie przedziałow 
    cn(i)=(2/n)*sum(f(x0).*chebval); %wzor z wykładu (kropka ze wzgledu na fakt, ze przemnazamy wektory)
end

czebaprox=zeros(size(xval)); %implementacja wartosci aproksymujacej( moze i policzy jak bedzie w petli ale nie bedziemy mogli tego uzyc) 
for i=1:n
    czebaprox=czebaprox+cn(i).*czebyszewsigma(xval/4,i); %wzor na sume z wykladu 
end

figure;
subplot(1, 2, 1);
plot(xval, f(xval), 'r')
hold on
plot(xval,czebaprox,'g')
xlabel('x')
ylabel('y')
title('aproksymacja czebyszewem')
subplot(1,2,2)
hold on
for i=1:n
    plot(xval,cn(i).*czebyszewsigma(xval/4,i),'-') %wykres zawierajacy wielomiany czebyszewa bedace częścią sumy aproksymującej (iloczyn wspolczynnikow i wartosci wielomianow dla poszczególnych stopni (u nas to wartości i )
end
xlabel('x')
ylabel('y')
title('wspolczynniki cn')
hold off


