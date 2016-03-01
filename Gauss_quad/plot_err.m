% Simple program for generating a plot
clear
clc

A = importdata('exact_curve.plt')
AMatrix = A.data
n1 = 1:1:size(AMatrix(:,1));


B = importdata('points.plt')
BMatrix = B.data
n2 = 1:1:size(BMatrix(:,1))

hold all
set(gca,'fontsize',18)
%loglog(n1,AMatrix(:,1),'o-',n2,BMatrix(:,1),'rx--','linewidth',2)
loglog(n1,AMatrix(:,2),'o-',n2,BMatrix(:,2),'rx--','linewidth',2)
axis([0 60 0 3])
xlabel('number of gridpoints')
ylabel('Maximum error')
legend('n^{2}','computed error')

print -depsc2 error_v1
print -dpng error_v1
