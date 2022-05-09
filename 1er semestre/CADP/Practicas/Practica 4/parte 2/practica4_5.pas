program cinco;
const
	N = 500;
	CIUDADES = 2400;
type
	t_dia = 1..31;
	t_mes = 1..12;
	t_fecha = record
		dia : t_dia;
		mes : t_mes;
		anio: integer;
	end;
	t_monotributo = 'A'..'F';
	t_idCiudad = 1..CIUDADES;
	t_cliente = record
		fechaContrato : t_fecha;
		monotributo : t_monotributo;
		idCiudad : t_idCiudad;
		montoMensual : real;
	end;
	vectorClientes = array[1..N] of t_cliente;

	vectorMeses = array[1..12] of integer;
	vectorAniosAWS = array[2006..2022] of vectorMeses;
	vectorMonotributos = array['A'..'F'] of integer;

	vectorI = array[1..CIUDADES] of integer;
	vectorIDCiudad = array[1..CIUDADES] of t_idCiudad;

procedure leerFecha(var f:t_fecha);
begin
	write('Dia: ');
	readln(f.dia);

	write('Mes: ');
	readln(f.mes);

	write('Año: ');
	readln(f.anio);
end;

procedure leerCliente(var c:t_cliente);
begin
	leerFecha(c.fechaContrato);
	write('Categoria de monotributo: ');
	readln(c.monotributo);

	write('Codigo ciudad: ');
	readln(c.idCiudad);

	write('Monto mensual: $');
	readln(c.montoMensual);
	writeln;
end;

procedure cargarClientes(var v:vectorClientes);
var
	i : integer;
begin
	for i:=1 to N do
		leerCliente(v[i]);
end;

procedure puntoA(v:vectorClientes);
var
	aniosAWS : vectorAniosAWS;
	i, j : integer;
	f : t_fecha;
	suma : integer;
	anioMax : integer;
	max : integer;
begin
	for i:=2006 to 2022 do
		for j:=1 to 12 do
			aniosAWS[i][j] := 0;
	for i:=1 to N do
	begin
		f := v[i].fechaContrato;
		aniosAWS[f.anio][f.mes] := aniosAWS[f.anio][f.mes] + 1;
	end;

	max := -1;
	anioMax := -1;
	for i:=2006 to 2022 do
	begin
		suma := 0;
		writeln('Año ', i);
		for j:=1 to 12 do
		begin
			writeln('Mes ', j, ': ', aniosAWS[i][j]);
			suma := suma + aniosAWS[i][j];
		end;
		if(suma >= max) then
		begin
			max := suma;
			anioMax := i;
		end;
		writeln;
	end;
	writeln;
	writeln('El año ', anioMax, ' tuvo la mayor cantidad de contratos firmados.');
end;

procedure puntoB(v:vectorClientes);
var
	monotributos : vectorMonotributos;
	m : t_monotributo;
	i : integer;
	c : char;
begin
	for c:='A' to 'F' do
		monotributos[c] := 0;

	for i:=1 to N do
	begin
		m := v[i].monotributo;
		monotributos[m] := monotributos[m] + 1;
	end;

	writeln;
	for c:='A' to 'F' do
		writeln('Monotributistas ', c, ': ', monotributos[c]);
end;

procedure puntoC(v:vectorClientes);
var
	i, j : integer;
	cantClientes : vectorI;
	idsCiudades : vectorIDCiudad;

	procedure swap(var a, b : integer);
	var
		temp : integer;
	begin
		temp := a;
		a := b;
		b := temp;
	end;

begin
	for i:=1 to CIUDADES do // Resetea los arrays
	begin
		cantClientes[i] := 0;
		idsCiudades[i] := i;
	end;

	for i:=1 to N do // Llena el array con los valores correspondientes
		cantClientes[v[i].idCiudad] := cantClientes[v[i].idCiudad] + 1;

	for i:=1 to CIUDADES do // Bubble Sort - https://es.wikipedia.org/wiki/Ordenamiento_de_burbuja
	begin
		for j:=1 to (CIUDADES-i) do
		begin
			if(cantClientes[j] > cantClientes[j+1]) then
			begin
				swap(cantClientes[j], cantClientes[j+1]);
				swap(idsCiudades[j], idsCiudades[j + 1]);
			end;
		end;
	end;

	writeln;
	writeln('Codigo de las 10 ciudades con mayor cantidad de clientes:');
	for i:=CIUDADES downto (CIUDADES-10) do
		writeln(idsCiudades[i]);
end;

function montoPromedio(v:vectorClientes) : real;
var
	i : integer;
	suma : real;
begin
	suma := 0;
	for i:=1 to N do
		suma := suma + v[i].montoMensual;
	montoPromedio := suma / N;
end;

procedure puntoD(v:vectorClientes);
var
	i : integer;
	promedio : real;
	cant : integer;
begin
	promedio := montoPromedio(v);
	cant := 0;
	for i:=1 to N do
	begin
		if(v[i].montoMensual > promedio) then
			cant := cant + 1;
	end;
	writeln;
	writeln('Cantidad de clientes que superan mensualmente el monto promedio: ', cant);
end;



var
	clientes : vectorClientes;
begin
	cargarClientes(clientes); // Datos que ya se disponen
	puntoA(clientes);
	puntoB(clientes);
	puntoC(clientes);
	puntoD(clientes);
end.