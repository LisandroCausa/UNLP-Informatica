program tres;
const
	N = 10;
type
	t_rubro = 1..N;
	t_producto = record
		codigo : integer;
		rubro : t_rubro;
		stock : integer;
		precio : integer;
	end;

	arbol = ^nodo;
	nodo = record
		producto : t_producto;
		izq : arbol;
		der : arbol;
	end;

	vector = array[t_rubro] of arbol;

	t_producto_e = record
		codigo : integer;
		stock : integer;
	end;
	v_top = array[t_rubro] of t_producto_e;

	i_vector = array[t_rubro] of integer;

procedure leerProducto(var p : t_producto);
begin
	write('Codigo: ');
	readln(p.codigo);
	if(p.codigo <> -1) then
	begin
		write('Rubro (1-10): ');
		readln(p.rubro);

		write('Stock: ');
		readln(p.stock);

		write('Precio: $');
		readln(p.precio);
	end;
	writeln;
end;

procedure insertar(producto : t_producto; var a : arbol);
begin
	if(a = nil) then
	begin
		new(a);
		a^.producto := producto;
	end
	else if(producto.codigo < a^.producto.codigo) then
	begin
		insertar(producto, a^.izq);
	end
	else if(producto.codigo > a^.producto.codigo) then
	begin
		insertar(producto, a^.der);
	end;
end;

procedure cargarData(var v : vector);
var
	entrada : t_producto;
begin
	leerProducto(entrada);
	while(entrada.codigo <> -1) do
	begin
		insertar(entrada, v[entrada.rubro]);
		leerProducto(entrada);
	end;
	writeln;
end;

function existeEnArbol(codigo : integer; a : arbol) : boolean;
begin
	if(a <> nil) then
	begin
		if(codigo < a^.producto.codigo) then
			existeEnArbol := existeEnArbol(codigo, a^.izq)
		else if(codigo > a^.producto.codigo) then
			existeEnArbol := existeEnArbol(codigo, a^.der)
		else
			existeEnArbol := true;
	end
	else
	begin
		existeEnArbol := false;
	end;
end;

function existe(rubro : t_rubro; codigo : integer; v : vector) : boolean;
begin
	existe := existeEnArbol(codigo, v[rubro]);
end;

procedure max(var prod : t_producto_e; a : arbol);
begin
	if(a <> nil) then
	begin
		prod.codigo := a^.producto.codigo;
		prod.stock := a^.producto.stock;
		max(prod, a^.der);
	end;
end;

procedure generarTopCodigos(v : vector; var top : v_top);
var
	i : integer;
begin
	for i:=1 to N do
		max(top[i], v[i]);
end;

procedure imprimirProdE(prod : t_producto_e);
begin
	writeln(prod.codigo, ' - ', prod.stock);
end;

function cantRango(inicio, fin : integer; a : arbol) : integer;
begin
	if(a <> nil) then
	begin
		if(a^.producto.codigo < inicio)then
			cantRango := cantRango(inicio, fin, a^.der)
		else if(a^.producto.codigo > fin) then
			cantRango := cantRango(inicio, fin, a^.izq)			
		else
			cantRango := 1 + cantRango(inicio, fin, a^.izq) + cantRango(inicio, fin, a^.der);
	end
	else
	begin
		cantRango := 0;
	end;
end;

procedure generarVectorCantidades(v : vector; var cant : i_vector);
var
	i : integer;
	inicio : integer;
	fin : integer;
begin
	write('Inicio: ');
	readln(inicio);
	write('Fin: ');
	readln(fin);
	for i:=1 to N do
		cant[i] := cantRango(inicio, fin, v[i]);
end;

// PROGRAMA PRINCIPAL //
var
	v : vector;
	top : v_top;
	i : integer;
	cant : i_vector;
begin
	cargarData(v);
	writeln(existe(3, 7, v));
	generarTopCodigos(v, top);
	for i:=1 to N do
	begin
		write(i, ' ');
		imprimirProdE(top[i]);
	end;
	writeln;
	generarVectorCantidades(v, cant);
	for i:=1 to N do
		writeln(i, ' - ', cant[i]);
end.