
N = 10; 
N_ref = 100; 
x_values = -pi:0.1:pi; 

sin_taylor = zeros(size(x_values)); 
cos_taylor = zeros(size(x_values)); 
sin_reference = zeros(size(x_values)); 
cos_reference = zeros(size(x_values)); 

for i = 1:length(x_values)
    x = x_values(i);
    sin_sum = 0; 
    term = x; 
    for n = 0:N-1
        sin_sum = sin_sum + ((-1)^n * (x^(2*n+1)) / factorial(2*n+1));
    end
    sin_taylor(i) = sin_sum;
      
    cos_sum = 1; 
    term = 1;
    for n = 1:N-1
        cos_sum = cos_sum + ((-1)^n * (x^(2*n)) / factorial(2*n));
    end
    cos_taylor(i) = cos_sum;
        
    sin_ref_sum = 0;
    cos_ref_sum = 1;
      
    for n = 0:N_ref-1
        sin_ref_sum = sin_ref_sum + ((-1)^n * (x^(2*n+1)) / factorial(2*n+1));
    end
    sin_reference(i) = sin_ref_sum;
    
    for n = 0:N_ref-1
        cos_ref_sum = cos_ref_sum + ((-1)^n * (x^(2*n)) / factorial(2*n));
    end
    cos_reference(i) = cos_ref_sum;
end


sin_error = abs((sin_taylor - sin_reference) ./ sin_reference);
cos_error = abs((cos_taylor - cos_reference) ./ cos_reference);

figure;
subplot(2,1,1);
plot(x_values, sin_taylor, 'b', 'DisplayName', 'Taylor Approximation');
hold on;
plot(x_values, sin_reference, '--r', 'DisplayName', 'Reference');
xlabel('x');
ylabel('sin(x)');
title('Sin(x) Approximation using Taylor Series');
legend;
grid on;

subplot(2,1,2);
plot(x_values, sin_error, 'k', 'DisplayName', 'Relative Error');
xlabel('x');
ylabel('Relative Error');
title('Relative Error for Sin(x) Approximation');
legend;
grid on;

figure;
subplot(2,1,1);
plot(x_values, cos_taylor, 'b', 'DisplayName', 'Taylor Approximation');
hold on;
plot(x_values, cos_reference, '--r', 'DisplayName', 'Reference');
xlabel('x');
ylabel('cos(x)');
title('Cos(x) Approximation using Taylor Series');
legend;
grid on;


subplot(2,1,2);
plot(x_values, cos_error, 'k', 'DisplayName', 'Relative Error');
xlabel('x');
ylabel('Relative Error');
title('Relative Error for Cos(x) Approximation');
legend;
grid on;