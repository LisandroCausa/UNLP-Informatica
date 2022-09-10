program tres;
type
	t_genero = 1..8;
	t_pelicula = record
		ID : integer;
		genero : t_genero;
		puntaje : real;
	end;
	
	t_pelicula_e = record
		ID : integer;
		puntaje : real;
	end;

	lista = ^nodo;
	nodo = record
		pelicula : t_pelicula;
		sig : lista;
	end;

	v_peliculas = array[t_genero] of lista;
	v_top = array[t_genero] of t_pelicula_e;


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

// procedimiento que convierte un registro t_pelicula a uno t_pelicula_e
procedure convertirAe(pelicula : t_pelicula; var nueva : t_pelicula_e);
begin
	nueva.ID := pelicula.ID;
	nueva.puntaje := pelicula.puntaje;
end;

procedure agregarAtras(dato : t_pelicula; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.pelicula := dato;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

// a)
procedure cargarPeliculas(var peliculas : v_peliculas);
var
	entrada : t_pelicula;
	ultimo : v_peliculas;
begin
	leerPelicula(entrada);
	while(entrada.ID <> -1) do
	begin
		agregarAtras(entrada, peliculas[entrada.genero], ultimo[entrada.genero]);
		leerPelicula(entrada);
	end;
end;

procedure maxPuntajeLista(L : lista; var max : t_pelicula_e);
var
	auxMax : t_pelicula;
begin
	auxMax.puntaje := -999;
	while(L <> nil) do
	begin
		if(L^.pelicula.puntaje > auxMax.puntaje) then
			auxMax := L^.pelicula;
		L := L^.sig;
	end;
	convertirAe(auxMax, max);
end;

// b)
procedure generarTop(peliculas : v_peliculas; var top : v_top);
var
	i : integer;
begin
	for i:=1 to 8 do
	begin
		maxPuntajeLista(peliculas[i], top[i]);
	end;
end;

// c)
procedure sort(var top : v_top);
var
	i : integer;
	j : integer;
	min_i : integer;
	tmp : t_pelicula_e;
begin
	for i:=1 to 7 do
	begin
		min_i := i;
		for j:=(i+1) to 8 do
		begin
			if(top[j].puntaje > top[min_i].puntaje) then
				min_i := j;
		end;
		tmp := top[i];
		top[i] := top[min_i];
		top[min_i] := tmp;
	end;
end;

// PROGRAMA PRINCIPAL //
var
	diciembre : v_peliculas;
	top : v_top;
begin
	randomize;
	cargarPeliculas(diciembre);
	generarTop(diciembre, top);
	sort(top);
	// d)
	writeln('Pelicula con mayor puntaje: ', top[1].ID);
	writeln('Pelicula con menor puntaje: ', top[8].ID);
end.
