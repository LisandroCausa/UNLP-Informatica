#!/bin/bash
if [ $# -lt 3 ]; then
  echo Faltan parametros
  exit 1
fi
if [ ! -d $1 ]; then
  echo El directorio $1 no existe
  exit 1
fi
for archivo in `ls $1`
do
  if [ $2 = -a ]; then
    nuevo_nombre=$archivo$3
  else
    if [ $2 = -b ]; then
      nuevo_nombre=$3$archivo
    else
      echo Flag $2 desconocido
      exit 1
    fi
  fi
  mv $1$archivo $1$nuevo_nombre
done