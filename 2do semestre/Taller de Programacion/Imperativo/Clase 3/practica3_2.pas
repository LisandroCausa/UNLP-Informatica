program dos;
type
	t_venta = record
		codigo : integer;
		fecha : string;
		cant : integer;
	end;

	arbol = ^nodo;
	nodo = record
		venta : t_venta;
		izq : arbol;
		der : arbol;
	end;

	t_acumulador = record
		codigo : integer;
		cant : integer;
	end;

	arbol_acu = ^nodo_acu;
	nodo_acu = record
		dato : t_acumulador;
		izq : arbol_acu;
		der : arbol_acu;
	end;

procedure leerVenta(var venta : t_venta);
begin
	write('Codigo: ');
	readln(venta.codigo);
	if(venta.codigo <> 0) then
	begin
		write('Fecha: ');
		readln(venta.fecha);

		write('Cantidad: ');
		readln(venta.cant);
	end;
	writeln;
end;

procedure insertarVenta(venta : t_venta; var a : arbol);
begin
	if(a = nil) then
	begin
		new(a);
		a^.venta := venta;
		a^.der := nil;
		a^.izq := nil;
	end
	else if(venta.codigo < a^.venta.codigo) then
	begin
		insertarVenta(venta, a^.izq);
	end
	else
	begin // >=
		insertarVenta(venta, a^.der);
	end;
end;

procedure insertarAcumulador(venta : t_venta; var a : arbol_acu);
begin
	if(a = nil) then
	begin
		new(a);
		a^.dato.codigo := venta.codigo;
		a^.dato.cant := venta.cant;
		a^.der := nil;
		a^.izq := nil;
	end
	else if(venta.codigo < a^.dato.codigo) then
	begin
		insertarAcumulador(venta, a^.izq);
	end
	else if(venta.codigo > a^.dato.codigo) then
	begin
		insertarAcumulador(venta, a^.der);
	end
	else
	begin
		a^.dato.cant := a^.dato.cant + venta.cant;
	end;
end;

// a)
procedure generarArboles(var a1 : arbol; var a2 : arbol_acu);
var
	entrada : t_venta;
begin
	a1 := nil;
	a2 := nil;
	leerVenta(entrada);
	while(entrada.codigo <> 0) do
	begin
		insertarVenta(entrada, a1);
		insertarAcumulador(entrada, a2);
		leerVenta(entrada);
	end;
end;

procedure imprimirArbol(a : arbol);
begin
	if(a <> nil) then
	begin
		imprimirArbol(a^.izq);
		writeln(a^.venta.codigo, ' ', a^.venta.cant);
		imprimirArbol(a^.der);
	end;
end;

procedure imprimirArbolAcu(a : arbol_acu);
begin
	if(a <> nil) then
	begin
		imprimirArbolAcu(a^.izq);
		writeln(a^.dato.codigo, ' ', a^.dato.cant);
		imprimirArbolAcu(a^.der);
	end;
end;

// b)
function cantVendidasB(codigo : integer; a : arbol) : integer;
var
	cant : integer;
begin
	cant := 0;
	if(a <> nil) then
	begin
		if(codigo < a^.venta.codigo) then
		begin
			cant := cantVendidasB(codigo, a^.izq);
		end
		else if(codigo > a^.venta.codigo) then
		begin
			cant := cantVendidasB(codigo, a^.der);
		end
		else
		begin
			cant := a^.venta.cant;
			cant := cant + cantVendidasB(codigo, a^.izq);
			cant := cant + cantVendidasB(codigo, a^.der);
		end;
	end;
	cantVendidasB := cant;
end;

// c)
function cantVendidasC(codigo : integer; a : arbol_acu) : integer;
var
	cant : integer;
begin
	cant := 0;
	if(a <> nil) then
	begin
		if(codigo < a^.dato.codigo) then
		begin
			cant := cantVendidasC(codigo, a^.izq);
		end
		else if(codigo > a^.dato.codigo) then
		begin
			cant := cantVendidasC(codigo, a^.der);
		end
		else
		begin
			cant := a^.dato.cant;
		end;
	end;
	cantVendidasC := cant; 
end;

// PROGRAMA PRINCIPAL //
var
	a : arbol;
	acumulador : arbol_acu;
	n : integer;
begin
	generarArboles(a, acumulador);
	imprimirArbol(a);
	writeln;
	imprimirArbolAcu(acumulador);
	writeln;
	n := 3;
	writeln('Cantidad de productos ', n, ' vendidos:');
	writeln('MODULO B: ', cantVendidasB(n, a));
	writeln('MODULO C: ', cantVendidasC(n, acumulador));
end.