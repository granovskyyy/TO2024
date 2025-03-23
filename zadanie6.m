fcja1=@(x) exp(x) %eksponenta
fcja2 = @(x) x.^3 - 6*x.^2 + 4*x - 24; %wielomian 
fcja3= @(x) 4*sin(2*x) %trygonometryczna
fcja4=@(x) cos(100*x) %trgonometryczna 2
a = 0;
b = 0.5;
n = 10;

calka1 = trapez2(fcja1,a,b,n);
calka2 = trapez2(fcja2, a, b, n);
calka3 = trapez2(fcja3, a, b, n);
calka4 = trapez2(fcja4, a, b, n);

wbdcalka1=integral(fcja1,a,b)
wbdcalka2=integral(fcja2,a,b)
wbdcalka3=integral(fcja3,a,b)
wbdcalka4=integral(fcja4,a,b)


error1=abs(wbdcalka1-calka1)
error2=abs(wbdcalka2-calka2)
error3=abs(wbdcalka3-calka3)
error4=abs(wbdcalka4-calka4)


