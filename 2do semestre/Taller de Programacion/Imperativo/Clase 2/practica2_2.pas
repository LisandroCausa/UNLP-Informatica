program dos;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure imprimirDigitos(num : integer);
begin
	if(num <> 0) then
	begin
		imprimirDigitos(num DIV 10);
		write((num MOD 10), ' ');
	end
	else
		writeln;
end;

procedure procesarNodo(L : lista);
begin
	if(L <> nil) then
	begin
		imprimirDigitos(L^.num);
		procesarNodo(L^.sig);
	end
	else
		writeln;
end;

procedure agregarAtras(num : integer; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.num := num;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure cargarLista(var L : lista);
var
	entrada : integer;
	ult : lista;
begin
	L := nil;
	readln(entrada);
	while(entrada <> 0) do
	begin
		agregarAtras(entrada, L, ult);
		readln(entrada);
	end;
end;

var
	L : lista;
begin
	cargarLista(L);
	procesarNodo(L);
end.