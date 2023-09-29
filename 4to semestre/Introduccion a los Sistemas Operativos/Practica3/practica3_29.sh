#!/bin/bash
arreglo=(`find $HOME -name "*.doc"`)

cantidadArchivos() {
  echo "${#arreglo[@]}"
}

verArchivo() {
  for i in ${arreglo[@]}
  do
    if [ $i = $1 ]; then
      eche hehe
      cat $i | head
      return 0
    fi
  done
  echo "Archivo no encontrado"
  return 5
}

borrarArchivo() {
  existe=0
  pos=-1
  for i in ${arreglo[@]}
  do
    ((pos++))
    if [ $i = $1 ]; then
      existe=1
      break
    fi
  done
  if [ ! $existe = 1 ]; then
    echo "Archivo no encontrado"
    return 10
  fi
  echo Borrar logicamente?
  select opcion in Si No
  do
    case $opcion in
      "Si")
        unset arreglo[$pos]
        break
      ;;
      "No")
        archivo=${arreglo[$pos]}
        rm $archivo
        unset arreglo[$pos]
        break
      ;;
      *)
        echo Opcion desconocida
    esac
  done
}

verArchivo /Users/lisandro/Desktop/repos/UNLP-Informatica/Ingreso/COC/Entrega3/consigna.doc
cantidadArchivos
borrarArchivo /Users/lisandro/Desktop/loli.doc