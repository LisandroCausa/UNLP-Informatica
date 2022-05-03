program diez;
const
	MAX_CANTIDAD_SALARIOS = 300;
type
	vector = array[1..MAX_CANTIDAD_SALARIOS] of real;

procedure leerSalarios(var salario : vector; var dimL : integer); 
var
	entrada : real;
begin
	dimL := 0;
	readln(entrada);
	while((entrada <> 0) AND (dimL < MAX_CANTIDAD_SALARIOS)) do
	begin
		dimL := dimL + 1;
		salario[dimL] := entrada;
		readln(entrada);
	end;
end;

procedure incrementarSalariosPor(X : real; var salario : vector; dimL : integer);
var
	i : integer;
begin
	for i:=1 to dimL do
		salario[i] := salario[i] * X;
end;

procedure imprimirPromedio(v : vector; dimL : integer);
var
	i : integer;
	suma : real;
	promedio : real;
begin
	suma := 0;
	for i:=1 to dimL do
	begin
		suma := suma + v[i];
	end;
	if(diml > 0) then 
		promedio := suma / dimL
	else
		promedio := 0;
	writeln('Promedio: ', promedio:6:2);
end;

var
	salarios : vector;
	dimL : integer;
begin
	leerSalarios(salarios, dimL);
	incrementarSalariosPor(1.15, salarios, dimL);
	imprimirPromedio(salarios, dimL);
end.