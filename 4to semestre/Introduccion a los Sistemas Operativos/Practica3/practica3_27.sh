#!/bin/bash

inicializar() {
  array=()
}

agregar_elem() {
  if [ ! $# -eq 1 ]; then
    echo Se esperaba 1 parametro
    exit 1
  fi
  array+=($1)
}

eliminar_elem() {
  if [ ! $# -eq 1 ]; then
    echo Se esperaba 1 parametro
    exit 1
  fi
  existe=`expr $1 \< "${#array[@]}"`
  if [ $existe -eq "1" ]; then
    unset array[$1]
  fi
}

longitud() {
  echo longitud="${#array[@]}"
}

imprimir() {
  for i in ${array[@]}
  do
    echo $i
  done
}

inicializar_Con_Valores() {
  if [ ! $# -eq 2 ]; then
    echo Cantidad de parametros incompatible
    exit 1
  fi
  array=()
  for ((i=0; i<$1;i++))
  do
    array+=($2)
  done
}

inicializar_Con_Valores 3 7
imprimir
longitud
agregar_elem 32
imprimir
longitud
eliminar_elem 3
imprimir
longitud
inicializar
longitud