program practica2_1;
const
	NOMBRE_ARCHIVO_FUENTE = 'comisiones.dat';
	NOMBRE_ARCHIVO_RESULTADO = 'resultadoComisiones.dat';
	CODIGO_ALTO = -1;
type
	str32 = string[32];
	t_comision = record
		codigo : integer;
		nombre : str32;
		monto : integer;
	end;
	t_archivo = file of t_comision;

procedure leer(var archivo : t_archivo; var comision : t_comision);
begin
	if(not EOF(archivo)) then
		read(archivo, comision)
	else
		comision.codigo := CODIGO_ALTO;
end;

procedure leerComision(var c : t_comision);
begin
	write('Codigo: ');
	readln(c.codigo);
	if(c.codigo <> -1) then
	begin
		write('Nombre: ');
		readln(c.nombre);
		write('Monto: $');
		readln(c.monto);
	end;
	writeln;
end;

procedure imprimirComision(c : t_comision);
begin
	writeln('Codigo: ', c.codigo);
	writeln('Nombre: ', c.nombre);
	writeln('Monto: $', c.monto);
	writeln;
end;

procedure imprimirArchivo(nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_comision;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);
	while(not eof(archivo)) do
	begin
		read(archivo, entrada);
		imprimirComision(entrada);
	end;
	close(archivo);
end;

procedure cargarArchivoFuente(nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_comision;
begin
	assign(archivo, nombreArchivo);
	rewrite(archivo);
	leerComision(entrada);
	while(entrada.codigo <> -1) do
	begin
		write(archivo, entrada);
		leerComision(entrada);
	end;
	close(archivo);
end;

procedure compactarInfoComisiones(nombreArchivoFuente : str32);
var
	fuente : t_archivo;
	salida : t_archivo;
	entrada : t_comision;
	actual : t_comision;
begin
	assign(fuente, nombreArchivoFuente);
	assign(salida, NOMBRE_ARCHIVO_RESULTADO);
	reset(fuente);
	rewrite(salida);
	leer(fuente, entrada);
	while(entrada.codigo <> CODIGO_ALTO) do
	begin
		actual := entrada;
		actual.monto := 0;
		while(actual.codigo = entrada.codigo) do
		begin
			actual.monto := actual.monto + entrada.monto;
			leer(fuente, entrada);
		end;
		write(salida, actual);
	end;
	close(fuente);
	close(salida);
end;


begin
	cargarArchivoFuente(NOMBRE_ARCHIVO_FUENTE);
	//imprimirArchivo(NOMBRE_ARCHIVO_FUENTE);
	compactarInfoComisiones(NOMBRE_ARCHIVO_FUENTE);
	imprimirArchivo(NOMBRE_ARCHIVO_RESULTADO);
end.