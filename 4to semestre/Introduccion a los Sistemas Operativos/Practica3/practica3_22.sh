#!/bin/bash
productoria() {
  local mi_arreglo=("$@")
  total=1
  for i in ${mi_arreglo[@]}
  do
    total=`expr $total \* $i`
  done
  echo total=$total
}

num=(10 3 5 7 9 3 5 4)

productoria ${num[@]}