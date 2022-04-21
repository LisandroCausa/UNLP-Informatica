program Registros;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;
procedure leer(var alu : alumno);
begin
	write('Ingrese el código del alumno ');
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
		write('Ingrese el nombre del alumno '); readln(alu.nombre);
		write('Ingrese el promedio del alumno '); readln(alu.promedio);
	end;
end;
{ declaración de variables del programa principal }
var
	a : alumno;
	cantAlumnos : integer;
	maxPromedio : real;
	nombreMaxPromedio : str20;
{ cuerpo del programa principal }
begin
	cantAlumnos := 0;
	maxPromedio := -1;
	nombreMaxPromedio := 'Nadie';
	leer(a);
	while(a.codigo <> 0) do
	begin
		cantAlumnos := cantAlumnos + 1;
		if(a.promedio > maxPromedio) then
		begin
			maxPromedio := a.promedio;
			nombreMaxPromedio := a.nombre;
		end;
		leer(a);
	end;
	writeln('Cantidad de alumnos leidos: ', cantAlumnos);
	writeln('El alumno con mejor promedio fue: ', nombreMaxPromedio);
end.