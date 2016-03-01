clear
clc
close all

n = 10;
a = -1;
b = 1;

f = @(x) exp(cos(pi*x));
c = integral(f,a,b)

f2 = @(x) exp(cos(pi*pi*x));
c2 = integral(f2,a,b)

[s,valuesofErr] = trapRule(f,a,b,n,c);
[s2, valuesofErr2] = trapRule(f2,a,b,n,c2);

x = 1:1:n+1;


loglog(x,valuesofErr,'ro-','linewidth',3)
hold on
loglog(x,valuesofErr2,'b*-','linewidth',3)
axis([0 n+1 0 1000])
xlabel('n')
ylabel('Maximum Error')
legend('Error for: e^{cos{pix}}','Error for: e^{cos{pi^2x}}')
title('Trapezoidal Rule')
grid on





