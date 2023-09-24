#!/bin/bash
if [ -z "$1" ]; then
  echo "El primer parametro no fue ingresado"
  exit 1
fi
if [ -z "$2" ]; then
  echo "El segundo parametro no fue ingresado"
  exit 1
fi
case "$3" in
  "+")
    echo "La suma es: `expr $1 + $2`"
  ;;
  "-")
    echo "La resta es: `expr $1 - $2`"
  ;;
  "\*")
    echo "La multiplicación es: `expr $1 \* $2`"
  ;;
  "%")
    echo "La division? es: `expr $1 / $2`"
  ;;
  *)
    echo Operación desconocida
    exit 1
  ;;
esac
exit 0