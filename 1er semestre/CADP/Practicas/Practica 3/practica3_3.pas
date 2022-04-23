program tres;
type
	escuela = record
		CUE			: integer;
		nombre		: string;
		cantDocentes: integer;
		cantAlumnos	: integer;
		localidad	: string;
	end;

procedure leerEscuela(var variable : escuela);
begin
	write('CUE: ');
	readln(variable.CUE);
	write('Nombre: ');
	readln(variable.nombre);
	write('Cantidad de docentes: ');
	readln(variable.cantDocentes);
	write('Cantidad de alumnos: ');
	readln(variable.cantAlumnos);
	write('Localidad: ');
	readln(variable.localidad);
	writeln('--------------------');
end;

function relacionDocenteAlumno(docentes : integer; alumnos : integer) : real;
begin
	relacionDocenteAlumno := alumnos / docentes;
end;

function esRelacionSuperior(_escuela : escuela; localidadBuscada : string; relacionSugerida : real) : boolean;
var
	estado : boolean;
	relacion : real;
begin
	estado := false;
	if(_escuela.localidad = localidadBuscada) then
	begin
		relacion := relacionDocenteAlumno(_escuela.cantDocentes, _escuela.cantAlumnos);
		if(relacion > relacionSugerida) then
			estado := true;
	end;
	esRelacionSuperior := estado;
end;

procedure actualizarMinRelacion(_escuela : escuela; var cue1 : integer; var nombre1 : string; var min1 : real; var cue2 : integer; var nombre2 : string; var min2 : real);
var
	relacion : real;
begin
	relacion := relacionDocenteAlumno(_escuela.cantDocentes, _escuela.cantAlumnos);
	if(relacion <= min1) then
	begin
		cue2 := cue1;
		nombre2 := nombre1;
		min2 := min1;

		cue1 := _escuela.CUE;
		nombre1 := _escuela.nombre;
		min1 := relacion;
	end
	else if(relacion <= min2) then
	begin
		cue2 := _escuela.CUE;
		nombre2 := _escuela.nombre;
		min2 := relacion;
	end;
end;

const
	CANTIDAD_DE_ESCUELAS = 2400;
	RELACION_SUGERIDA_UNESCO = 23.435;
var
	i : integer;
	entrada : escuela;

	cantCondicionesLaPlata : integer;

	cueMinRelacion1 : integer;
	nombreMinRelacion1 : string;
	minRelacion1 : real;

	cueMinRelacion2 : integer;
	nombreMinRelacion2 : string;
	minRelacion2 : real;
begin
	cantCondicionesLaPlata := 0;
	minRelacion1 := 9999;
	minRelacion2 := 9999;
	for i:=1 to CANTIDAD_DE_ESCUELAS do
	begin
		leerEscuela(entrada);
		if(esRelacionSuperior(entrada, 'la plata', RELACION_SUGERIDA_UNESCO)) then
			cantCondicionesLaPlata := cantCondicionesLaPlata + 1;
		actualizarMinRelacion(entrada, cueMinRelacion1, nombreMinRelacion1, minRelacion1, cueMinRelacion2, nombreMinRelacion2, minRelacion2);
	end;
	writeln('Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO: ', cantCondicionesLaPlata);
	writeln('Las 2 escuelas con mejor relación entre docentes y alumnos: ');
	writeln(cueMinRelacion1, ' ', nombreMinRelacion1);
	writeln(cueMinRelacion2, ' ', nombreMinRelacion2);
end.