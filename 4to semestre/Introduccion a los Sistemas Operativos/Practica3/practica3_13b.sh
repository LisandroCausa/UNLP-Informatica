select opcion in Listar DondeEstoy QuienEsta
do
  case $opcion in
    Listar)
      echo `ls`
    ;;
    DondeEstoy)
      echo `pwd`
    ;;
    QuienEsta)
      echo `who`
    ;;
    *)
      echo Opcion desconocida
  esac
  break
done