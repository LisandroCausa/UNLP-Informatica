program practica2_6;
const
	N = 3;
	VALOR_ALTO = 9999;
type
	str32 = string[32];
	t_dato = record
		codigoLocalidad : integer;
		nombreLocalidad : str32;
		codigoCepa : integer;
		nombreCepa : integer;
		casosActivos : integer;
		casosNuevos : integer;
		recuperados : integer;
		fallecidos : integer;
	end;

	t_archivo = file of t_dato;
	vector_datos = array[1..N] of t_dato;
	vector_archivos = array[1..N] of t_archivo;

procedure leer(var archivo : t_archivo; var dato : t_dato);
begin
	if(not eof(archivo)) then
		read(archivo, dato)
	else
		dato.codigoLocalidad := VALOR_ALTO
end;

procedure minimo(var datos : vector_datos; var archivos : vector_archivos; var minimo : t_dato);
var
	i : integer;
	indiceMinimo : integer;
begin
	indiceMinimo := 1;
	for i:=2 to N do
	begin
		if((datos[i].codigoLocalidad < datos[indiceMinimo].codigoLocalidad) or
		 ((datos[i].codigoLocalidad = datos[indiceMinimo].codigoLocalidad) and (datos[i].codigoCepa < datos[indiceMinimo].codigoCepa))) then
		begin
			indiceMinimo := i;
		end;
	end;
	minimo := datos[indiceMinimo];
	leer(archivos[indiceMinimo], datos[indiceMinimo]);
end;

procedure actualizarMaestro(var maestro : t_archivo; detalles : vector_archivos);
var
	regDetalles : vector_datos;
	regMinimo : t_dato;
	regMaestro : t_dato;
	i : integer;
begin
	reset(maestro);
	for i:=1 to N do
	begin
		reset(detalles[i]);
		leer(detalles[i], regDetalles[i]);
	end;
	leer(maestro, regMaestro);
	minimo(regDetalles, detalles, regMinimo);
	while(regMinimo.codigoLocalidad <> VALOR_ALTO) do
	begin
		while((regMaestro.codigoLocalidad <> regMinimo.codigoLocalidad) or (regMaestro.codigoCepa <> regMinimo.codigoCepa)) do
			leer(maestro, regMaestro);

		regMaestro.fallecidos := regMaestro.fallecidos + regMinimo.fallecidos;
		regMaestro.recuperados := regMaestro.recuperados + regMinimo.recuperados;
		regMaestro.casosActivos := regMinimo.casosActivos;
		regMaestro.casosNuevos := regMinimo.casosNuevos;

		seek(maestro, filePos(maestro)-1);
		write(maestro, regMaestro);
	
		minimo(regDetalles, detalles, regMinimo);
	end;
	close(maestro);
	for i:=1 to N do
		close(detalles[i])
end;

/////////////////////////////////////////////

procedure leerDato(var dato : t_dato);
begin
	write('Codigo Localidad: ');
	readln(dato.codigoLocalidad);
	if(dato.codigoLocalidad <> -1) then
	begin
		write('Codigo Cepa: ');
		readln(dato.codigoCepa);
		write('Casos Activos: ');
		readln(dato.casosActivos);
		write('Casos Nuevos: ');
		readln(dato.casosNuevos);
		write('Recuperados: ');
		readln(dato.recuperados);
		write('Fallecidos: ');
		readln(dato.fallecidos);
	end;
	writeln;
end;

procedure cargarArchivo(var archivo : t_archivo);
var
	entrada : t_dato;
begin
	rewrite(archivo);
	leerDato(entrada);
	while(entrada.codigoLocalidad <> -1) do
	begin
		write(archivo, entrada);
		leerDato(entrada);
	end;
	close(archivo);
	writeln('----------------------------');
end;

procedure imprimirDato(dato : t_dato);
begin
	writeln('Codigo Localidad: ', dato.codigoLocalidad);
	writeln('Codigo Cepa: ', dato.codigoCepa);
	writeln('Activos: ', dato.casosActivos);
	writeln('Nuevos: ', dato.casosNuevos);
	writeln('Recuperados: ', dato.recuperados);
	writeln('Fallecidos: ', dato.fallecidos);
	writeln;
end;

procedure imprimirArchivo(var archivo : t_archivo);
var
	entrada : t_dato;
begin
	reset(archivo);
	leer(archivo, entrada);
	while(entrada.codigoLocalidad <> VALOR_ALTO) do
	begin
		imprimirDato(entrada);
		leer(archivo, entrada);
	end;
	close(archivo);
end;

// PROGRAMA PRINCIPAL
var
	maestro : t_archivo;
	detalles : vector_archivos;
	i : integer;
	iString : str32;
begin
	assign(maestro, 'ej6_maestro.dat');
	cargarArchivo(maestro);
	for i:=1 to N do
	begin
		str(i, iString);
		assign(detalles[i], 'ej6_detalle' + iString + '.dat');
		writeln('DETALLE ', i);
		cargarArchivo(detalles[i]);
	end;
	imprimirArchivo(maestro);
	writeln('-------------------------------');
	actualizarMaestro(maestro, detalles);
	writeln('ACTUALIZADO:');
	imprimirArchivo(maestro);
end.