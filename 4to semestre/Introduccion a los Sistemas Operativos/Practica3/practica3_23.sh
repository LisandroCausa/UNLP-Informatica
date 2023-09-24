#!/bin/bash
num=(10 3 5 7 9 3 5 4)

cont=0
for i in ${num[@]}
do
  esImpar=`expr $i \% 2`
  if [ $esImpar = 0 ]; then
    echo $i
  else
    cont=`expr $cont + 1`
  fi
done
echo Impares=$cont