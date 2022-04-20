program catorce;
type
	tipoZonaFertil = 1..3;

function obtenerRendimientoPorHA(tipo : tipoZonaFertil) : real;
var
	rendimiento : real;
begin
	rendimiento := 0;
	case tipo of
	1: rendimiento := 6;
	2: rendimiento := 2.6;
	3: rendimiento := 1.4;
	end;
	obtenerRendimientoPorHA := rendimiento;
end;

function calcularGanancia(ha : integer; zona : tipoZonaFertil; precio : integer) : real;
var
	rendimientoHa : real;
begin
	rendimientoHa := obtenerRendimientoPorHA(zona);
	calcularGanancia := ha * rendimientoHa * precio;
end;

procedure leerCampo(var localidad : string; var hectareas : integer; var zona : tipoZonaFertil);
begin
	write('Localidad: ');
	readln(localidad);

	write('Cantidad de hectareas sembradas: ');
	readln(hectareas);

	write('Tipo de zona: ');
	readln(zona);

	writeln('---------------------------------');
end;

const
	PRECIO_SOJA = 320;
var
	localidad : string;
	cantHaSembradas : integer;
	zona : tipoZonaFertil;

	rendimiento : real;

	campos3FebConMas10000 : integer;

	maxRendimiento : real;
	localidadMaxRendimiento : string;

	minRendimiento : real;
	localidadMinRendimiento : string;

	cantCampos : integer;
	sumaTotalRendimiento : real;

	rendimientoPromedio : real;
begin
	campos3FebConMas10000 := 0;
	maxRendimiento := -1;
	minRendimiento := 999999;
	cantCampos := 0;
	sumaTotalRendimiento := 0;
	repeat
		leerCampo(localidad, cantHaSembradas, zona);
		rendimiento := calcularGanancia(cantHaSembradas, zona, PRECIO_SOJA);

		sumaTotalRendimiento := sumaTotalRendimiento + rendimiento;
		cantCampos := cantCampos + 1;

		if((localidad = 'tres de febrero') AND (rendimiento > 10000)) then
			campos3FebConMas10000 := campos3FebConMas10000 + 1;

		if(rendimiento > maxRendimiento) then
		begin
			maxRendimiento := rendimiento;
			localidadMaxRendimiento := localidad;
		end;

		if(rendimiento < minRendimiento) then
		begin
			minRendimiento := rendimiento;
			localidadMinRendimiento := localidad;
		end;
	until((localidad = 'saladillo') AND (cantHaSembradas = 900));

	writeln;
	writeln('Campos de Tres de Febrero con rendimiento superior a U$S 10.000: ', campos3FebConMas10000);
	writeln('Localidad con el campo de mayor rendimiento: ', localidadMaxRendimiento);
	writeln('Localidad con el campo de menor rendimiento: ', localidadMinRendimiento);
	rendimientoPromedio := sumaTotalRendimiento / cantCampos;
	writeln('Rendimiento promedio: U$S ', rendimientoPromedio);
end.