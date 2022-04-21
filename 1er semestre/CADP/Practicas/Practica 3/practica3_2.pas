program dos;
type
	fecha = record
		day : integer;
		month : integer;
		year : integer;
	end;

procedure leerFecha(var variable : fecha);
begin
	write('Dia: ');
	readln(variable.day);
	write('Mes: ');
	readln(variable.month);
	write('Año: ');
	readln(variable.year);
	writeln('--------------------');
end;

var
	casamiento : fecha;
	cantVerano : integer;
	cantPrimeros10 : integer;
begin
	cantVerano := 0;
	cantPrimeros10 := 0;
	leerFecha(casamiento);
	while(casamiento.year < 2020) do
	begin
		if((casamiento.month >= 1) AND (casamiento.month <= 3)) then
			cantVerano := cantVerano + 1;
		if((casamiento.day >= 1) AND (casamiento.day <= 10)) then
			cantPrimeros10 := cantPrimeros10 + 1;
		leerFecha(casamiento);
	end;
	writeln('Casamientos en verano: ', cantVerano);
	writeln('Casamientos en los primeros 10 dias de cada mes: ', cantPrimeros10);
end.