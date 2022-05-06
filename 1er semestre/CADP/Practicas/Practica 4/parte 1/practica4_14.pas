program catorce;
const
	N_PROYECTOS = 1000;
type
	t_rol = 1..5;
	t_proyecto = record
		ID : integer;
		nombre : string;
	end;
	t_dev = record
		pais : string;
		proyecto : t_proyecto;
		rol : t_rol;
		horas : integer;
	end;

	vectorR = array[1..N_PROYECTOS] of real;
	vectorI = array[1..N_PROYECTOS] of integer;

procedure leerDev(var dev : t_dev);
begin
	write('Pais: ');
	readln(dev.pais);

	write('Codigo de proyecto: ');
	readln(dev.proyecto.ID);
	if(dev.proyecto.ID <> -1) then
	begin
		write('Nombre de proyecto: ');
		readln(dev.proyecto.nombre);
		
		write('Rol: ');
		readln(dev.rol);

		write('Horas: ');
		readln(dev.horas);
	end;
	writeln;
end;

function obtenerPago(dev : t_dev) : real;
var
	valorHora : real;
begin
	valorHora := 0;
	case dev.rol of
	1: valorHora := 35.20;
	2: valorHora := 27.45;
	3: valorHora := 31.03;
	4: valorHora := 44.28;
	5: valorHora := 39.87;
	end;
	obtenerPago := dev.horas * valorHora;
end;

function indiceDelMinimo(arr : vectorR) : integer;
var
	i : integer;
	min : real;
	indice : integer;
begin
	min := 99999;
	for i:=1 to N_PROYECTOS do
	begin
		if(arr[i] < min) then
		begin
			min := arr[i];
			indice := i;
		end;
	end;
	indiceDelMinimo := indice;
end;


var
	dev : t_dev;
	pago : real;
	invertidoEnArgentinos : real;
	horasAdminsBD : integer;
	montosProyectos : vectorR;
	arquiProyectos : vectorI;
	i : integer;
begin
	invertidoEnArgentinos := 0;
	horasAdminsBD := 0;
	for i:=1 to N_PROYECTOS do
	begin
		montosProyectos[i] := 0;
		arquiProyectos[i] := 0;
	end;
	leerDev(dev);
	while(dev.proyecto.ID <> -1) do
	begin
		pago := obtenerPago(dev);
		if(dev.pais = 'argentina') then
			invertidoEnArgentinos := invertidoEnArgentinos + pago;
		if(dev.rol = 3) then
			horasAdminsBD := horasAdminsBD + dev.horas;
		montosProyectos[dev.proyecto.ID] := montosProyectos[dev.proyecto.ID] + pago;
		if(dev.rol = 4) then
			arquiProyectos[dev.proyecto.ID] := arquiProyectos[dev.proyecto.ID] + 1; 
		leerDev(dev);
	end;
	writeln('Monto total invertido en desarrolladores argentinos: ', invertidoEnArgentinos:7:2);
	writeln('Total de horas trabajadas or Administradores de bases de datos: ', horasAdminsBD);
	writeln('Codigo del proyecto con menor monto invertido: ', indiceDelMinimo(montosProyectos));
	writeln('Arquitectos de Software por cada proyecto');
	for i:=1 to N_PROYECTOS do
		writeln('Codigo ', i, ': ', arquiProyectos[i]);
end.