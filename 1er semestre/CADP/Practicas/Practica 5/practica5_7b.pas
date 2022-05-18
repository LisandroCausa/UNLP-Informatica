program sieteB;
///////////////////////////////////////
Type // Provisto por el enunciado
	Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
Var
	Punteros : ArrPunteros;
///////////////////////////////////////

// B1) Tamaño de "Punteros" = 4 bytes * 2500 = 10.000 bytes

// B2) Memoria reservada despues de ejecutar
// el modulo reservarMemoria() = 2500 * (50 + 1) = 127.500 bytes dee memoria dinámica
procedure reservarMemoria(var arr:ArrPunteros);
var
	i : integer;
begin
	for i:=1 to 2500 do
		new(arr[i]);
end;

// B3)
procedure cargarNombres(var arr:ArrPunteros);
var
	i : integer;
begin
	for i:=1 to 2500 do
	begin
		write('Nombre: ');
		readln(arr[i]^);
	end;
end;

begin
end.