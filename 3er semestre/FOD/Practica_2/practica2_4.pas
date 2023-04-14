program practica2_4;
const
	N = 5; // número de archivos detalle
	VALOR_ALTO = 9999;
type
	str32 = string[32];
	t_fecha = record
		dia : integer;
		mes : integer;
		anio : integer;
	end;

	t_log = record
		cod_usuario : integer;
		fecha : t_fecha;
		tiempo_sesion : integer; // en minutos
	end;

	t_registro_dia = record
		cod_usuario : integer;
		fecha : t_fecha;
		tiempo_total_de_sesiones_abiertas : integer; // en minutos
	end;
	t_archivo = file of t_registro_dia;
	t_vector_detalles = array[1..N] of text;
	t_vector_logs = array[1..N] of t_log;


// devuelve True si la primera fecha es mas vieja que la segunda
function esMasVieja(f1, f2 : t_fecha) : boolean;
begin
	if(f1.anio = f2.anio) then
	begin
		if(f1.mes = f2.mes) then
		begin
			esMasVieja := f1.dia < f2.dia;
		end
		else
		begin
			esMasVieja := f1.mes < f2.mes;
		end;		
	end
	else
	begin
		esMasVieja := f1.anio < f2.anio;
	end;
end;

function mismaFecha(f1, f2 : t_fecha) : boolean;
begin
	mismaFecha := (
		(f1.dia = f2.dia) and
		(f1.mes = f2.mes) and
		(f1.anio = f2.anio)
	);
end;

procedure leerDetalle(var detalle : text; var dato : t_log);
begin
	if(not EOF(detalle)) then
		readln(detalle, dato.cod_usuario, dato.fecha.dia, dato.fecha.mes, dato.fecha.anio, dato.tiempo_sesion)
	else
		dato.cod_usuario := VALOR_ALTO;
end;

function indiceMinimo(vector : t_vector_logs) : integer;
var
	i : integer;
	indice : integer;
begin
	indice := 1;
	for i:=2 to N do
	begin
		if((vector[i].cod_usuario < vector[indice].cod_usuario)
		or 
		((vector[i].cod_usuario = vector[indice].cod_usuario)
		and esMasVieja(vector[i].fecha, vector[indice].fecha))) then
			indice := i;
	end;
	indiceMinimo := indice;
end;

procedure merge(nombreArchivoMaestro : str32; var detalles : t_vector_detalles);
var
	maestro : t_archivo;
	i : integer;
	logs : t_vector_logs;
	detalleMinimo : integer;
	regDetalle : t_log;
	actual : t_registro_dia;
begin
	assign(maestro, nombreArchivoMaestro);
	for i:=1 to N do
	begin
		reset(detalles[i]);
		leerDetalle(detalles[i], logs[i]);
	end;
	rewrite(maestro);
	detalleMinimo := indiceMinimo(logs);
	regDetalle := logs[detalleMinimo];
	leerDetalle(detalles[detalleMinimo], logs[detalleMinimo]);
	while(regDetalle.cod_usuario <> VALOR_ALTO) do
	begin
		actual.cod_usuario := regDetalle.cod_usuario;
		actual.fecha := regDetalle.fecha;
		actual.tiempo_total_de_sesiones_abiertas := 0;
		while((actual.cod_usuario = regDetalle.cod_usuario)
		     and mismaFecha(actual.fecha, regDetalle.fecha)) do
		begin
			actual.tiempo_total_de_sesiones_abiertas := actual.tiempo_total_de_sesiones_abiertas + regDetalle.tiempo_sesion;
			detalleMinimo := indiceMinimo(logs);
			regDetalle := logs[detalleMinimo];
			leerDetalle(detalles[detalleMinimo], logs[detalleMinimo]);
		end;
		write(maestro, actual);
	end;
	close(maestro);
	for i:=1 to N do
		close(detalles[i]);
end;

procedure imprimirRegistroDia(dato : t_registro_dia);
begin
	writeln('Codigo Usuario: ', dato.cod_usuario);
	writeln('Fecha: ', dato.fecha.dia, '/', dato.fecha.mes, '/', dato.fecha.anio);
	writeln('Tiempo total sesiones abiertas: ', dato.tiempo_total_de_sesiones_abiertas, 'm');
	writeln;
end;

procedure imprimirMaestro(nombreArchivoMaestro : str32);
var
	maestro : t_archivo;
	entrada : t_registro_dia;
begin
	assign(maestro, nombreArchivoMaestro);
	reset(maestro);
	while(not EOF(maestro)) do
	begin
		read(maestro, entrada);
		imprimirRegistroDia(entrada);
	end;
	close(maestro);
end;


// PROGRAMA PRINCIPAL
var
	nombreArchivoMaestro : str32;
	detalles : t_vector_detalles;
	i : integer;
	iString : string;
begin
	nombreArchivoMaestro := 'ej4_maestro.dat';
	for i:=1 to N do
	begin
		str(i, iString);
		assign(detalles[i], 'ej4_detalle'+iString+'.txt');
	end;
	merge(nombreArchivoMaestro, detalles);
	imprimirMaestro(nombreArchivoMaestro);
end.