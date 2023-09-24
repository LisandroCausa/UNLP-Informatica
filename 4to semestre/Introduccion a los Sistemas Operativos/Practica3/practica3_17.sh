#!/bin/bash
archivos=`ls`
echo $archivos
for archivo in $archivos
do
  echo $archivo | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA'
done
exit 0