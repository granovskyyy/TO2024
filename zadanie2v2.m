nval=[2,3,5,10,15,20,50];
xval=0:0.1:2;
wbdexp=exp(xval);

figure 
hold on
wzglarr=[];
for n=nval
    taylorswift=zeros(size(xval));
    for i=1:length(xval)
        x=xval(i);
        taysum=1;
        one=1;
        for k=1:n-1
            one=one*(x/k);
            taysum=taysum+one;
        end
        taylorswift(i)=taysum;
    end

    plot(xval,taylorswift, 'DisplayName',['N=' num2str(n)]);
    wzglbld=mean(wbdexp-taylorswift)./mean(wbdexp);
    wzglarr(n)=wzglbld;
end
plot(xval, wbdexp, '-go', 'DisplayName', 'exp(x)');
title('obliczanie e^x przy uzyciu szeregu Taylora');
xlabel('x');
ylabel('y=e^x');
legend show;
grid on;
hold off;

figure 

plot(nval,wzglarr(nval),'-bo')
title('wykres zaleznosci bledu od N')
xlabel('n')
ylabel('blad w %')
grid on 
hold off

