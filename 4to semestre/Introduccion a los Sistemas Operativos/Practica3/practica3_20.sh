#!/bin/bash
array=()
select opcion in push pop length print salir
do
  case $opcion in
    push)
      read elemento
      array=($elemento "${array[@]}")
    ;;
    pop)
      array=("${array[@]:1}")
    ;;
    length)
      longitud=${#array[@]}
      echo length = $longitud
    ;;
    print)
      for elem in "${array[@]}"
      do
        echo $elem
      done
    ;;
    salir)
      break
    ;;
    *)
      echo Opcion elegida desconocida
    ;;
  esac
done
exit 0