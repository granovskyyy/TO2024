%to nie działa bo wykres błędu nie pokazuje(licze ze pan pokaze jak blad ma
%wygladac oraz ze alek mi pomoze) 
%nmax - maksymalny n dla ktorego chcemy policzyc błędy 
%czebblad- błąd między wartoscia funckji a jej aproksymacją czebyszewem
xval = -1:0.01:1;
f = @(x) sin(x) + x;
nmax=10;
czebblad=zeros(1,nmax);
for n=1:nmax
    x0=cos(pi*((1:n)-0.5)/n);
    cn=zeros(1,n); %wyliczanie wspolczynnikow czebyszewa
    for i=1:n
    chebval=czebyszewsigma(x0,i);
    cn(i)=(2/n)*sum(f(x0).*chebval);
    end

    czebaprox=zeros(size(xval));  
    for i=1:n
        czebaprox=czebaprox+cn(i).*czebyszewsigma(xval,i);
    end
    czebblad=mean((f(xval)-czebaprox));
end
figure;
hold on 
for n=1:nmax
plot(n,czebblad,'-go')
end
xlabel('rzad wielomianu')
ylabel('err')
title('zaleznosc bledu aproksymacji od rzedu wielomianu')

