function s=siecznee(a,b,f,n,aprox)
%a poczatek przedzialu 
%b koniec przedzialu 
%f funkcja
%n liczba iteracji 
%aprox- aproksymacja
if f(a)*f(b)<0        %główny warun (nie nie jest to warunek z aue)
    for i=1:n
        x0=a-(f(a)*(b-a))/(f(b)-f(a)); %regula de falsi (o dziwo działa xd)
        if abs(f(x0))<aprox %jak nasze miejsce zerowe jest wystarczajaco małe to funkcja przestaje prace 
            break;
        end
        if f(a)*f(x0)<0 %zamiana przedziałow 
            b=x0;
        elseif(b)*f(x0)<0
            a=x0;
        end   
    
    end
    s=x0;
    disp('miejsce zerowe znalezione metoda siecznych')
    disp(s)  %wyswietlanie x0
    disp('iteracja w ktorej znalezlismy')
    disp(i)     %wystwietlanie iteracji w ktorej znalezlismy 
else 
    disp('nie dziala')  %to gdy nasza funkcja nie spełnia głównego warunku 
end
end