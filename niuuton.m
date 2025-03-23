function k=niuuton(f,df,n,aprox)
%f-funkcja
%df-pochodna
%n-liczba iteracji 
%aprox- aproksymacja
k=0;
if df(k)~=0
    for i=1:n
        x1=k-f(k)/df(k);
        if abs(f(x1))<aprox
            break;
        end
        k=x1;
    end
    disp('miejsce zerowe znalezione metoda Newtona')
    disp(k)
    disp('iteracja w ktorej znalezlismy')
    disp(i)
else 
    disp('nie dziala') %to w przypadku błędów
end

