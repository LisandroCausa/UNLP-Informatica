// se modifica el ejercicio practica3_2.pas debido a que el
// ejercicio que pide modificar el enunciado no lo tengo hecho.
program ejemplo3_1;
type
	str16 = string[16];
	str32 = string[32];
	str64 = string[64];

	t_asistente = record
		nro : integer;
		apellido : str32;
		nombre : str32;
		email : str64;
		telefono : str16;
		DNI : str16;
	end;
		
	t_archivo = file of t_asistente;

procedure generarAsistente(var asistente : t_asistente);
begin
	write('Numero: ');
	readln(asistente.nro);
	if(asistente.nro <> -1) then
	begin
		write('Nombre: ');
		readln(asistente.nombre);
		write('Apellido: ');
		readln(asistente.apellido);
		write('Email: ');
		readln(asistente.email);
		write('Telefono: ');
		readln(asistente.telefono);
		write('DNI: ');
		readln(asistente.DNI);
	end;
	writeln;
end;

procedure generarArchivo(nombreArchivo : str64);
var
	archivo : t_archivo;
	entrada : t_asistente;
begin
	assign(archivo, nombreArchivo);
	rewrite(archivo);
	generarAsistente(entrada);
	while(entrada.nro <> -1) do
	begin
		write(archivo, entrada);
		generarAsistente(entrada);
	end;
	close(archivo);
end;

procedure imprimirAsistente(asistente : t_asistente);
begin
	writeln('Numero: ', asistente.nro);
	writeln('Nombre: ', asistente.nombre);
	writeln('Apellido: ', asistente.apellido);
	writeln('Email: ', asistente.email);
	writeln('Telefono: ', asistente.telefono);
	writeln('DNI: ', asistente.DNI);
	writeln;
end;

procedure imprimirArchivo(nombreArchivo : str64);
var
	archivo : t_archivo;
	entrada : t_asistente;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);
	while(not EOF(archivo)) do
	begin
		read(archivo, entrada);
		imprimirAsistente(entrada);
	end;
	close(archivo);
end;

// borrado fisico sobreescribiendo el elemento a borrrar con el ultimo elemento
procedure borrarFisicamente(nroBuscado : integer; nombreArchivo : str64);
var
	archivo : t_archivo;
	encontro : boolean;
	entrada : t_asistente;
	indiceBuscado : integer;
begin
	encontro := false;
	assign(archivo, nombreArchivo);
	reset(archivo);
	while((not EOF(archivo)) and (encontro = false)) do
	begin
		read(archivo, entrada);
		if(entrada.nro = nroBuscado) then
		begin
			encontro := true;
			indiceBuscado := (filePos(archivo) - 1);

			// se obtiene último elemento
			seek(archivo, fileSize(archivo)-1);
			read(archivo, entrada);

			// se sobreescribe el borrado
			seek(archivo, indiceBuscado);
			write(archivo, entrada);

			// se vuelve al final, listo para ser truncado
			seek(archivo, fileSize(archivo)-1);
		end;
	end;
	// corta el archivo en filePos()
	truncate(archivo);
end;

// PROGRAMA PRINCIPAL
const
	nombreArchivo = 'ej1_archivo.dat';
var
	nroBorrar : integer;
begin
	generarArchivo(nombreArchivo);

	write('Numero a borrar: ');
	readln(nroBorrar);
	writeln;
	
	borrarFisicamente(nroBorrar, nombreArchivo);

	writeln('FILTRADO:');
	imprimirArchivo(nombreArchivo);
end.