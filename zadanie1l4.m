%WSZELKIE KOMENTRZE SA MOJEGO AUTORSTWA
n=6; % najwyzszy stopien wielomianu 
xval = -1:0.01:1;   %przedział x   

figure
hold on 
for i=1:n
    yval = czebyszewsigma(xval,i); %przedział y (dla kazdego i rysuje wartosci wielomianow tego ruska)
    plot(xval,yval,'-') 
    xlabel('x')
    ylabel ('y')
    title('yalla matlab ') % a tytuł taki bo matlab sie dławi
    x0=cos(pi*(i-0.5)/n); % wyliczanie x0 ze wzorów czebyszewa z wykładu 
    y0=zeros(size(x0));     %wyliczanie y0
    plot(x0,y0,'-bo')

end


