% Simple program for generating a plot

x = load('out.txt');

set(gca,'fontsize',18)
loglog(x(:,1),x(:,3:4),'o-',x(:,1),x(:,1).^(-2),'k--','linewidth',2)
xlabel('number of gridpoints')
ylabel('Maximum error')
legend('Computed error FD','Fornberg stylee','n^{-2}')

print -depsc2 error_v2
print -dpng error_v2
 