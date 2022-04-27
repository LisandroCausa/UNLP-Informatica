program ocho;
type
	t_docente = record
		DNI : string;
		nombre : string;
		apellido : string;
		email : string;
	end;
	
	t_proyecto = record
		codigo : integer;
		titulo : string;
		coordinador : t_docente;
		alumnos : integer;
		escuela : string;
		localidad : string;
	end;

procedure leerDocente(var docente : t_docente);
begin
	writeln;
	writeln('DOCENTE');
	write('DNI: ');
	readln(docente.DNI);
	write('Nombre: ');
	readln(docente.nombre);
	write('Apellido: ');
	readln(docente.apellido);
	write('email: ');
	readln(docente.email);
	writeln;
end;

procedure leerProyecto(var proyecto : t_proyecto);
begin
	write('Codigo: ');
	readln(proyecto.codigo);

	write('Titulo: ');
	readln(proyecto.titulo);
	
	leerDocente(proyecto.coordinador);

	write('Cantidad de alumnos: ');
	readln(proyecto.alumnos);

	write('Escuela: ');
	readln(proyecto.escuela);

	write('Localidad: ');
	readln(proyecto.localidad);
	writeln;
end;

procedure cantDigitosParesImpares(numero : integer; var impar, par : integer);
var
	digito : integer;
begin
	impar := 0;
	par := 0;
	while(numero <> 0) do
	begin
		digito := numero MOD 10;
		if(digito MOD 2 = 0) then
			par := par + 1
		else
			impar := impar + 1;
		numero := numero DIV 10;
	end;
end;

var
	proyecto : t_proyecto;
	localidad : string;
	escuela : string;

	cantEscuelasLoc : integer;
	cantTotalEscuelas : integer;

	cantAlumnosEscuela : integer;

	maxAlumnos1 : integer;
	nombreMaxAlumnos1 : string;
	maxAlumnos2 : integer;
	nombreMaxAlumnos2 : string;

	cantImpar : integer;
	cantPar : integer;
begin
	cantTotalEscuelas := 0;
	maxAlumnos1 := -1;
	maxAlumnos2 := -1;
	leerProyecto(proyecto);
	while(proyecto.codigo <> -1) do
	begin
		localidad := proyecto.localidad;
		cantEscuelasLoc := 0;
		while((localidad = proyecto.localidad) AND (proyecto.codigo <> -1)) do
		begin
			escuela := proyecto.escuela;
			cantEscuelasLoc := cantEscuelasLoc + 1;
			cantAlumnosEscuela := 0;
			while((escuela = proyecto.escuela) AND (localidad = proyecto.localidad) AND (proyecto.codigo <> -1)) do
			begin
				cantAlumnosEscuela := cantAlumnosEscuela + proyecto.alumnos;
				if(proyecto.localidad = 'daireaux') then
				begin
					cantDigitosParesImpares(proyecto.codigo, cantImpar, cantPar);
					if(cantImpar = cantPar) then
					begin
						writeln;
						writeln('EL PROYECTO ', proyecto.titulo, ' TIENE UN CODIGO CON IGUAL CANTIDAD DE DIGITOS PARES E IMPARES.');
						writeln;
					end;
				end;
				leerProyecto(proyecto);
			end;

			if(cantAlumnosEscuela >= maxAlumnos1) then
			begin
				maxAlumnos2 := maxAlumnos1;
				maxAlumnos1 := cantAlumnosEscuela;

				nombreMaxAlumnos2 := nombreMaxAlumnos1;
				nombreMaxAlumnos1 := escuela;
			end
			else if(cantAlumnosEscuela >= maxAlumnos2) then
			begin
				maxAlumnos2 := cantAlumnosEscuela;
				nombreMaxAlumnos2 := escuela;
			end;
		end;
		cantTotalEscuelas := cantTotalEscuelas + cantEscuelasLoc;
		writeln('Cantidad de escuelas en ', localidad, ': ', cantEscuelasLoc);
		writeln;
	end;
	writeln('Cantidad total de escuelas: ', cantTotalEscuelas);
	writeln('Las dos escuelas con mayor cantidad de alumnos participantes: ', nombreMaxAlumnos1, ' y ', nombreMaxAlumnos2);
end.