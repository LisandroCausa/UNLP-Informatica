program cuatro;
const
	N = 1000;
type
	t_alumno = record
		ID : integer;
		apellido : string;
		nombre : string;
		asistencias : integer;
	end;
	vectorAlumnos = array[1..N] of t_alumno;

procedure leerAlumno(var alum:t_alumno);
begin
	write('ID: ');
	readln(alum.ID);

	write('Apellido: ');
	readln(alum.apellido);

	write('Nombre: ');
	readln(alum.nombre);
	
	write('Asistencias: ');
	readln(alum.asistencias);
	writeln;
end;

procedure cargarDatos(var v:vectorAlumnos; var dimL:integer);
var
	i : integer;
	alumno : t_alumno;
begin
	i := 0;
	leerAlumno(alumno);
	while((alumno.ID > 0) AND (i < N)) do
	begin
		i := i + 1;
		v[i] := alumno;
		leerAlumno(alumno);
	end;
	writeln('------------------');
	dimL := i;
end;

function indiceDe(numAlumno:integer; v:vectorAlumnos; dimL:integer) : integer;
var
	i : integer;
	encontro : boolean;
begin
	encontro := false;
	i := 0;
	repeat
		i := i + 1;
		if(v[i].ID = numAlumno) then
			encontro := true;
	until((encontro) OR (i >= dimL));
	indiceDe := i;
end;

procedure agregarElemento(alum : t_alumno; var v:vectorAlumnos; var dimL:integer);
begin
	if(dimL < N) then
	begin
		dimL := dimL + 1;
		v[dimL] := alum;
	end;
end;

procedure eliminarElemento(indice:integer; var v:vectorAlumnos; var dimL:integer);
var
	i : integer;
begin
	if(indice <= dimL) then
	begin
		dimL := dimL - 1;
		for i:=indice to dimL do
			v[i] := v[i+1];
	end;
end;

procedure eliminarPorNroAlumno(nroAlumno:integer; var v:vectorAlumnos; var dimL:integer);
var
	indice : integer;
begin
	indice := indiceDe(nroAlumno, v, dimL);
	eliminarElemento(indice, v, dimL);
end;

procedure eliminarAusentes(var v:vectorAlumnos; var dimL:integer);
var
	i : integer;
	eliminados : integer;
begin
	eliminados := 0;
	for i:=1 to dimL do
	begin
		while(((i + eliminados) <= dimL) AND (v[i + eliminados].asistencias = 0)) do
			eliminados := eliminados + 1;
		if((i + eliminados) <= dimL) then
			v[i] := v[i + eliminados];
	end;
	dimL := dimL - eliminados;
end;

procedure imprimirVector(v:vectorAlumnos; dimL:integer);
var
	i : integer;
begin
	writeln;
	for i:=1 to dimL do
		writeln(v[i].ID, ' ', v[i].apellido, ' ', v[i].nombre, ' ', v[i].asistencias);
end;


var
	alumnos : vectorAlumnos;
	dimL : integer;
	entrada : integer;
	alum : t_alumno;
begin
	cargarDatos(alumnos, dimL); // Datos que ya se disponen
	
	readln(entrada);
	writeln(indiceDe(entrada, alumnos, dimL));

	leerAlumno(alum);
	agregarElemento(alum, alumnos, dimL);

	readln(entrada);
	eliminarElemento(entrada, alumnos, dimL);

	readln(entrada);
	eliminarPorNroAlumno(entrada, alumnos, dimL);

	eliminarAusentes(alumnos, dimL);

	imprimirVector(alumnos, dimL);
end.