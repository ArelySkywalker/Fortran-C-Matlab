clear
clc
close all

n = 10;
a = 2;
b = 6;

f = @(x) sqrt(16-x.^2);

c = integral(f,a,b)

[s,valuesofErr] = trapRule(f,a,b,n,c);

x = 1:1:n+1;


loglog(x,valuesofErr,'ro-','linewidth',3)
hold on

axis([0 n+1 0 1000])
xlabel('n')
ylabel('Maximum Error')
legend('Error for: {sqrt({16-x^2}})')
title('Trapezoidal Rule')
grid on