program tres;
const
	MAX_VIAJES = 2;
type
	t_dia = 1..31;
	t_viaje = record
		dia : t_dia;
		monto : real;
		kms : real;
	end;
	vectorViajes = array[1..MAX_VIAJES] of t_viaje;
	vectorMesI = array[1..31] of integer;

procedure leerViaje(var viaje:t_viaje; var ok:boolean);
begin
	write('Dia del mes: ');
	readln(viaje.dia);

	write('Monto: $');
	readln(viaje.monto);

	write('Kms: ');
	readln(viaje.kms);
	writeln;
	ok := (viaje.kms <> 0);
end;

procedure cargarViajes(var v:vectorViajes; var dimL:integer);
var
	ok : boolean;
	entrada : t_viaje;
begin
	dimL := 0;
	leerViaje(entrada, ok);
	while((ok) AND (dimL < MAX_VIAJES)) do
	begin
		dimL := dimL + 1;
		v[dimL] := entrada;
		leerViaje(entrada, ok);
	end;
end;

procedure imprimirEstadisticas(v:vectorViajes; dimL:integer);
var
	i : integer;
	montoTotal : real;
	minDinero : t_viaje;
	viajesMes : vectorMesI;
begin
	montoTotal := 0;
	minDinero.monto := 99999;
	for i:=1 to 31 do
		viajesMes[i] := 0;

	for i:=1 to dimL do
	begin
		montoTotal := montoTotal + v[i].monto;
		if(v[i].monto <= minDinero.monto) then
			minDinero := v[i];
		viajesMes[v[i].dia] := viajesMes[v[i].dia] + 1;
	end;
	writeln('Monto promedio transportado: ', (montoTotal/dimL):7:2);
	writeln('El viaje que transporto menos dinero fue el dia ', minDinero.dia, ' que recorrio ', minDinero.kms:4:1, 'Kms');
	writeln;
	writeln('Cantidad de viajes por dia');
	for i:=1 to 31 do
		writeln('Dia ', i, ': ', viajesMes[i], ' viajes.');
end;

procedure filtrarVectorDistancia(distancia : real; var v:vectorViajes; var dimL:integer);
var
	i : integer;
	eliminados : integer;
begin
	eliminados := 0;
	for i:=1 to dimL do
	begin
		if((i + eliminados) <= dimL) then
		begin
			while(v[i + eliminados].kms = distancia) do
				eliminados := eliminados + 1;
			v[i].kms := v[i + eliminados].kms;
		end
		else
		begin
			v[i].kms := 0;
		end;
	end;
	dimL := dimL - eliminados;
end;

procedure imprimirVector(v:vectorViajes; dimL:integer);
var
	i : integer;
begin
	writeln('Distancias:');
	for i:=1 to dimL do
		write((v[i].kms):4:1, ' ');
	writeln;
end;

var
	viajes : vectorViajes;
	dimL : integer;
begin
	cargarViajes(viajes, dimL);
	imprimirEstadisticas(viajes, dimL);
	writeln;
	imprimirVector(viajes, dimL);
	filtrarVectorDistancia(100, viajes, dimL);
	writeln;
	writeln('Filtrado');
	imprimirVector(viajes, dimL);
end.