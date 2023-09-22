#!/bin/bash
i=1
while [ $i -lt 101 ]; do
  echo i: $i
  echo cuadrado: `expr $i \* $i`
  ((i += 1))
done
exit 0