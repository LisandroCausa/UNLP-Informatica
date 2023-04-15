program practica3_2;
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
		if(entrada.apellido[1] <> '@') then
			imprimirAsistente(entrada);
	end;
	close(archivo);
end;

procedure filtrarConNumeroMenorA(nro : integer; nombreArchivo : str64);
var
	archivo : t_archivo;
	entrada : t_asistente;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);
	while(not EOF(archivo)) do
	begin
		read(archivo, entrada);
		if(entrada.nro < nro) then
		begin
			entrada.apellido := '@' + entrada.apellido;
			seek(archivo, filePos(archivo)-1);
			write(archivo, entrada);
		end;
	end;
	close(archivo);
end;

// PROGRAMA PRINCIPAL
const
	nombreArchivo = 'ej2_archivo.dat';
begin
	generarArchivo(nombreArchivo);
	filtrarConNumeroMenorA(1000, nombreArchivo);
	writeln('FILTRADO:');
	imprimirArchivo(nombreArchivo);
end.