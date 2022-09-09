program dos;
type
	t_genero = 1..8;
	
	t_pelicula = record
		ID : integer;
		genero : t_genero;
		puntaje : real;
	end;
	
	lista = ^nodo;
	nodo = record
		pelicula : t_pelicula;
		sig : lista;
	end;
	
	t_peliculas = array[t_genero] of lista;

procedure leerPelicula(var pelicula : t_pelicula);
begin
	write('ID: ');
	readln(pelicula.ID);
	if(pelicula.ID <> -1) then
	begin
		write('Genero (1-8): ');
		readln(pelicula.genero);
		
		write('Puntaje: ');
		readln(pelicula.puntaje);
	end;
	writeln;
end;

procedure insertarOrdenado(pelicula : t_pelicula; var L : lista);
var
	nuevo : lista;
	anterior : lista;
	actual : lista;
begin
	new(nuevo);
	nuevo^.pelicula := pelicula;
	anterior := L;
	actual := L;
	while((actual <> nil) and (actual^.pelicula.ID < pelicula.ID)) do
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

procedure cargarPeliculas(var mes : t_peliculas);
var
	entrada : t_pelicula;
begin
	leerPelicula(entrada);
	while(entrada.ID <> -1) do
	begin
		insertarOrdenado(entrada, mes[entrada.genero]);
		leerPelicula(entrada);
	end;
end;

procedure imprimirLista(L : lista);
begin
	while(L <> nil) do
	begin
		writeln(L^.pelicula.ID, ' ', L^.pelicula.genero);
		L := L^.sig;
	end;
	writeln;
end;

procedure agregarAtras(pelicula : t_pelicula; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.pelicula := pelicula;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure minimo(var min : t_pelicula; var mes : t_peliculas);
var
	i : integer;
	indiceMin : integer;
begin
	min.ID := 9999;
	for i:=1 to 8 do
	begin
		if(mes[i] <> nil) then
		begin
			if(mes[i]^.pelicula.ID < min.ID) then
			begin
				indiceMin := i;
				min := mes[indiceMin]^.pelicula;
			end;
		end;
	end;
	
	if(min.ID <> 9999) then
	begin
		mes[indiceMin] := mes[indiceMin]^.sig;
	end;
end;

function listaTotal(mes : t_peliculas) : lista;
var
	L : lista;
	ult : lista;
	entrada : t_pelicula;
begin
	L := nil;
	minimo(entrada, mes);
	while(entrada.ID <> 9999) do
	begin
		agregarAtras(entrada, L, ult);
		minimo(entrada, mes);
	end;
	listaTotal := L;
end;


// PROGRAMA PRINCIPAL //
var
	octubre : t_peliculas;
	i : integer;
	L : lista;
begin
	cargarPeliculas(octubre);
	for i:=1 to 8 do
	begin
		writeln('GENERO ', i);
		imprimirLista(octubre[i]);
	end;
	writeln;
	writeln('LISTA:');
	L := listaTotal(octubre);
	imprimirLista(L);
end.
