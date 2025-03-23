function calka=trapez2(fcja,a,b,n)
        h=(b-a)/n;
        suma=0;
      for i=1:n-1
          suma=suma+(fcja(a+(i-1)*h)+fcja(a+i*h))*h/2;
      end
calka=suma;
end