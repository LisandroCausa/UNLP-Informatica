program uno;
type
	t_genero = 1..5;
	t_dni = longint;
	arr_generos = array[t_genero] of integer;
	t_actor = record
		dni : t_dni;
		apellido : string;
		nombre : string;
		edad : integer;
		genero : t_genero;
	end;
	lista = ^nodo;
	nodo = record
		actor : t_actor;
		sig : lista;
	end;

procedure leerActor(var a : t_actor);
begin
	write('DNI: ');
	readln(a.dni);

	write('Apellido: ');
	readln(a.apellido);

	write('Nombre: ');
	readln(a.nombre);

	write('Edad: ');
	readln(a.edad);

	write('Genero: ');
	readln(a.genero);
	writeln;
end;

procedure agregarAtras(a : t_actor; var L : lista; var ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.actor := a;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure cargarLista(var L : lista);
var
	entrada : t_actor;
	ult : lista;
begin
	repeat
		leerActor(entrada);
		agregarAtras(entrada, L, ult);
	until(entrada.dni = 33555444);
end;

procedure clasificarDigitos(dni : t_dni; var impares, pares : integer);
var
	aux : t_dni;
begin
	impares := 0;
	pares := 0;
	while(dni <> 0) do
	begin
		aux := dni MOD 10;
		if(aux MOD 2 = 0) then
			pares := pares + 1
		else
			impares := impares + 1;
		dni := dni DIV 10;
	end;
end;

procedure buscarEliminar(dni : t_dni; var L : lista);
var
	aux : lista;
	encontro : boolean;
	tmp : lista;
begin
	encontro := false;
	if(L <> nil) then
	begin
		if(L^.actor.dni = dni) then
		begin
			dispose(L);
			L := nil;
		end
		else
		begin
			aux := L;
			while((aux^.sig <> nil) AND (NOT(encontro))) do
			begin
				if(aux^.sig^.actor.dni = dni) then
				begin
					tmp := aux^.sig;
					aux^.sig := aux^.sig^.sig;
					dispose(tmp);
					encontro := true;
				end;
				aux := aux^.sig;
			end;
		end;
	end;
end;


var
	i : integer;
	cantPuntoA : integer;
	max1, max2 : integer;
	maxI1, maxI2 : t_genero;
	digPares, digImpares : integer;
	generos : arr_generos;
	L : lista;
begin
	cargarLista(L);
	cantPuntoA := 0;
	for i:=1 to 5 do
		generos[i] := 0;
	buscarEliminar(12345678, L);
	while(L <> nil) do
	begin
		clasificarDigitos(L^.actor.dni, digImpares, digPares);
		if(digPares > digImpares) then
			cantPuntoA := cantPuntoA + 1;
		generos[L^.actor.genero] := generos[L^.actor.genero] + 1;
		L := L^.sig;
	end;
	max1 := -1;
	max2 := -1;
	maxI1 := -1;
	maxI2 := -1;
	for i:=1 to 5 do
	begin
		if(generos[i] >= max1) then
		begin
			max2 := max1;
			max1 := generos[i];
			maxI2 := maxI1;
			maxI1 := i;
		end
		else if(generos[i] >= max2) then
		begin
			max2 := generos[i];
			maxI2 := i;
		end;
	end;
	writeln('Cantidad de personas cuyo DNI contiene mas digitos pares que impares: ', cantPuntoA);
	writeln('Los 2 codigos de genero mas elegidos: ', maxI1, ' y ', maxI2);
end.