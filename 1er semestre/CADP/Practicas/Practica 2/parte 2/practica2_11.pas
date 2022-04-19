program once;
procedure leerDatos(var numero_inscripcion : integer; var apellido, nombre : string);
begin
	write('Numero de inscripcion: ');
	readln(numero_inscripcion);
	write('Apellido: ');
	readln(apellido);
	write('Nombre: ');
	readln(nombre);
end;

function esPar(numero : integer) : boolean;
begin
	esPar := (numero MOD 2 = 0);
end;

procedure actualizarMinID(id : integer; apellido : string; var idMin1, idMin2 : integer; var apellidoMin1, apellidoMin2 : string);
begin
	if(id <= idMin1) then
	begin
		idMin2 := idMin1;
		idMin1 := id;

		apellidoMin2 := apellidoMin1;
		apellidoMin1 := apellido;
	end
	else if(id <= idMin2) then
	begin
		idMin2 := id;
		apellidoMin2 := apellido;
	end;
end;

procedure actualizarMaxID(id : integer; nombre : string; var idMax1, idMax2 : integer; var nombreMax1, nombreMax2 : string);
begin
	if(id >= idMax1) then
	begin
		idMax2 := idMax1;
		idMax1 := id;

		nombreMax2 := nombreMax1;
		nombreMax1 := nombre;
	end
	else if(id >= idMax2) then
	begin
		idMax2 := id;
		nombreMax2 := nombre;
	end;
end;

var
	ID				: integer;
	apellido		: string;
	nombre			: string;

	apellidoIDMin1	: string;
	IDMin1			: integer;
	apellidoIDMin2	: string;
	IDMin2			: integer;

	nombreIDMax1	: string;
	IDMax1			: integer;
	nombreIDMax2	: string;
	IDMax2			: integer;

	cantAlumnosIDPar: integer;
	cantAlumnos		: integer;
	porcentajeAlumnosIDPar : real;
begin
	IDMin1 := 9999;
	idMin2 := 9999;
	IDMax1 := -1;
	IDMax2 := -1;
	cantAlumnosIDPar := 0;
	cantAlumnos := 0;
	repeat
		leerDatos(ID, apellido, nombre);
		cantAlumnos := cantAlumnos + 1;
		actualizarMinID(ID, apellido, IDMin1, IDMin2, apellidoIDMin1, apellidoIDMin2);
		actualizarMaxID(ID, nombre, IDMax1, IDMax2, nombreIDMax1, nombreIDMax2);
		if(esPar(ID)) then
			cantAlumnosIDPar := cantAlumnosIDPar + 1;
	until(ID = 1200);
	writeln('Apellidos de los numeros de inscripcion mas chicos: ', apellidoIDMin1, ' ', apellidoIDMin2);
	writeln('Nombres de los numeros de inscripcion mas grandes: ', nombreIDMax1, ' ', nombreIDMax2);
	porcentajeAlumnosIDPar := (cantAlumnosIDPar*100) / cantAlumnos;
	writeln('Porcentaje de numeros de inscripcion par: %', porcentajeAlumnosIDPar);
end.