program uno;
type
	t_cadena = array[1..10] of char;
	lista = ^nodo;
	nodo = record
		valor : char;
		sig : lista;
	end;

// a)
procedure cargarCadena(var cadena : t_cadena; i : integer);
begin
	if((1 <= i) and (i <= 10)) then
	begin
		readln(cadena[i]);
		if(cadena[i] <> '.') then
			cargarCadena(cadena, i+1);
	end;
end;

// b)
procedure imprimirCadena(c : t_cadena);
var
	i : integer;
begin
	i := 1;
	while((i <= 10) and (c[i] <> '.')) do
	begin
		write(c[i]);
		i := i + 1;
	end;
	writeln;
end;

// c)
procedure imprimirRecursivo(c : t_cadena; i : integer);
begin
	if((1 <= i) and (i <= 10) and (c[i] <> '.')) then
	begin
		write(c[i]);
		imprimirRecursivo(c, i+1);
	end;
end;

// d)
function cantLeidos() : integer;
var
	entrada : char;
begin
	readln(entrada);
	if(entrada <> '.') then
	begin
		cantLeidos := 1 + cantLeidos();
	end
	else
	begin
		cantLeidos := 0; // Caso base. entrada == '.'
	end;
end;

// e)
function listaCaracteres() : lista;
var
	entrada : char;
	nuevo : lista;
begin
	readln(entrada);
	if(entrada <> '.') then
	begin
		new(nuevo);
		nuevo^.valor := entrada;
		nuevo^.sig := listaCaracteres();
		listaCaracteres := nuevo;
	end
	else
	begin
		listaCaracteres := nil;
	end;
end;

// f)
procedure imprimirLista(L : lista);
begin
	if(L <> nil) then
	begin
		write(L^.valor, ' ');
		imprimirLista(L^.sig);
	end;
end;

// g)
procedure imprimirListaInverso(L : lista);
begin
	if(L <> nil) then
	begin
		imprimirListaInverso(L^.sig);
		write(L^.valor, ' ');
	end;
end;


// PROGRAMA PRINCIPAL //
var
	cadena : t_cadena;
	L : lista;
begin
	cargarCadena(cadena, 1);
	imprimirCadena(cadena);
	imprimirRecursivo(cadena, 1);
	writeln;
	writeln(cantLeidos());
	L := listaCaracteres();
	imprimirLista(L);
	writeln;
	imprimirListaInverso(L);
end.