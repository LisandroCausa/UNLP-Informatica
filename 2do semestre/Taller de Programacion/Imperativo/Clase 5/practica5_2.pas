program dos;
type
	t_anio = 2010..2018;
	str32 = string[31];

	arbol = ^nodo;
	nodo = record
		patente : str32;
		fabricacion : t_anio;
		marca : str32;
		modelo : str32;
		izq : arbol;
		der : arbol;
	end;

	t_auto = record
		patente : str32;
		marca : str32;
		modelo : str32;
	end;

	lista = ^nodo_l;
	nodo_l = record
		dato : t_auto;
		sig : lista;
	end;

	vector = array[t_anio] of lista;

procedure leerNodo(var n : nodo);
begin
	write('Patente: ');
	readln(n.patente);
	if(n.patente <> 'ZZZ') then
	begin
		write('Año de fabricacion: ');
		readln(n.fabricacion);

		write('Marca: ');
		readln(n.marca);

		write('Modelo: ');
		readln(n.modelo);
	end;
	writeln;
	n.izq := nil;
	n.der := nil;
end;

procedure insertarNodo(n : nodo; var a : arbol);
begin
	if(a = nil) then
	begin
		new(a);
		a^ := n;
	end
	else if(n.patente < a^.patente) then
	begin
		insertarNodo(n, a^.izq);
	end
	else
	begin
		insertarNodo(n, a^.der);
	end;
end;

// a)
function generarArbol() : arbol;
var
	entrada : nodo;
	a : arbol;
begin
	a := nil;
	leerNodo(entrada);
	while(entrada.patente <> 'ZZZ') do
	begin
		insertarNodo(entrada, a);
		leerNodo(entrada);
	end;
	generarArbol := a;
end;

procedure imprimirArbol(a : arbol);
begin
	if(a <> nil) then
	begin
		imprimirArbol(a^.izq);
		write(a^.patente, ' ');
		imprimirArbol(a^.der);
	end;
end;

// b)
function cantMarca(marca : str32; a : arbol) : integer;
var
	cant : integer;
begin
	cant := 0;
	if(a <> nil) then
	begin
		cant := cantMarca(marca, a^.izq) + cantMarca(marca, a^.der);
		if(marca = a^.marca) then
			cant := cant + 1;
	end;
	cantMarca := cant;
end;

procedure agregarAdelante(auto : t_auto; var L : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dato := auto;
	nuevo^.sig := L;
	L := nuevo;
end;

// c)
procedure agrupadosAnio(a : arbol; var v : vector);
var
	aux : t_auto;
begin
	if(a <> nil) then
	begin
		agrupadosAnio(a^.der, v);

		aux.patente := a^.patente;
		aux.marca := a^.marca;
		aux.modelo := a^.modelo;
		agregarAdelante(aux, v[a^.fabricacion]);

		agrupadosAnio(a^.izq, v);
	end;
end;

procedure imprimirLista(L : lista);
begin
	while(L <> nil) do
	begin
		write(L^.dato.patente, ' ');
		L := L^.sig;
	end;
	writeln;
end;

procedure printListas(v : vector);
var
	i : integer;
begin
	writeln('LISTAS:');
	for i:=2010 to 2018 do
	begin
		write(i, ': ');
		imprimirLista(v[i]);
	end;
	writeln;
end;

// d)
function fabricacionDe(patente : str32; a : arbol) : t_anio;
begin
	if(a <> nil) then
	begin
		if(patente < a^.patente) then
			fabricacionDe := fabricacionDe(patente, a^.izq)
		else if(patente > a^.patente) then
			fabricacionDe := fabricacionDe(patente, a^.der)
		else
			fabricacionDe := a^.fabricacion;
	end
	else
	begin
		fabricacionDe := 2010;
	end;
end;


var
	a : arbol;
	v : vector;
begin
	a := generarArbol();
	imprimirArbol(a);
	writeln;
	writeln('Cantidad de Ford: ', cantMarca('Ford', a));
	agrupadosAnio(a, v);
	printListas(v);
	writeln('Año de fabricacion de patente ABC: ', fabricacionDe('ABC', a));
end.