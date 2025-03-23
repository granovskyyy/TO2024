n = 10;
xval1 = -4:0.01:4;
xval2 = -2:0.01:2;
xval3 = -10:0.01:10;
xval4 = -1:0.01:1;
f = @(x) sin(x) + x;
cn=zeros(1,n); 
x0=cos(pi*((1:n)-0.5)/n); % probowałem policzyc to petla ale wylicza tylko jedna wartosc dlatego musialem za nasza zmienna podstawic rozne wartosci n (na wykladzie prezes korohoda tez tak robił)
x01=x0*4;
x02=x0*2;
x03=x0*10;
for i=1:n

    chebval1=czebyszewsigma(x01/4,i); %dzielimy x0 przez 4 ze wzgledu na wyrownanie przedziałow 
    cn1(i)=(2/n)*sum(f(x01).*chebval1); %wzor z wykładu (kropka ze wzgledu na fakt, ze przemnazamy wektory)
    chebval2=czebyszewsigma(x02/2,i); 
    cn2(i)=(2/n)*sum(f(x02).*chebval2);
    chebval3=czebyszewsigma(x03/10,i); 
    cn3(i)=(2/n)*sum(f(x03).*chebval3);
    chebval4=czebyszewsigma(x0,i); 
    cn4(i)=(2/n)*sum(f(x0).*chebval4);
end

czebaprox1=zeros(size(xval1));   %implementacja aproksymacji (na start jako zera potem zmienia sie w liczby jak konto studenta po stypednium rektora)
czebaprox2=zeros(size(xval2));
czebaprox3=zeros(size(xval3));
czebaprox4=zeros(size(xval4));
for i=1:n
    czebaprox1=czebaprox1+cn1(i).*czebyszewsigma(xval1/4,i);%wzor na sume z wykladu
    czebaprox2=czebaprox2+cn2(i).*czebyszewsigma(xval2/2,i);
    czebaprox3=czebaprox3+cn3(i).*czebyszewsigma(xval3/10,i);
    czebaprox4=czebaprox4+cn4(i).*czebyszewsigma(xval4,i);
end

figure 
hold on 
subplot (2,2,1)
plot(xval1,czebaprox1,'g')
xlabel('x')
ylabel('y')
title('aproksymacja czebyszewem dla przedziału [-4,4]')
subplot (2,2,2)
plot(xval2,czebaprox2,'g')
xlabel('x')
ylabel('y')
title('aproksymacja czebyszewem dla przedziału [-2,2]')
subplot (2,2,3)
plot(xval3,czebaprox3,'g')
xlabel('x')
ylabel('y')
title('aproksymacja czebyszewem dla przedziału [-10,10]')
subplot (2,2,4)
plot(xval4,czebaprox4,'g')
xlabel('x')
ylabel('y')
title('aproksymacja czebyszewem dla przedziału [-1,1]')