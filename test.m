
n = 6; 
xval = -4:0.01:4; 
f = @(x) sin(x) + x; 

% Wyliczenie współczynników cN
cN = zeros(1, n+1); % Współczynniki dla wielomianów do n-tego stopnia
nodes = cos((2*(1:n) - 1) * pi / (2 * n));
nodes = 4 * nodes;
for i = 1:n
    T_i = czebyszewsigma(nodes, i); 
    cN(i+1) = (2 / n) * sum(f(nodes) .* T_i);
end

% Aproksymacja funkcji f(x) za pomocą wielomianów Czebyszewa
f_approx = zeros(size(xval));
for i = 1:n
    f_approx = f_approx + cN(i+1) * czebyszewsigma(xval, i);
end

% Rysowanie funkcji oraz aproksymacji
figure
subplot(1, 2, 1)
plot(xval, f(xval), 'b', 'DisplayName', 'f(x) = sin(x) + x') % Wykres funkcji
hold on
plot(xval, f_approx, 'w', 'DisplayName', 'Aproksymacja Czebyszewa') % Wykres aproksymacji
xlabel('x')
ylabel('y')
title('Funkcja i aproksymacja Czebyszewa')
legend
hold off

% Rysowanie składowych wielomianów Czebyszewa
subplot(1, 2, 2)
hold on
for i = 0:n
    % Wykres składowej wielomianu Czebyszewa przemnożonego przez cN
    plot(xval, cN(i+1) * czebyszewsigma(xval, i), 'DisplayName', ['c_' num2str(i) '*T_' num2str(i) '(x)'])
end
xlabel('x')
ylabel('y')
title('Składowe wielomiany Czebyszewa')
legend
hold off