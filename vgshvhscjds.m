% Definiowanie parametrów
n = 6; % maksymalny stopień wielomianu Czebyszewa
xval = -4:0.01:4; % Zakres x
f = @(x) sin(x) + x; % Funkcja do aproksymacji

% Funkcja Czebyszewa
function T = czebyszewsigma(x, k)
    T = cos(k * acos(x));
end

% Obliczanie współczynników cn
cn = zeros(1, n);
for i = 0:n-1
    % Węzły Czebyszewa w przedziale [-1, 1] dla stopnia i
    x0 = cos(pi * (2*(0:n-1) - 1) / (2 * n));  % Zmodyfikowane obliczanie węzłów
    
    % Skalowanie węzłów do przedziału [-4, 4]
 
    
    % Obliczanie wartości T_i(x) dla węzłów
    T_i = czebyszewsigma(scaled_x0, i);  
    
    % Obliczanie współczynnika cn
    cn(i+1) = (2 / n) * sum(f(scaled_x0) .* T_i);  
    
    if i == 0
        cn(i+1) = cn(i+1) / 2;  % Korekta dla T_0
    end
end

% Aproksymacja funkcji f(x) za pomocą wielomianów Czebyszewa
czebaprox = zeros(size(xval));
for i = 0:n-1
    % Wykorzystanie skalowanych xval do aproksymacji
    czebaprox = czebaprox + cn(i+1) * czebyszewsigma(xval / 4, i);  % Przeskalowane xval
end

% Rysowanie funkcji i aproksymacji Czebyszewa
figure;
subplot(1, 2, 1);
plot(xval, f(xval), 'r', 'DisplayName', 'f(x) = sin(x) + x');
hold on;
plot(xval, czebaprox, 'g', 'DisplayName', 'Aproksymacja Czebyszewa');
xlabel('x');
ylabel('y');
title('Funkcja i Aproksymacja Czebyszewa');
legend;
hold off;

% Rysowanie składowych wielomianów Czebyszewa
subplot(1, 2, 2);
hold on;
for i = 0:n-1
    plot(xval, cn(i+1) * czebyszewsigma(xval / 4, i), '-', 'DisplayName', ['c_' num2str(i) '*T_' num2str(i) '(x)']);
end
xlabel('x');
ylabel('y');
title('Składowe wielomiany Czebyszewa');
legend;
hold off;