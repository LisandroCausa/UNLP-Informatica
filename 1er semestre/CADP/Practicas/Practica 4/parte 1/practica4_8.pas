program ocho;
const
	N = 400;
type
	t_alumno = record
		DNI			: integer;
		nombre		: string;
		apellido	: string;
		nacimiento	: integer;
	end;
	vector = array[1..N] of t_alumno;

procedure leerAlumno(var alumno : t_alumno);
begin
	write('DNI: ');
	readln(alumno.DNI);

	write('Nombre: ');
	readln(alumno.nombre);

	write('Apellido: ');
	readln(alumno.apellido);

	write('Año de nacimiento: ');
	readln(alumno.nacimiento);
	writeln;
end;

function esPar(num : integer) : boolean;
begin
	esPar := (num MOD 2 = 0);
end;

function soloDigitosPares(DNI : integer) : boolean;
var
	estado : boolean;
	digito : integer;
begin
	estado := true;
	while(DNI <> 0) do
	begin
		digito := DNI MOD 10;
		DNI := DNI DIV 10;
		if(NOT(esPar(digito))) then
		begin
			estado := false;
			DNI := 0;
		end;
	end;
	soloDigitosPares := estado;
end;

var
	alumnos : vector;
	i : integer;
	cantAlumnosDNIDigPares : integer;
	porcentajeAlumnosDNIDigPares : real;
	alumnoMayorEdad1 : t_alumno;
	alumnoMayorEdad2 : t_alumno;
begin
	for i:=1 to N do
		leerAlumno(alumnos[i]);

	cantAlumnosDNIDigPares := 0;
	alumnoMayorEdad1.nacimiento := 2020;
	alumnoMayorEdad2.nacimiento := 2020;
	for i:=1 to N do
	begin
		if(soloDigitosPares(alumnos[i].DNI)) then
			cantAlumnosDNIDigPares := cantAlumnosDNIDigPares + 1;
		
		if(alumnos[i].nacimiento <= alumnoMayorEdad1.nacimiento) then
		begin
			alumnoMayorEdad2 := alumnoMayorEdad1;
			alumnoMayorEdad1 := alumnos[i];
		end
		else if(alumnos[i].nacimiento <= alumnoMayorEdad2.nacimiento) then
		begin
			alumnoMayorEdad2 := alumnos[i];
		end;
	end;
	porcentajeAlumnosDNIDigPares := (cantAlumnosDNIDigPares*100) / N;
	writeln('Porcentaje de alumnos con DNI compuesto solo por digitos pares: %', porcentajeAlumnosDNIDigPares:2:2);
	writeln('Nombres de los 2 alumnos de mayor edad:');
	writeln(alumnoMayorEdad1.nombre, ' ', alumnoMayorEdad1.apellido);
	writeln(alumnoMayorEdad2.nombre, ' ', alumnoMayorEdad2.apellido);
end.