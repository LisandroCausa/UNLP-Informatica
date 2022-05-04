program trece;
const
	N_LUGARES = 100;
type
	t_lugares = array[1..N_LUGARES] of real;
	t_anio = record
		n_anio : integer;
		lugares : t_lugares;
		temperaturaPromedio : real;
	end;
	t_medioSiglo = array[1..50] of t_anio;

procedure leerTemperatura(var temperatura : real);
begin
	write('Temperatura: ');
	readln(temperatura);
end;

procedure leerAnio(var anio : t_anio; num : integer);
var
	i : integer;
	sumaTemps : real;
begin
	sumaTemps := 0;
	writeln('Año ', num);
	for i:=1 to N_LUGARES do
	begin
		write('Lugar ', i, ' ');
		leerTemperatura(anio.lugares[i]);
		sumaTemps := sumaTemps + anio.lugares[i];
	end;
	writeln;
	anio.temperaturaPromedio := sumaTemps / N_LUGARES;
	anio.n_anio := num;
end;

procedure cargarDatos(var medioSiglo : t_medioSiglo);
var
	i : integer;
begin
	for i:=1 to 50 do
		leerAnio(medioSiglo[i], i);
end;


var
	medioSiglo : t_medioSiglo;
	anioMayorTempPromedio : t_anio;
	anioMayorTempDetectada : t_anio;
	maxTemp : real;
	i, j : integer;
begin
	cargarDatos(medioSiglo);
	anioMayorTempPromedio.temperaturaPromedio := -1;
	maxTemp := -1;
	for i:=1 to 50 do
	begin
		if(medioSiglo[i].temperaturaPromedio >= anioMayorTempPromedio.temperaturaPromedio) then
			anioMayorTempPromedio := medioSiglo[i];
		for j:=1 to N_LUGARES do
		begin
			if(medioSiglo[i].lugares[j] > maxTemp) then
			begin
				maxTemp := medioSiglo[i].lugares[j];
				anioMayorTempDetectada := medioSiglo[i];
			end;
		end;
	end;
	writeln('Año con mayor temperatura promedio a nivel mundial: ', anioMayorTempPromedio.n_anio);
	writeln('Año con la mayor temperature detectada en algun punto del planeta: ', anioMayorTempDetectada.n_anio);
end.