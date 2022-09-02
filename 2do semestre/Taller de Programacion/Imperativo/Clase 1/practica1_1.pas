program uno;
const
	N_MAX = 20;
type
	t_id = 1..15;
	t_cant = 1..99;
	t_venta = record
		id : t_id;
		cant : t_cant;
	end;
	vector = array[1..N_MAX] of t_venta;
	
	lista = ^nodo;
	nodo = record
		datos : t_venta;
		sig : lista;
	end;

// a)
procedure cargarVector(var v : vector; var dimL : integer);
var
	entrada : t_venta;
	nuevoID : integer;
begin
	dimL := 0;
	randomize;
	nuevoID := random(16);
	write('Cantidad: ');
	readln(entrada.cant);
	while((dimL < N_MAX) and (nuevoID <> 0)) do
	begin
		dimL := dimL + 1;
		entrada.id := nuevoID;
		v[dimL] := entrada;
		nuevoID := random(16);
		write('Cantidad: ');
		readln(entrada.cant);
	end;
end;

procedure imprimirVenta(venta : t_venta);
begin
	write(venta.id, '.', venta.cant, ' ');
end;

// b)
procedure imprimirVector(v : vector; dimL : integer);
var
	i : integer;
begin
	for i:=1 to dimL do
		imprimirVenta(v[i]);
	writeln;
end;

// c)
procedure ordenarVector(var v : vector; dimL : integer);
var
	i, j : integer;
	min_i : integer;
	tmp : t_venta;
begin
	for i:=1 to (dimL-1) do
	begin
		min_i := i;
		for j:=(i+1) to dimL do
			if(v[j].id <= v[min_i].id) then
				min_i := j;
		tmp := v[min_i];
		v[min_i] := v[i];
		v[i] := tmp;
	end;
end;

// e)
procedure eliminarRango(min, max : t_id; var v : vector; var dimL : integer);
var
	inicio_i : integer;
	desplazamiento : integer;
	i : integer;
begin
	if(min <= max) then
	begin
		inicio_i := 1;
		while((inicio_i <= dimL) and (v[inicio_i].id < min)) do
			inicio_i := inicio_i + 1;
		desplazamiento := 0;
		while((inicio_i+desplazamiento <= dimL) and (v[inicio_i+desplazamiento].id <= max)) do
			desplazamiento := desplazamiento + 1;

		dimL := dimL - desplazamiento;
		for i:=inicio_i to dimL do
			v[i] := v[i+desplazamiento];
	end;
end;

function esPar(num : integer) : boolean;
begin
	esPar := ((num MOD 2) = 0);
end;

procedure agregarAtras(dato : t_venta; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.datos := dato;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

// g)
function listaIDsPares(v : vector; dimL : integer) : lista;
var
	L : lista;
	ult : lista;
	i : integer;
begin
	L := nil;
	for i:=1 to dimL do
	begin
		if(esPar(v[i].id)) then
			agregarAtras(v[i], L, ult);
	end;
	listaIDsPares := L;
end;

// h)
procedure imprimirLista(L : lista);
begin
	while(L <> nil) do
	begin
		imprimirVenta(L^.datos);
		L := L^.sig;
	end;
	writeln;
end;

var
	v : vector;
	dimL : integer;
	parametro1 : t_id;
	parametro2 : t_id;
	listaOrdenada : lista; // g)
begin
	cargarVector(v, dimL);
	imprimirVector(v, dimL);
	ordenarVector(v, dimL);
	imprimirVector(v, dimL); // d)
	writeln('Eliminar del vector por rango de IDs');
	write('Inicio de rango: ');
	readln(parametro1);
	write('Final de rango: ');
	readln(parametro2);
	eliminarRango(parametro1, parametro2, v, dimL);
	imprimirVector(v, dimL);
	listaOrdenada := listaIDsPares(v, dimL);
	write('Lista par: ');
	imprimirLista(listaOrdenada); // h)
end.