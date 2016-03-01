!
! This program differentiates functions
! Using a standard second order finite difference stencil
! and a difference of maximal width computed by 
! Bengt Fornberg's weights subroutine.
! 

program differentiate
  implicit none
  real(kind = 8), parameter :: pi = acos(-1.d0)
  integer :: n,i,j
  real(kind = 8) :: h,diff_weights(1:3,1:3)
  real(kind = 8), dimension(:), allocatable :: x,f,df,df_exact
  ! Variables for weights
  integer :: nd,m
  real(kind = 8) :: z 
  real(kind = 8), dimension(:,:), allocatable :: c
  
  m = 1


  do n  = 4,100
     ! Allocate memory for the various arrays
     allocate(x(0:n),f(0:n),df(0:n),df_exact(0:n))
     allocate(c(0:n,0:m))
     ! Set up the grid.     
     h = 2.d0/dble(n)
     do i = 0,n
        x(i) = -1.d0+dble(i)*h
     end do
     ! The function and the exact derivative
     f = exp(cos(pi*x))
     df_exact = -pi*sin(pi*x)*exp(cos(pi*x))
     
     ! Set up weights for a finite difference stencil 
     ! using three gridpoints
     ! In the interior we use a centered stencil
     diff_weights(1:3,1) = (/-0.5d0,0.d0,0.5d0/) 
     ! To the left we use a biased stencil
     diff_weights(1:3,2) = (/-1.5d0,2.d0,-0.5d0/) 
     ! To the right we use a biased stencil too
     diff_weights(1:3,3) = (/1.5d0,-2.d0,0.5d0/) 
     ! scale by 1/h
     diff_weights = diff_weights/h
     
     ! Now differentiate
     ! To the left is a special case
     df(0) = 0.d0
     do j = 1,3
        df(0) = df(0) + diff_weights(j,2)*f(j-1)
     end do
     ! Now interior points
     do i = 1,n-1
        df(i) = sum(diff_weights(1:3,1)*f((i-1):(i+1)))
     end do
     ! Finally, special case to the right
     df(n) = 0.d0
     do j = 1,3
        df(n) = df(n) + diff_weights(j,3)*f(n-(j-1))
     end do
     write(*,'(I3,2(ES12.4))',advance='no') n,h,maxval(abs(df-df_exact))

     ! Now find the difference stencil that uses all the points 
     nd = n
     do i = 0,n
        df(i) = 0.d0
        z = x(i)
        call weights1(z,x,n,nd,m,c)
        do j = 0,nd
           df(i) = df(i) + c(j,1)*f(j)
        end do
     end do
     write(*,'(ES12.4)') maxval(abs(df-df_exact))
     
     ! Deallocate the arrays     
     deallocate(x,f,df,df_exact,c)
  end do
  
end program differentiate
