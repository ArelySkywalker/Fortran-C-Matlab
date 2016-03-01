clear
clc

N = 10;
a = -1;
b = 1;

[x,w,P] = lglnodes(N)


f1 = exp(cos(pi*pi.*x));
f2 = exp(cos(pi.*x));

for i=1 : N+1
integralVal1(i) = sum(f1.*w(i));
integralVal2(i) = sum(f2.*w(i));

f_x1 = @(x) exp(cos(pi*pi*x));
f_x2 = @(x) exp(cos(pi.*x));
exactIntegral1 = integral(f_x1,a,b)
exactIntegral2 = integral(f_x2,a,b)

Err1(i) = abs(exactIntegral1 - integralVal1(i))
Err2(i) = abs(exactIntegral2 - integralVal2(i))
end

subintervals = 1:1:N+1;
loglog(subintervals,Err1,'r*-','linewidth',2)
hold on
loglog(subintervals,Err2,'bo-','linewidth',2)
grid on
xlabel('n')
ylabel('Maximum Error')
legend('Error for: e^{cos{pi^2x}}','Error for: e^{cos{pix}}')
title('Guass Quadrature')

axis([0 10 0 10])


