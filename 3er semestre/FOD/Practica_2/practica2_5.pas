program practica2_5;
const
	N_DELEGACIONES = 50;
	VALOR_CORTE = -1;
type
	str16 = string[16];
	str64 = string[64];
	
	t_persona = record
		nombre : str16;
		apellido : str16;
		DNI : str16;
	end;
	
	t_nacimiento = record
		nro : integer;
		nombre : str16;
		apellido : str16;
		direccion : str64;
		matriculaMedico : integer;
		madre : t_persona;
		padre : t_persona;
	end;

	t_fallecimiento = record
		nro : integer;
		persona : t_persona;
		matriculaMedico : integer;
		fechaHora : str16;
		lugar : str64;
	end;

	t_reg_maestro = record
		nacimiento : t_nacimiento;
		fallecio : boolean;
		matriculaMedicoMuerte : integer;
		fechaHoraMuerte : str16;
		lugarMuerte : str64;
	end;

	t_archivo_nacimiento = file of t_nacimiento;
	t_archivo_fallecimiento = file of t_fallecimiento;
	t_archivo_maestro = file of t_reg_maestro;

	t_delegacion = record
		detalleNacimientos : t_archivo_nacimiento;
		detalleFallecimientos : t_archivo_fallecimiento;
	end;
	t_array_delegaciones = array[1..N_DELEGACIONES] of t_delegacion;
	t_array_nacimientos = array[1..N_DELEGACIONES] of t_nacimiento;
	t_array_fallecimientos = array[1..N_DELEGACIONES] of t_fallecimiento;


procedure leerNacimiento(var archivo : t_archivo_nacimiento; var dato : t_nacimiento);
begin
	if(not EOF(archivo)) then
		read(archivo, dato)
	else
		dato.nro := VALOR_CORTE;
end;

procedure leerFallecimiento(var archivo : t_archivo_fallecimiento; var dato : t_fallecimiento);
begin
	if(not EOF(archivo)) then
		read(archivo, dato)
	else
		dato.nro := VALOR_CORTE;
end;

function indiceMinimoNacimiento(nacimientos : t_array_nacimientos) : integer;
var
	i : integer;
	valorMinimo : integer;
	indiceMinimo : integer;
begin
	valorMinimo := 9999;
	indiceMinimo := -1;
	for i:=1 to N_DELEGACIONES do
	begin
		if((nacimientos[i].nro <> VALOR_CORTE) and (nacimientos[i].nro < valorMinimo)) then
		begin
			indiceMinimo := i;
			valorMinimo := nacimientos[indiceMinimo].nro;
		end;
	end;
	indiceMinimoNacimiento := indiceMinimo;
end;

function indiceMinimoFallecimiento(fallecimientos : t_array_fallecimientos) : integer;
var
	i : integer;
	valorMinimo : integer;
	indiceMinimo : integer;
begin
	valorMinimo := 9999;
	indiceMinimo := -1;
	for i:=1 to N_DELEGACIONES do
	begin
		if((fallecimientos[i].nro <> VALOR_CORTE) and (fallecimientos[i].nro < valorMinimo)) then
		begin
			indiceMinimo := i;
			valorMinimo := fallecimientos[indiceMinimo].nro;
		end;
	end;
	indiceMinimoFallecimiento := indiceMinimo;
end;

procedure crearMaestro(delegaciones : t_array_delegaciones; nombreArchivoMaestro : str16);
var
	maestro : t_archivo_maestro;
	i : integer;
	actualNacimientos : t_array_nacimientos;
	actualFallecimientos : t_array_fallecimientos;
	indiceMinNac : integer;
	indiceMinFall : integer;
	regMaestroSalida : t_reg_maestro;
begin
	assign(maestro, nombreArchivoMaestro);
	rewrite(maestro);

	for i:=1 to N_DELEGACIONES do
	begin
		reset(delegaciones[i].detalleNacimientos);
		leerNacimiento(delegaciones[i].detalleNacimientos, actualNacimientos[i]);

		reset(delegaciones[i].detalleFallecimientos);
		leerFallecimiento(delegaciones[i].detalleFallecimientos, actualFallecimientos[i]);
	end;

	indiceMinNac := indiceMinimoNacimiento(actualNacimientos);
	indiceMinFall := indiceMinimoFallecimiento(actualFallecimientos);
	while((indiceMinNac <> -1) or (indiceMinFall <> -1)) do
	begin
		if((indiceMinFall = -1) or 
		((indiceMinNac <> -1) and (actualNacimientos[indiceMinNac].nro <= actualFallecimientos[indiceMinFall].nro))) then
		begin
			// escribir nacimiento
			regMaestroSalida.nacimiento := actualNacimientos[indiceMinNac];
			regMaestroSalida.fallecio := false;
			write(maestro, regMaestroSalida);

			leerNacimiento(delegaciones[indiceMinNac].detalleNacimientos, actualNacimientos[indiceMinNac]);
			indiceMinNac := indiceMinimoNacimiento(actualNacimientos);
		end
		else
		begin
			// escribir fallecimiento
			seek(maestro, filepos(maestro)-1);
			read(maestro, regMaestroSalida);
			if(regMaestroSalida.nacimiento.nro = actualFallecimientos[indiceMinFall].nro) then
			begin
				regMaestroSalida.fallecio := true;
				regMaestroSalida.matriculaMedicoMuerte := actualFallecimientos[indiceMinFall].matriculaMedico;
				regMaestroSalida.fechaHoraMuerte := actualFallecimientos[indiceMinFall].fechaHora;
				regMaestroSalida.lugarMuerte := actualFallecimientos[indiceMinFall].lugar;
			end
			else
			begin
				writeln('Alerta: NRO DE FALLECIMIENTO NO ENCONTRADO.');
			end;
			seek(maestro, filepos(maestro)-1);
			write(maestro, regMaestroSalida);

			leerFallecimiento(delegaciones[indiceMinFall].detalleFallecimientos, actualFallecimientos[indiceMinFall]);
			indiceMinFall := indiceMinimoFallecimiento(actualFallecimientos);
		end;
	end;
	close(maestro);
	for i:=1 to N_DELEGACIONES do
	begin
		close(delegaciones[i].detalleNacimientos);
		close(delegaciones[i].detalleFallecimientos);
	end;
end;

procedure leerPersona(var persona : t_persona);
begin
	write('Nombre: ');
	readln(persona.nombre);
	write('Apellido: ');
	readln(persona.apellido);
	write('Dni: ');
	readln(persona.DNI);
	writeln;
end;

procedure imprimirPersona(persona : t_persona);
begin
	writeln('Nombre: ', persona.nombre);
	writeln('Apellido: ', persona.apellido);
	writeln('Dni: ', persona.DNI);
	writeln;
end;

procedure leerNacimiento(var nacimiento : t_nacimiento);
begin
	write('Nro: ');
	readln(nacimiento.nro);
	if(nacimiento.nro <> VALOR_CORTE) then
	begin
		write('Nombre: ');
		readln(nacimiento.nombre);
		write('Apellido: ');
		readln(nacimiento.apellido);
		write('Direccion: ');
		readln(nacimiento.direccion);
		write('Matriculamedico: ');
		readln(nacimiento.matriculaMedico);
		writeln('Madre:');
		leerPersona(nacimiento.madre);
		writeln('Padre:');
		leerPersona(nacimiento.padre);
	end;
	writeln;
end;

procedure imprimirNacimiento(nacimiento : t_nacimiento);
begin
	writeln('Nro: ', nacimiento.nro);
	writeln('Nombre: ', nacimiento.nombre);
	writeln('Apellido: ', nacimiento.apellido);
	writeln('Direccion: ', nacimiento.direccion);
	writeln('Matriculamedico: ', nacimiento.matriculaMedico);
	writeln('Madre: ');
	imprimirPersona(nacimiento.madre);
	writeln('Padre: ');
	imprimirPersona(nacimiento.padre);
	writeln;
end;

procedure imprimirReg_maestro(reg_maestro : t_reg_maestro);
begin
	writeln('Nacimiento: ');
	imprimirNacimiento(reg_maestro.nacimiento);
	writeln('Fallecio: ', reg_maestro.fallecio);
	writeln('Matriculamedicomuerte: ', reg_maestro.matriculaMedicoMuerte);
	writeln('Fechahoramuerte: ', reg_maestro.fechaHoraMuerte);
	writeln('Lugarmuerte: ', reg_maestro.lugarMuerte);
	writeln;
end;

procedure imprimirMaestro(nombreArchivoMaestro : str64);
var
	maestro : t_archivo_maestro;
	reg_maestro : t_reg_maestro;
begin
	assign(maestro, nombreArchivoMaestro);
	reset(maestro);
	while(not EOF(maestro)) do
	begin
		read(maestro, reg_maestro);
		imprimirReg_maestro(reg_maestro);
	end;
	close(maestro);
end;

procedure leerFallecimiento(var fallecimiento : t_fallecimiento);
begin
	write('Nro: ');
	readln(fallecimiento.nro);
	if(fallecimiento.nro <> VALOR_CORTE) then
	begin
		writeln('Persona:');
		leerPersona(fallecimiento.persona);
		write('Matriculamedico: ');
		readln(fallecimiento.matriculaMedico);
		write('Fechahora: ');
		readln(fallecimiento.fechaHora);
		write('Lugar: ');
		readln(fallecimiento.lugar);
	end;
	writeln;
end;

procedure imprimirFallecimiento(fallecimiento : t_fallecimiento);
begin
	writeln('MUERTE');
	writeln('Nro: ', fallecimiento.nro);
	writeln('Persona');
	imprimirPersona(fallecimiento.persona);
	writeln('Matricula Medico: ', fallecimiento.matriculaMedico);
	writeln('Fechahora: ', fallecimiento.fechaHora);
	writeln('Lugar: ', fallecimiento.lugar);
	writeln;
end;

procedure imprimirDelegacion(delegacion : t_delegacion);
var
	nacimiento : t_nacimiento;
	fallecimiento : t_fallecimiento;
begin
	writeln('-----------------------------------------------------------------');

	reset(delegacion.detalleNacimientos);
	while(not EOF(delegacion.detalleNacimientos)) do
	begin
		read(delegacion.detalleNacimientos, nacimiento);
		imprimirNacimiento(nacimiento);
	end;
	close(delegacion.detalleNacimientos);

	reset(delegacion.detalleFallecimientos);
	while(not EOF(delegacion.detalleFallecimientos)) do
	begin
		read(delegacion.detalleFallecimientos, fallecimiento);
		imprimirFallecimiento(fallecimiento);
	end;
	close(delegacion.detalleFallecimientos);
end;

procedure generarArchivoNacimiento(var archivoNac: t_archivo_nacimiento);
var
	nacimiento: t_nacimiento;
begin
	writeln('NACIMIENTOS:');
	rewrite(archivoNac);
	leerNacimiento(nacimiento);
	while(nacimiento.nro <> VALOR_CORTE) do
	begin
		write(archivoNac, nacimiento);
		leerNacimiento(nacimiento);
	end;
	close(archivoNac);
end;

procedure generarArchivoFallecimiento(var archivoFal: t_archivo_fallecimiento);
var
	fallecimiento: t_fallecimiento;
begin
	writeln('FALLECIMIENTOS:');
	rewrite(archivoFal);
	leerFallecimiento(fallecimiento);
	while(fallecimiento.nro <> VALOR_CORTE) do
	begin
		write(archivoFal, fallecimiento);
		leerFallecimiento(fallecimiento);
	end;
	close(archivoFal);
end;

procedure generarDelegacion(var delegacion: t_delegacion);
begin
	generarArchivoNacimiento(delegacion.detalleNacimientos);
	generarArchivoFallecimiento(delegacion.detalleFallecimientos);
end;


// PROGRAMA PRINCIPAL
const
	NOMBRE_ARCHIVO_MAESTRO = 'ej5_maestro.dat';
var
	i : integer;
	iString : str16;
	delegaciones : t_array_delegaciones;
begin
	for i:=1 to N_DELEGACIONES do
	begin
		str(i, iString);
		assign(delegaciones[i].detalleNacimientos, 'nacimientos' + iString + '.dat');
		assign(delegaciones[i].detalleFallecimientos, 'fallecimientos' + iString + '.dat');
		//generarDelegacion(delegaciones[i]);
		//imprimirDelegacion(delegaciones[i]);
	end;
	crearMaestro(delegaciones, NOMBRE_ARCHIVO_MAESTRO);
	imprimirMaestro(NOMBRE_ARCHIVO_MAESTRO);
end.