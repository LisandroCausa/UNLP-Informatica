program uno;
const
	ISBN_LIMITE = 999999;
type
	t_dia = 1..31;
	t_mes = 1..12;
	t_prestamo = record
		ISBN : longInt;
		idSocio : integer;
		dia : t_dia;
		mes : t_mes;
		cantDias : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : t_prestamo;
		sig : lista;
	end;

	t_historial = record
		ISBN : longInt;
		cant : integer;
	end;

	lista_h = ^nodo_h;
	nodo_h = record
		dato : t_historial;
		sig : lista_h;
	end;

	v_prestamos = array[t_mes] of lista;


procedure leerPrestamo(var prestamo : t_prestamo);
begin
	write('ISBN: ');
	readln(prestamo.ISBN);
	if(prestamo.ISBN <> -1) then
	begin
		write('ID Socio: ');
		readln(prestamo.idSocio);

		write('Dia: ');
		readln(prestamo.dia);

		write('Mes: ');
		readln(prestamo.mes);

		write('Cantidad dias: ');
		readln(prestamo.cantDias);
	end;
	writeln;
end;

procedure insertarOrdenado(prestamo : t_prestamo; var L : lista);
var
	nuevo : lista;
	anterior : lista;
	actual : lista;
begin
	new(nuevo);
	nuevo^.dato := prestamo;
	anterior := L;
	actual := L;
	while((actual <> nil) and (actual^.dato.ISBN < prestamo.ISBN)) do
	begin
		anterior := actual;
		actual := actual^.sig;
	end;

	if(anterior = actual) then
		L := nuevo
	else
		anterior^.sig := nuevo;
	nuevo^.sig := actual;
end;

procedure agregarAtras(prestamo : t_prestamo; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dato := prestamo;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

// a)
procedure cargarPrestamos(var prestamos : v_prestamos);
var
	entrada : t_prestamo;
begin
	leerPrestamo(entrada);
	while(entrada.ISBN <> -1) do
	begin
		insertarOrdenado(entrada, prestamos[entrada.mes]);
		leerPrestamo(entrada);
	end;
end;

// b)
procedure imprimirPrestamos(mes : integer; prestamos : v_prestamos);
begin
	if((1 <= mes) and (mes <= 12)) then
	begin
		writeln('MES ', mes, ':');
		while(prestamos[mes] <> nil) do
		begin
			writeln(prestamos[mes]^.dato.ISBN, ' - ', prestamos[mes]^.dato.idSocio);
			prestamos[mes] := prestamos[mes]^.sig;
		end;
		writeln;
		imprimirPrestamos(mes+1, prestamos);
	end;
end;

procedure minimo(var prestamos : v_prestamos; var min : t_prestamo);
var
	i : integer;
	indiceMin : integer;
begin
	min.ISBN := ISBN_LIMITE;
	indiceMin := 0;
	for i:=1 to 12 do
	begin
		if((prestamos[i] <> nil) and (prestamos[i]^.dato.ISBN < min.ISBN)) then
		begin
			indiceMin := i;
			min := prestamos[i]^.dato;
		end;
	end;
	if(indiceMin > 0) then
		prestamos[indiceMin] := prestamos[indiceMin]^.sig;
end;

// c)
function merge(prestamos : v_prestamos) : lista;
var
	L : lista;
	ult : lista;
	entrada : t_prestamo;
begin
	L := nil;
	ult := nil;
	minimo(prestamos, entrada);
	while(entrada.ISBN <> ISBN_LIMITE) do
	begin
		agregarAtras(entrada, L, ult);
		minimo(prestamos, entrada);
	end;
	merge := L;
end;

// d)
procedure imprimirLista(L : lista);
begin
	if(L <> nil) then
	begin
		writeln(L^.dato.ISBN, ' - ', L^.dato.idSocio);
		imprimirLista(L^.sig);
	end
	else
		writeln;
end;

procedure agregarAtrasH(historial : t_historial; var L, ult : lista_h);
var
	nuevo : lista_h;
begin
	new(nuevo);
	nuevo^.dato := historial;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

// e)
function listaHistorial(prestamos : v_prestamos) : lista_h;
var
	entrada : t_prestamo;
	actual : t_historial;
	L : lista_h;
	ult : lista_h;
begin
	L := nil;
	ult := nil;
	minimo(prestamos, entrada);
	while(entrada.ISBN <> ISBN_LIMITE) do
	begin
		actual.ISBN := entrada.ISBN;
		actual.cant := 0;
		while(entrada.ISBN = actual.ISBN) do
		begin
			actual.cant := actual.cant + 1;
			minimo(prestamos, entrada);
		end;
		agregarAtrasH(actual, L, ult);
	end;
	listaHistorial := L;
end;

// f)
procedure imprimirHistorial(L : lista_h);
begin
	if(L <> nil) then
	begin
		writeln(L^.dato.ISBN, ' - ', L^.dato.cant);
		imprimirHistorial(L^.sig);
	end
	else
		writeln;
end;

// PROGRAMA PRINCIPAL //
var
	prestamos : v_prestamos;
	total : lista;
	historial : lista_h;
begin
	cargarPrestamos(prestamos);
	imprimirPrestamos(1, prestamos);
	total := merge(prestamos);
	writeln('MERGE:');
	imprimirLista(total);
	historial := listaHistorial(prestamos);
	writeln('HISTORIAL:');
	imprimirHistorial(historial);
end.