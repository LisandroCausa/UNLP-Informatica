#!/bin/bash
if [ $# -lt 1 ]; then
  echo Se necesita al menos un parametro
  exit 1
fi
i=0
cant_no_existentes=0
cd
for ruta in $@
do
  ((i+=1))
  esImpar=`expr $i \% 2`
  if [ $esImpar = 1 ]; then
    if [ -e $ruta ]; then
      if [ -f $ruta ]; then
        echo $ruta es ARCHIVO
      else
        echo $ruta es DIRECTORIO
      fi
    else
      ((cant_no_existentes+=1))
    fi
  fi
done
echo Cantidad de rutas no existentes = $cant_no_existentes