program practica3_7;
type
	str32 = string[32];
	str64 = string[64];

	t_ave = record
		codigo : integer;
		nombre : str32;
		familia : str32;
		descripcion : str64;
		zonaGeografica : str32;
	end;

	t_archivo = file of t_ave;


procedure borradoLogico(var archivo : t_archivo; posicion : integer);
var
	registro : t_ave;
begin
	reset(archivo);
	if((posicion >= 0) and (posicion < fileSize(archivo))) then
	begin
		seek(archivo, posicion);
		read(archivo, registro);
		registro.codigo := -(registro.codigo);
		seek(archivo, filePos(archivo)-1);
		write(archivo, registro);
	end
	else
	begin
		writeln('Posicion fuera de rango');
	end;
	close(archivo);
end;

procedure buscarElemento(var archivo : t_archivo; elemento : integer; var indice : integer);
var
	entrada : t_ave;
begin
	entrada.codigo := -1;
	reset(archivo);
	while((not EOF(archivo)) and (elemento <> entrada.codigo)) do
		read(archivo, entrada);
	
	if(elemento = entrada.codigo) then
		indice := (filePos(archivo)-1)
	else
		indice := -1;
	
	close(archivo);
end;

procedure compactar(var archivo : t_archivo);
var
	entrada : t_ave;
	cantBorrados : integer;
	posicionAux : integer;
begin
	cantBorrados := 0;
	reset(archivo);
	while(filePos(archivo) < (fileSize(archivo)-cantBorrados)) do
	begin
		read(archivo, entrada);
		if(entrada.codigo < 0) then
		begin
			cantBorrados := cantBorrados + 1;
			posicionAux := (filePos(archivo)-1);

			// leer ultimo registro
			seek(archivo, fileSize(archivo)-1);
			read(archivo, entrada);

			// volver para sobreescribir el borrado con el ultimo
			seek(archivo, posicionAux);
			write(archivo, entrada);

			// volver una posicion atras para tambien procesar el ultimo registro intercambiado
			// (tambien para que no se rompa cuando se elimina en un archivo de un unico registro)
			seek(archivo, filePos(archivo)-1);
		end;
	end;
	truncate(archivo);
end;

procedure leerAve(var ave : t_ave);
begin
	write('Codigo: ');
	readln(ave.codigo);
	if(ave.codigo <> -1) then 
	begin
		write('Nombre: ');
		readln(ave.nombre);
		write('Familia: ');
		readln(ave.familia);
		write('Descripcion: ');
		readln(ave.descripcion);
		write('Zona Geografica: ');
		readln(ave.zonaGeografica);
	end;
	writeln;
end;

procedure imprimirAve(ave : t_ave);
begin
	writeln('Codigo: ', ave.codigo);
	writeln('Nombre: ', ave.nombre);
	writeln('Familia: ', ave.familia);
	writeln('Descripcion: ', ave.descripcion);
	writeln('Zona Geografica: ', ave.zonaGeografica);
	writeln;
end;

procedure generarArchivo(var archivo : t_archivo);
var
	entrada : t_ave;
begin
	rewrite(archivo);
	leerAve(entrada);
	while(entrada.codigo <> -1) do
	begin
		write(archivo, entrada);
		leerAve(entrada);
	end;
	close(archivo);
end;

procedure imprimirArchivo(var archivo : t_archivo);
var
	entrada : t_ave;
begin
	writeln;
	reset(archivo);
	while(not EOF(archivo)) do
	begin
		read(archivo, entrada);
		imprimirAve(entrada);
	end;
	close(archivo);
end;

// PROGRAMA PRINCIPAL
const
	VALOR_CORTE = 5000;
var
	archivo : t_archivo;
	entrada : integer;
	indice : integer;
begin
	assign(archivo, 'ej7_archivo.dat');

	generarArchivo(archivo);
	imprimirArchivo(archivo);

	write('Codigo Especie: ');
	readln(entrada);
	while(entrada <> VALOR_CORTE) do
	begin
		buscarElemento(archivo, entrada, indice);
		borradoLogico(archivo, indice);
		
		write('Codigo Especie: ');
		readln(entrada);
	end;
	compactar(archivo);

	imprimirArchivo(archivo);
end.
