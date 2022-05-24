program cinco;
type
	t_producto = record
		codigo : integer;
		descripcion : string;
		stockActual : integer;
		stockMinimo : integer;
		precio : real;
	end;
	lista = ^nodo;
	nodo = record
		datos : t_producto;
		sig : lista;
	end;


procedure agregar(var ultimo : lista; producto : t_producto);
var
	aux : lista;
begin
	new(aux);
	aux^.datos := producto;
	aux^.sig := nil;
	ultimo^.sig := aux;
	ultimo := aux;
end;

procedure leerProducto(var producto : t_producto);
begin
	write('Codigo: ');
	readln(producto.codigo);
	if(producto.codigo <> -1) then
	begin
		write('Descripcion: ');
		readln(producto.descripcion);

		write('Stock actual: ');
		readln(producto.stockActual);

		write('Stock minimo: ');
		readln(producto.stockMinimo);

		write('Precio: $');
		readln(producto.precio);
	end;
	writeln;
end;

procedure cargarLista(var L : lista);
var
	ultimo : lista;
	prod : t_producto;
begin
	leerProducto(prod);
	if(prod.codigo <> -1) then
	begin
		new(L);
		L^.datos := prod;
		L^.sig := nil;
		ultimo := L;
		leerProducto(prod);
		while(prod.codigo <> -1) do
		begin
			agregar(ultimo, prod);
			leerProducto(prod);
		end;
	end;
end;

procedure contarProductosStockEscaso(producto:t_producto; var longitud:integer; var cont:integer);
begin
	longitud := longitud + 1;
	if(producto.stockActual < producto.stockMinimo) then
		cont := cont + 1;
end;

function esPar(valor : integer) : boolean;
begin
	esPar := (valor MOD 2 = 0);
end;

procedure clasificarDigitos(num:integer; var pares:integer; var impares:integer);
var
	digito : integer;
begin
	pares := 0;
	impares := 0;
	while(num <> 0) do
	begin
		digito := num MOD 10;
		num := num DIV 10;
		if(esPar(digito)) then
			pares := pares + 1
		else
			impares := impares + 1;
	end;
end;

// b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
procedure puntoB(producto : t_producto);
var
	pares : integer;
	impares : integer;
begin
	clasificarDigitos(producto.codigo, pares, impares);
	if(pares >= 3) then
	begin
		writeln(producto.descripcion);
		writeln;
	end;
end;

procedure actualizarMinPrecios(producto : t_producto; var min1, min2 : t_producto);
begin
	if(producto.precio <= min1.precio) then
	begin
		min2 := min1;
		min1 := producto;
	end
	else if(producto.precio <= min2.precio) then
	begin
		min2 := producto;
	end;
end;

// PROGRAMA PRINCIPAL
var
	L : lista;
	longitud : integer;
	contA : integer;
	minPrecio1 : t_producto;
	minPrecio2 : t_producto;
begin
	longitud := 0;
	contA := 0;
	minPrecio1.precio := 99999;
	minPrecio2.precio := 99999;
	cargarLista(L);
	while(L <> nil) do
	begin
		contarProductosStockEscaso(L^.datos, longitud, contA);
		puntoB(L^.datos);
		actualizarMinPrecios(L^.datos, minPrecio1, minPrecio2);
		L := L^.sig;
	end;
	writeln('Porcentaje de productos con stock actual por debajo de su stock minimo: %', ((contA*100)/longitud):3:2);
	writeln('Codigo de los dos productos mas economicos: ');
	writeln(minPrecio1.codigo);
	writeln(minPrecio2.codigo);
end.