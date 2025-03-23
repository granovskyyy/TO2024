function c2 = czebyszewskibidi(c, d)
    i = 1:d+1;
    x0 = cos(pi * (i - 0.5) / i);  
    y = c(x0);
    a = zeros(1, d+1);
    
    for k = 0:d
        for l = 1:d+1
            temp(l) = y(l)*czebyszewsigma(k, x0(l));  
        end
        a(k+1)=2/(d+1)*sum(temp);  
    end
    c2 =a;
end
