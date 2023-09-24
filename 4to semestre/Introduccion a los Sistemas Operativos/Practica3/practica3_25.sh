#!/bin/bash
usuarios=(`who | cut -d ' ' -f1`)
case $1 in
  "-b")
    if [ -z $2 ]; then
      echo Falta 2do parametro
      exit 1
    fi
    elemento=${usuarios[$2]}
    if [ ! -z $elemento ]; then
      echo Elemento=$elemento
    else
      echo Error: elemento en indice $2 no existente
      exit 1
    fi
  ;;
  "-l")
    echo ${#usuarios[@]}
  ;;
  "-i")
    for usuario in ${usuarios[@]}
    do
      echo $usuario
    done
  ;;
  *)
    echo Parametro $1 desconocido
    exit 1
  ;;
esac
exit 0