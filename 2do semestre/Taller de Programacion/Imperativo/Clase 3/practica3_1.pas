program uno;
type
	t_socio = record
		id : integer;
		nombre : string;
		edad : integer;
	end;

	arbol = ^nodo;
	nodo = record
		socio : t_socio;
		izq : arbol;
		der : arbol;
	end;

///////////////////////////////////////////////////////////
procedure insertarOrdenado(socio : t_socio; var a : arbol);
begin
	if(a = nil) then
	begin
		new(a);
		a^.socio := socio;
	end
	else if(socio.id >= a^.socio.id) then
	begin
		insertarOrdenado(socio, a^.der);
	end
	else
	begin
		insertarOrdenado(socio, a^.izq);
	end;
end;

procedure leerSocio(var socio : t_socio);
begin
	write('ID: ');
	readln(socio.id);
	if(socio.id <> 0) then
	begin
		write('Nombre: ');
		readln(socio.nombre);

		write('Edad: ');
		readln(socio.edad);
	end;
	writeln;
end;

procedure imprimirSocio(socio : t_socio);
begin
	writeln(socio.id, ' ', socio.nombre, ' ', socio.edad);
end;

function nuevoArbol() : arbol;
var
	a : arbol;
	entrada : t_socio;
begin
	a := nil;
	leerSocio(entrada);
	while(entrada.id <> 0) do
	begin
		insertarOrdenado(entrada, a);
		leerSocio(entrada);
	end;
	nuevoArbol := a;
end;

// I)
function max(a : arbol) : integer;
var
	retorno : integer;
begin
	if(a = nil) then
	begin
		retorno := 0; // valor que indica final de los nodos
	end
	else
	begin
		retorno := max(a^.der);
		if(retorno = 0) then
			retorno := a^.socio.id;
	end;
	max := retorno;
end;

// II)
procedure min(a : arbol; var socio : t_socio);
begin
	if(a = nil) then
	begin
		socio.id := 0; // valor que indica final de los nodos
	end
	else
	begin
		min(a^.izq, socio);
		if(socio.id = 0) then
			socio := a^.socio;
	end;
end;

// III)
function mayorEdad(a : arbol) : integer;
var
	retorno : integer;
	tmp : integer;
begin
	retorno := 0;
	if(a = nil) then
	begin
		retorno := -1;
	end
	else
	begin
		tmp := mayorEdad(a^.izq);
		if(tmp > retorno) then
			retorno := tmp;

		if(a^.socio.edad > retorno) then
			retorno := a^.socio.edad;
		
		tmp := mayorEdad(a^.der);
		if(tmp > retorno) then
			retorno := tmp;
	end;
	mayorEdad := retorno;
end;

// IV)
procedure incrementarEdades(a : arbol);
begin
	if(a <> nil) then
	begin
		a^.socio.edad := a^.socio.edad + 1;
		incrementarEdades(a^.izq);
		incrementarEdades(a^.der);
	end;
end;

// V)
function existeID(id : integer; a : arbol) : boolean;
var
	retorno : boolean;
begin
	retorno := false;
	if(a <> nil) then
	begin
		if(a^.socio.id < id) then
			retorno := existeID(id, a^.der)
		else if(a^.socio.id > id) then
			retorno := existeID(id, a^.izq)
		else
			retorno := true; // encontro
	end;
	existeID := retorno;
end;

// VI)
function existeNombre(nombre : string; a : arbol) : boolean;
begin
	if(a = nil) then
	begin
		existeNombre := false;
	end
	else
	begin
		existeNombre := existeNombre(nombre, a^.izq) or
					(a^.socio.nombre = nombre) or
					existeNombre(nombre, a^.der);
	end;
end;

// VII)
function cantidadNodos(a : arbol) : integer;
var
	cant : integer;
begin
	cant := 0;
	if(a <> nil) then
	begin
		cant := 1;
		cant := cant + cantidadNodos(a^.izq);
		cant := cant + cantidadNodos(a^.der);
	end;
	cantidadNodos := cant;
end;

// VIII)
function sumaEdades(a : arbol) : integer;
var
	retorno : integer;
begin
	retorno := 0;
	if(a <> nil) then
	begin
		retorno := a^.socio.edad;
		retorno := retorno + sumaEdades(a^.izq);
		retorno := retorno + sumaEdades(a^.der);
	end;
	sumaEdades := retorno;
end;

// IX)
function dentroDeRango(inicio, fin : integer; a: arbol) : integer;
var
	cant : integer;
begin
	cant := 0;
	if(a <> nil) then
	begin
		if(a^.socio.id < inicio) then
		begin
			cant := dentroDeRango(inicio, fin, a^.der);
		end
		else if(a^.socio.id > fin) then
		begin
			cant := dentroDeRango(inicio, fin, a^.izq);
		end
		else
		begin //  ID esta dentro del rango
			cant := 1;
			cant := cant + dentroDeRango(inicio, fin, a^.izq);
			cant := cant + dentroDeRango(inicio, fin, a^.der);
		end;
	end;
	dentroDeRango := cant;
end;

// X)
procedure imprimirEnOrden(a : arbol);
begin
	if(a <> nil) then
	begin
		imprimirEnOrden(a^.izq);
		writeln(a^.socio.id);
		imprimirEnOrden(a^.der);
	end;
end;

// XI)
procedure imprimirEnOrdenDecreciente(a : arbol);
begin
	if(a <> nil) then
	begin
		imprimirEnOrdenDecreciente(a^.der);
		if((a^.socio.id MOD 2) = 0) then
			writeln(a^.socio.id);
		imprimirEnOrdenDecreciente(a^.izq);
	end;
end;


// PROGRAMA PRINCIPAL //
var
	a : arbol;
	socioIDMin : t_socio;
	entrada : integer;
	entrada2 : integer;
	entradaSTR : string;
begin
	a := nuevoArbol();
	writeln('--------------------');
	imprimirEnOrden(a);
	writeln;

	writeln('ID maximo: ', max(a));
	writeln;

	min(a, socioIDMin);
	writeln('Socio ID mas chico:');
	imprimirSocio(socioIDMin);
	writeln;

	writeln('Maxima edad: ', mayorEdad(a));

	incrementarEdades(a);
	writeln('Edades incrementadas por 1');
	writeln;

	write('Existe ID? ');
	readln(entrada);
	if(existeID(entrada, a)) then
		writeln('SI')
	else
		writeln('NO');
	writeln;

	write('Existe Nombre? ');
	readln(entradaSTR);
	if(existeNombre(entradaSTR, a)) then
		writeln('SI')
	else
		writeln('NO');
	writeln;

	writeln('Cantidad de socios: ', cantidadNodos(a));
	entrada := cantidadNodos(a);
	if(entrada > 0) then // No dividir por 0
		writeln('Promedio Edad = ', (sumaEdades(a)/entrada):2:2)
	else
		writeln('ERROR');
	writeln;

	write('Inicio rango: ');
	readln(entrada);
	write('Fin rango: ');
	readln(entrada2);
	writeln('Cantidad que entran en rango: ', dentroDeRango(entrada, entrada2, a));

	writeln('Orden creciente:');
	imprimirEnOrden(a);
	writeln;

	writeln('Orden decreciente (solo pares):');
	imprimirEnOrdenDecreciente(a);
end.