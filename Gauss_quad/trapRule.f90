program trapRule
implicit none
integer :: np
real*8 :: x,f,a,b,eps,geps,S,S1,S2,h,e1,e2,eI
integer::j

!exact solution:
eI = 2.45228

geps = 1.0d-3  !error criterion

a = -1.0d0 !lower bound
b =  1.0d0 !upper bound

open(13, file="points.plt")
write(13,*)'variables ="x","f","points"'

!Adaptive integration:
S = 0.0d0
x = a
eps= geps/(b-a)

!span along x direction
200 continue
h  = (b-x)

if (x.ge.b) goto 300

!trial solution
100 continue
S1 = 0.50d0*h*(f(x) + f(x+h))
S2 = 0.25d0*h*(f(x) + 2.0d0*f(x+0.5d0*h) + f(x+h))

e1 = 1.0d0/3.0d0*dabs(S2-S1)
e2 = h*eps

!error check
if (e1.le.e2) then !accept step
write(13,*)x+0.5d0*h, f(x+0.5d0*h), 0.0d0
S = S + (4.0d0*S2-S1)/3.0d0
x = x + h
goto 200
else !reduce step size and perform trial solution
h = 0.5d0*h
goto 100
end if
300 continue !done

write(*,19)"exact: ", eI, 100.0d0*dabs((eI-eI)/eI)
write(*,19)"numerical: ", S, 100.0d0*dabs((S-eI)/eI)

19 format(A20,2F20.10)


! Writing given function using np points
np = 200 !use 2000 points to plot curve
open(12, file="exact_curve.plt")
write(12,*)'variables ="x","f"'
do j=0,np
x = a + dfloat(j)*(b-a)/dfloat(np)
write(12,*) x,f(x)
end do
close(12)


end

!-----------------------------------------------------------------------------!
!Given function to integrate
!-----------------------------------------------------------------------------!
real*8 function f(x)
implicit none
real*8 :: x,pi
pi = 4.*atan(1.0)
f = exp(cos(pi*pi*x))
end function f
