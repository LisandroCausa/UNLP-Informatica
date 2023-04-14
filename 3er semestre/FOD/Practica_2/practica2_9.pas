program practica2_9;
const
	VALOR_ALTO = 9999;
type
	t_registro = record
		provincia : integer;
		localidad : integer;
		mesa : integer;
		votos : integer;
	end;

	t_archivo = file of t_registro;

procedure generarRegistro(var registro : t_registro);
begin
	write('Provincia: ');
	readln(registro.provincia);
	if(registro.provincia <> -1) then
	begin
		write('Localidad: ');
		readln(registro.localidad);
		write('Mesa: ');
		readln(registro.mesa);
		write('Votos: ');
		readln(registro.votos);
	end;
	writeln;
end;

procedure generarArchivo(var archivo : t_archivo);
var
	entrada : t_registro;
begin
	rewrite(archivo);
	generarRegistro(entrada);
	while(entrada.provincia <> -1) do
	begin
		write(archivo, entrada);
		generarRegistro(entrada);
	end;
	close(archivo);
	writeln('------------------------------------------------------');
end;

procedure leerRegistro(var archivo : t_archivo; var registro : t_registro);
begin
	if(not EOF(archivo)) then
		read(archivo, registro)
	else
		registro.provincia := VALOR_ALTO;
end;

// PROGRAMA PRINCIPAL
var
	archivo : t_archivo;
	entrada : t_registro;
	
	actualLocalidad : integer;
	actualProvincia : integer;
	
	totalLocalidad : integer;
	totalProvincia : integer;
	totalVotos : integer;
begin
	assign(archivo, 'ej9_archivo.dat');

	//generarArchivo(archivo);

	totalVotos := 0;
	reset(archivo);
	leerRegistro(archivo, entrada);
	while(entrada.provincia <> VALOR_ALTO) do
	begin
		actualProvincia := entrada.provincia;
		totalProvincia := 0;
		writeln('Codigo de Provincia: ', actualProvincia);
		while(entrada.provincia = actualProvincia) do
		begin
			actualLocalidad := entrada.localidad;
			totalLocalidad := 0;
			while((entrada.localidad = actualLocalidad) and (entrada.provincia = actualProvincia)) do
			begin
				totalLocalidad := totalLocalidad + entrada.votos;
				leerRegistro(archivo, entrada);
			end;
			writeln('Codigo de Localidad: ', actualLocalidad, '    Total de Votos: ', totalLocalidad);
			totalProvincia := totalProvincia + totalLocalidad;
		end;
		writeln('Total de Votos Provincia: ', totalProvincia);
		writeln;
		totalVotos := totalVotos + totalProvincia;
	end;
	writeln('Total General de Votos: ', totalVotos);
	close(archivo);
end.