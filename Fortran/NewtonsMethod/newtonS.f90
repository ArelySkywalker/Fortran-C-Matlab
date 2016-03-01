!
! A super-basic example of solving an equation
! using Newton's method
!
! This is the template file used for the scripted version  
!
program newton
  
  implicit none
  double precision :: f,fp,x,dx,tol,r1,r2
  integer :: iter
  
  ! Here we try to find the solution to the
  ! f(x) = 0
  
  tol = 0
  x = 10e-15

  do while (tol	< x)
     f = ffun(x)
     fp = fpfun(x)
     dx = -f/fp
     x = x + dx
     tol = tol + abs(dx	- x)
     r1 = abs(dx)/abs(x)
     r2 = abs(dx)/abs(x)**2
     write(*,'(A18,I2.2,2(E24.16))') ' sin(x)+cos(x*x) ', iter, x, dx, tol, r1, r2
  end do

contains

  double precision function ffun(x)
    implicit none
    double precision :: x

    ffun = sin(x)+cos(x*x)

  end function ffun

  double precision function fpfun(x)
    implicit none
    double precision :: x

    fpfun = cos(x)-2.d0*x*sin(x*x)

  end function fpfun

end program newton