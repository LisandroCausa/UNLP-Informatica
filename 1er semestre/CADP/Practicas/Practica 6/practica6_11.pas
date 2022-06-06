program once;
type
	t_egresado = record
		id : integer;
		apellido : string;
		promedio : real;
	end;
	lista = ^nodo;
	nodo = record
		egresado : t_egresado;
		sig : lista;
	end;

procedure leerEgresado(var egresado : t_egresado);
begin
	write('ID: ');
	readln(egresado.id);
	if(egresado.id <> 0) then
	begin
		write('Apellido: ');
		readln(egresado.apellido);

		write('Promedio: ');
		readln(egresado.promedio);
	end;
	writeln;
end;

procedure imprimirEgresado(egresado : t_egresado);
begin
	writeln(egresado.id, ' ', egresado.apellido,  ' ', (egresado.promedio):2:2);
end;

// A)
procedure cargarEgresados(var L : lista);
var
	egresado : t_egresado;
	aux : lista;
begin
	leerEgresado(egresado);
	if(egresado.id <> 0) then
	begin
		new(L);
		L^.egresado := egresado;
		leerEgresado(egresado);
		aux := L;
		while(egresado.id <> 0) do
		begin
			new(aux^.sig);
			aux := aux^.sig;
			aux^.egresado := egresado;
			leerEgresado(egresado);
		end;
	end;
end;

procedure imprimirLista(L : lista);
begin
	while(L <> nil) do
	begin
		imprimirEgresado(L^.egresado);
		L := L^.sig;
	end;
end;

function longitudLista(L : lista) : integer;
var
	cont : integer;
begin
	cont := 0;
	while(L <> nil) do
	begin
		cont := cont + 1;
		L := L^.sig;
	end;
	longitudLista := cont;
end;


procedure eliminarUltimo(var L : lista);
var
	aux : lista;
	anterior : lista;
begin
	if(L <> nil) then
	begin
		aux := L;
		while(aux^.sig <> nil) do
		begin
			anterior := aux;
			aux := aux^.sig;
		end;

		if(aux = L) then
			L := nil
		else
			anterior^.sig := nil;
			
		dispose(aux);
	end;
end;

procedure insertarOrdenado(egresado : t_egresado; var L : lista; eliminarUlt : boolean);
var
	nuevo : lista;
	aux : lista;
begin
	new(nuevo);
	nuevo^.egresado := egresado;
	if(eliminarUlt) then
		eliminarUltimo(L);

	if(L = nil) then
	begin
		L := nuevo;
	end
	else if(nuevo^.egresado.promedio >= L^.egresado.promedio) then
	begin
		nuevo^.sig := L;
		L := nuevo;
	end
	else
	begin
		aux := L;
		while((aux^.sig <> nil) AND (nuevo^.egresado.promedio < aux^.sig^.egresado.promedio)) do
		begin
			aux := aux^.sig;
		end;
		nuevo^.sig := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

procedure imprimirPremiados(L : lista; cantPremiados : integer);
var
	top : lista;
	longitudMax : boolean;
begin
	longitudMax := false;
	top := nil;
	while(L <> nil) do
	begin
		insertarOrdenado(L^.egresado, top, longitudMax);
		if(longitudLista(top) = cantPremiados) then
			longitudMax := true;
		L := L^.sig;
	end;

	writeln;
	writeln('Los 10 egresados que recibiran el premio al mejor promedio:');
	imprimirLista(top);
end;



var
	L : lista;
begin
	cargarEgresados(L);
	imprimirPremiados(L, 10);
end.