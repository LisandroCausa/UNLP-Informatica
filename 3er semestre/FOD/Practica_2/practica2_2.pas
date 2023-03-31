program practica2_2;
const
	CODIGO_ALTO = -1;
type
	str32 = string[32];
	t_aprobacion = record
		codigo : integer;
		estado : integer;
	end;
	t_alumno = record
		codigo : integer;
		apellido : str32;
		nombre : str32;
		cursadas : integer;
		finales : integer;
	end;
	t_archivo = file of t_alumno;

procedure cargarTecladoAlumno(var alumno : t_alumno);
begin
	write('Codigo: ');
	readln(alumno.codigo);
	if(alumno.codigo <> CODIGO_ALTO) then
	begin
		write('Cursadas: ');
		readln(alumno.cursadas);
		write('Finales: ');
		readln(alumno.finales);
		alumno.apellido := 'Perez';
		alumno.nombre := 'Fulano';
	end;
	writeln;
end;

procedure imprimirAlumno(alumno : t_alumno);
begin
	writeln('Codigo: ', alumno.codigo);
	writeln('Cursadas: ', alumno.cursadas);
	writeln('Finales: ', alumno.finales);
	writeln;
end;

procedure generarMaestro(nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_alumno;
begin
	assign(archivo, nombreArchivo);
	rewrite(archivo);
	cargarTecladoAlumno(entrada);
	while(entrada.codigo <> CODIGO_ALTO) do
	begin
		write(archivo, entrada);
		cargarTecladoAlumno(entrada);
	end;
	close(archivo);
end;

procedure imprimirMaestro(nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_alumno;
begin
	writeln('MAESTRO:');
	assign(archivo, nombreArchivo);
	reset(archivo);
	while(not EOF(archivo)) do
	begin
		read(archivo, entrada);
		imprimirAlumno(entrada);
	end;
	close(archivo);
end;

procedure leerAprobacion(var archivo : text; var data : t_aprobacion);
begin
	if(not EOF(archivo)) then
		readln(archivo, data.codigo, data.estado)
	else
		data.codigo := CODIGO_ALTO;
end;

procedure leerAlumno(var archivo : t_archivo; var alumno : t_alumno);
begin
	if(not EOF(archivo)) then
		read(archivo, alumno)
	else
		alumno.codigo := CODIGO_ALTO;
end;

procedure actualizar(nombreArchivoMaestro : str32; nombreArchivoDetalle : str32);
var
	maestro : t_archivo;
	detalle : text;
	entrada : t_aprobacion;
	actual : t_alumno;
begin
	assign(maestro, nombreArchivoMaestro);
	assign(detalle, nombreArchivoDetalle);
	reset(maestro);
	reset(detalle);
	while(not EOF(detalle)) do
	begin
		leerAlumno(maestro, actual);
		leerAprobacion(detalle, entrada);
		while((actual.codigo <> entrada.codigo)) do
			leerAlumno(maestro, actual);
		if(entrada.estado = 0) then
			actual.cursadas := actual.cursadas + 1
		else
			actual.finales := actual.finales + 1;
		seek(maestro, filePos(maestro)-1);
		write(maestro, actual);
		seek(maestro, filePos(maestro)-1);
	end;
	close(maestro);
	close(detalle);
end;

// Listar en un archivo de texto los alumnos que tengan más de cuatro materias
// con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.
procedure listarPuntoB(nombreArchivoMaestro : str32; nombreArchivoResultado : str32);
var
	maestro : t_archivo;
	resultado : text;
	entrada : t_alumno;
begin
	assign(maestro, nombreArchivoMaestro);
	assign(resultado, nombreArchivoResultado);
	reset(maestro);
	rewrite(resultado);
	while(not EOF(maestro)) do
	begin
		read(maestro, entrada);
		if(entrada.cursadas > 4) then
			writeln(resultado, entrada.codigo, ' ', entrada.apellido, ' ', entrada.nombre, ' ', entrada.cursadas, ' ', entrada.finales);
	end;
	close(maestro);
	close(resultado);
end;

// PROGRAMA PRINCIPAL
var
	nombreArchivoMaestro : str32;
begin
	nombreArchivoMaestro := 'ej2_master.dat';
	generarMaestro(nombreArchivoMaestro);
	imprimirMaestro(nombreArchivoMaestro);
	actualizar(nombreArchivoMaestro, 'ej2_detalle.txt'); // A)
	imprimirMaestro(nombreArchivoMaestro);
	listarPuntoB(nombreArchivoMaestro, 'ej2_resultado.txt');
end.