% Simple program for generating a plot

x = load('out.txt');

set(gca,'fontsize',18)
loglog(x(:,1),x(:,3:5),'o-',x(:,1),x(:,1).^(-2),'k--','linewidth',2)
xlabel('number of gridpoints')
ylabel('Maximum error')
legend('Computed error FD','Fornberg equi.','Fornberg LGL','n^{-2}')

print -depsc2 error_v3
print -dpng error_v3