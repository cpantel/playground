integer a
dimension a(1000,1000)
do i=1,1000
  do j=1,1000
    a(j,i)=0 
  enddo
enddo


do i=1,1000
  do j=1,1000
    a(j,i)=a(j,i)+1
  enddo
enddo

end
