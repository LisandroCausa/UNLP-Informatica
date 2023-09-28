#!/bin/bash
if [ -z $1 ]; then
  echo Primer parametro es vacio
  exit 1
fi

if [ ! -d $1 ]; then
  echo El directorio no existe
  exit 4
fi
con_permisos=0
cd $1
archivos=`ls`
for archivo in $archivos
do
  if [ -r $archivo ] & [ -w $archivo ]; then
    ((con_permisos++))
  fi
done
echo Archivos con permisos R y W = $con_permisos