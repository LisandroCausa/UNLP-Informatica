program siete;
const
	MATERIAS = 10;
type
	str20 = string[20];

	lista_notas = ^t_nota;
	t_nota = record
		valor : real;
		sig : lista_notas;
	end;

	t_alumno = record
		id : integer;
		nombre : str20;
		apellido : str20;
		email: string;
		ingreso : integer;
		egreso : integer;
		notas : lista_notas;
	end;

	lista_alumnos = ^nodo;
	nodo = record
		alumno : t_alumno;
		sig : lista_alumnos;
	end;


procedure agregarNota(valor : real; var L : lista_notas);
var
	nuevo : lista_notas;
	anterior : lista_notas;
	actual : lista_notas;
begin
	new(nuevo);
	nuevo^.valor := valor;
	anterior := L;
	actual := L;
	while((actual <> nil) and (actual^.valor > valor)) do
	begin
		anterior := actual;
		actual := actual^.sig;
	end;

	if(actual = anterior) then
		L := nuevo
	else
		anterior^.sig := nuevo;
	nuevo^.sig := actual;
end;

procedure cargarNotas(var L : lista_notas);
var
	i : integer;
	entrada : real;
begin
	writeln('NOTAS: ');
	for i:=1 to MATERIAS do
	begin
		readln(entrada);
		agregarNota(entrada, L);
	end;
	writeln;
end;

procedure leerAlumno(var alumno : t_alumno);
begin
	write('ID: ');
	readln(alumno.id);
	if(alumno.id <> -1) then
	begin
		write('Nombre: ');
		readln(alumno.nombre);

		write('Apellido: ');
		readln(alumno.apellido);

		write('Email: ');
		readln(alumno.email);

		write('Año ingreso: ');
		readln(alumno.ingreso);

		write('Año egreso: ');
		readln(alumno.egreso);

		alumno.notas := nil;
		cargarNotas(alumno.notas);
	end;
end;

procedure agregarAlumno(alumno : t_alumno; var L : lista_alumnos);
var
	nuevo : lista_alumnos;
begin
	new(nuevo);
	nuevo^.alumno := alumno;
	nuevo^.sig := L;
	L := nuevo;
end;

procedure cargarAlumnos(var L : lista_alumnos);
var
	entrada : t_alumno;
begin
	leerAlumno(entrada);
	while(entrada.id <> -1) do
	begin
		agregarAlumno(entrada, L);
		leerAlumno(entrada);
	end;
end;

function promedioNotas(notas : lista_notas) : real;
var
	cont : real;
begin
	cont := 0;
	while(notas <> nil) do
	begin
		cont := cont + notas^.valor;
		notas := notas^.sig;
	end;
	promedioNotas := cont / MATERIAS;
end;

function soloDigitosImpares(num : integer) : boolean;
var
	digito : integer;
	par : boolean;
begin
	par := false;
	while((num <> 0) and (par = false)) do
	begin
		digito := num MOD 10;
		if(digito MOD 2 = 0) then
			par := true;
		num := num DIV 10;
	end;
	soloDigitosImpares := not(par);
end;

function condicion2b(alumno : t_alumno) : boolean;
begin
	condicion2b := ((alumno.ingreso = 2012) and (soloDigitosImpares(alumno.id)));
end;

procedure punto2(L : lista_alumnos);
var
	cont2b : integer;
	alumnoMax1 : t_alumno;
	alumnoMax2 : t_alumno;
	max1 : integer;
	max2 : integer;
	tiempoRecibirse : integer;
begin
	cont2b := 0;
	max1 := 9999;
	max2 := 9999;
	while(L <> nil) do
	begin
		writeln('Promedio notas: ', (promedioNotas(L^.alumno.notas)):2:2);
		if(condicion2b(L^.alumno)) then
			cont2b := cont2b + 1;
		tiempoRecibirse := L^.alumno.egreso - L^.alumno.ingreso;
		if(tiempoRecibirse <= max1) then
		begin
			max2 := max1;
			max1 := tiempoRecibirse;
			alumnoMax2 := alumnoMax1;
			alumnoMax1 := L^.alumno;
		end
		else if(tiempoRecibirse <= max2) then
		begin
			max2 := tiempoRecibirse;
			alumnoMax2 := L^.alumno;
		end;
		L := L^.sig;
	end;
	writeln('Ingresantes 2012 con ID compuesto unicamente por digitos impares: ', cont2b);
	writeln('Los dos alumnos que tardaron menos año en recibirse:');
	writeln(alumnoMax1.apellido, ' ', alumnoMax1.nombre, ' ', alumnoMax1.email);
	writeln(alumnoMax2.apellido, ' ', alumnoMax2.nombre, ' ', alumnoMax2.email);
end;

procedure buscarYEliminar(id : integer; var L : lista_alumnos);
var
	anterior : lista_alumnos;
	actual : lista_alumnos;
begin
	anterior := L;
	actual := L;
	while((actual <> nil) and (actual^.alumno.id <> id)) do
	begin
		anterior := actual;
		actual := actual^.sig;
	end;
	if(actual <> nil) then
	begin
		if(actual = anterior) then
			L := L^.sig
		else
			anterior^.sig := actual^.sig;
		dispose(actual);
	end;
end;

// PROGRAMA PRINCIPAL
var
	alumnos : lista_alumnos;
	entrada : integer;
begin
	cargarAlumnos(alumnos);
	punto2(alumnos);
	readln(entrada);
	buscarYEliminar(entrada, alumnos);
end.