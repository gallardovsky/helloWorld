program helloWorldMPI
  use mpi
  implicit none
    integer rank, noProcs, ierr
    real*16 wTime

! Inicializa MPI
  call MPI_Init(ierr)

! Consigue el numero de procesadores y el rank
  call MPI_Comm_size(MPI_COMM_WORLD, noProcs, ierr)
  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_BARRIER(MPI_COMM_WORLD, ierr)

if (rank == 0) then
  wTime = MPI_Wtime()

  print *, ''
  write (*, '(a)') ' Hola_Mundo - Proceso Maestro '
  write (*, '(a)') '  Fortran 90 - Version MPI  '
  print *, ''
  write (*, '(a)') '   Programa prueba de MPI   '
  print *, ''
  write (*,'(a, i2)') '   No. procs: ', noProcs
  print *, ''
end if

  write (*, '(a, i2, a)') 'Proceso ', rank, ' dice "Hola PUTA!"'


  call MPI_BARRIER(MPI_COMM_WORLD, ierr)
if (rank == 0) then

  print *, ''
  write (*, '(a)') ' Hola Mundo - Proceso Maestro '
  write (*, '(a)') '  " Adios PUTA !"  '
  print *, ''

  wTime = MPI_Wtime() - wTime
  print *, ''
  write ( *, '(a, g14.6, a)' ) &
  'Tiempo de ejecución: ', wtime, ' seconds.'
end if

! Apagar el MPI
  call MPI_Finalize(ierr)
  stop
end program helloWorldMPI
