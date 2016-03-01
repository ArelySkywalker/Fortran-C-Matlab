!
! A super-basic example of solving an equation
! using Newton's method
!
! Compile with $ gfortran -o newton.x newton.f90
!
program newton

  implicit none
  double precision :: f,fp,x,dx
  integer :: iter

  ! Here we try to find the solution to the
  ! equation f(x) = x + exp(x) = 0

  ! Start guess: expand exp(x) ~ 1+x
  ! this gives 1 + 2*x = 0 -> x ~ -1/2

  x = -0.5d0
  do iter = 1,10
     f = ffun(x)
     fp = fpfun(x)
     dx = -f/fp
     x = x + dx
     write(*,'(I2.2,2(E24.16))') iter,x,dx
  end do

contains

  double precision function ffun(x)
    implicit none
    double precision :: x

    ffun = x + exp(x)

  end function ffun

  double precision function fpfun(x)
    implicit none
    double precision :: x

    fpfun = 1.d0 + exp(x)

  end function fpfun

end program newton
