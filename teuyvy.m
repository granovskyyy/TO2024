


n = 6; 
xval = -4:0.01:4; 
f = @(x) sin(x) + x;


cN = zeros(1, n+1);
nodes = cos((2*(1:n) - 1) * pi / (2 * n));
nodes = 4 * nodes; 

for i = 0:n
    
    T_i = czebyszewsigma(nodes / 4, i); 
    cN(i+1) = (2 / n) * sum(f(nodes) .* T_i); 
    if i == 0
        cN(i+1) = cN(i+1) / 2; 
    end
end

f_approx = zeros(size(xval));
for i = 0:n
    f_approx = f_approx + cN(i+1) * czebyszewsigma(xval / 4, i);
end
figure
subplot(1, 2, 1)
plot(xval, f(xval), 'b', 'DisplayName', 'f(x) = sin(x) + x') 
hold on
plot(xval, f_approx, 'g', 'DisplayName', 'Aproksymacja Czebyszewa') 
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
    plot(xval, cN(i+1) * czebyszewsigma(xval / 4, i), 'DisplayName', ['c_' num2str(i) '*T_' num2str(i) '(x)'])
end
xlabel('x')
ylabel('y')
title('Składowe wielomiany Czebyszewa')
legend
hold off