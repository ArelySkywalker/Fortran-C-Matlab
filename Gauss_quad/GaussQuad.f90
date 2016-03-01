program GaussQuad
implicit none

real*8 :: x,w,n,f,eI,Integral_value,pi,i

call lglnodes(x,w,n)

open(13, file="pointsGauss.plt")
write(13,*)'variables="x","w","points"'

eI = 2.53213
pi = 4.*atan(1.0)

f = exp(cos(pi*pi*x))

Integral_value = f*w


write(*,19)"numericalGauss: ", Integral_value,100.0d0*dabs((Integral_value-eI)/eI )

19 format(A20,2F20.10)

end

