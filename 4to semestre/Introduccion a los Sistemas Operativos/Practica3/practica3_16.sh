#!/bin/bash
if [ $# -ne 1 ]; then
  echo Se esperaba un único parametro
  exit 1
fi
user=`whoami`
dir=/home/$user
cantidad=`ls $dir | grep "$1$" | wc -l`
echo user=$user \| cant=$cantidad > reporte.txt