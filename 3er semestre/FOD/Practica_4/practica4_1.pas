program practica4_1;
const
	M = 4;
type
	t_alumno = record
		nombre : string;
		apellido : string;
		DNI : string;
		legajo : integer;
		anioIngreso : integer;
	end;

	t_nodo = record
		cantNodos : integer;
		claves : array[1..(M-1)] of integer; // Legajo
		// faltan punteros de las claves
		hijos : array[1..M] of integer; // indices en los que se ubican los hijos
		//siguiente : integer; // (ArbolB+) indice al siguiente secuencial
	end;

	t_arbolB = record
		raiz : integer; // puntero
		nodos : array[1..1000] of t_nodo;
	end;

begin
end.