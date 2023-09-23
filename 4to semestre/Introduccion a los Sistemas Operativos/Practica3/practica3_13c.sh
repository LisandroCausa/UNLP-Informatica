if [ $# -lt 1 ]; then
  echo No se suministró parametro
  exit 1
fi

if [ -e $1 ]; then
  echo El archivo $1 existe
  if [ -d $1 ]; then
    echo $1 es un directorio
  else
    echo $1 es un archivo
  fi
else
  echo El archivo $1 NO existe
fi
exit 0