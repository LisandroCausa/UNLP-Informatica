program dos;
const
	N = 500;
type
	vector = array[1..N] of string;

procedure leerNombre(var nombre : string);
begin
	write('Nombre: ');
	readln(nombre);
end;

procedure cargarVector(var v:vector; var dimL:integer);
var
	nombre : string;
begin
	dimL := 0;
	leerNombre(nombre);
	while((nombre <> 'ZZZ') AND (dimL < N)) do
	begin
		dimL := dimL + 1;
		v[dimL] := nombre;
		leerNombre(nombre);
	end;
end;

procedure escribirVector(v:vector; dimL:integer);
var
	i : integer;
begin
	for i:=1 to dimL do
		write(v[i], ' ');
	writeln;
end;

procedure remover(indice:integer; var v:vector; var dimL:integer);
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

procedure buscarYEliminar(nombre:string; var v:vector; var dimL: integer);
var
	i : integer;
	encontro : boolean;
begin
	encontro := false;
	i := 1;
	repeat
		if(v[i] = nombre) then
		begin
			encontro := true;
			remover(i, v, dimL);
		end;
		i := i + 1;
	until((encontro) OR (i > dimL));
end;

procedure insertar(str:string; indice : integer; var v:vector; var dimL:integer);
var
	i : integer;
begin
	if(indice <= dimL) then
	begin
		dimL := dimL + 1;
		for i:=dimL downto indice+1 do
			v[i] := v[i-1];
		v[indice] := str;
	end;
end;

procedure agregar(str:string; var v:vector; var dimL:integer);
begin
	dimL := dimL + 1;
	v[dimL] := str;
end;

var
	v : vector;
	dimL : integer;
	entrada : string;
begin
	cargarVector(v, dimL);
	escribirVector(v, dimL);
	writeln;

	readln(entrada);
	buscarYEliminar(entrada, v, dimL);
	escribirVector(v, dimL);
	writeln;

	readln(entrada);
	insertar(entrada, 4, v, dimL);
	escribirVector(v, dimL);
	writeln;

	readln(entrada);
	agregar(entrada, v, dimL);
	escribirVector(v, dimL);
end.