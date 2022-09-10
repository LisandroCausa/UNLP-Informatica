program uno;
const
	N = 300;
type
	t_oficina = record
		codigo : integer;
		DNI : string;
		costo : integer;
	end;

	vector = array[1..N] of t_oficina;

procedure leerOficina(var oficina : t_oficina);
begin
	write('Codigo: ');
	readln(oficina.codigo);
	if(oficina.codigo <> -1) then
	begin
		write('DNI: ');
		readln(oficina.DNI);

		write('Costo: $');
		readln(oficina.costo);
	end;
	writeln;
end;

// a)
procedure cargarVector(var v : vector; var dimL : integer);
var
	entrada : t_oficina;
begin
	dimL := 0;
	leerOficina(entrada);
	while((dimL < 300) and (entrada.codigo <> -1)) do
	begin
		dimL := dimL + 1;
		v[dimL] := entrada;
		leerOficina(entrada);
	end;
end;

// b)
procedure ordenar(var v : vector; dimL : integer);
var
	i : integer;
	j : integer;
	actual : t_oficina;
begin
	for i:=2 to dimL do
	begin
		actual := v[i];
		j := i - 1;
		while((j > 0) and (v[j].codigo > actual.codigo)) do
		begin
			v[j+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
end;

// c)
function busquedaDicotomica(objetivo : integer; v : vector; inicio, fin : integer) : boolean;
var
	medio : integer;
	retorno : boolean;
begin
	if(inicio <= fin) then
	begin
		medio := (inicio + fin) DIV 2;
		if(objetivo < v[medio].codigo) then
		begin
			retorno := busquedaDicotomica(objetivo, v, inicio, medio-1);
		end
		else if(objetivo > v[medio].codigo) then
		begin
			retorno := busquedaDicotomica(objetivo, v, medio+1, fin);
		end
		else
		begin
			retorno := true;
			writeln('DNI: ', v[medio].DNI);
		end;
	end
	else
	begin
		retorno := false;
		writeln('NO EXISTE ', objetivo);
	end;
	busquedaDicotomica := retorno;
end;

// d)
function montoTotalExpensas(v : vector; inicio, fin : integer) : longInt;
begin
	if(inicio <= fin) then
		montoTotalExpensas := v[inicio].costo + montoTotalExpensas(v, inicio+1, fin)
	else
		montoTotalExpensas := 0;
end;


var
	v : vector;
	dimL : integer;
	i : integer;
begin
	cargarVector(v, dimL);
	for i:=1 to dimL do
		write(v[i].codigo, ' ');
	writeln;
	ordenar(v, dimL);
	for i:=1 to dimL do
		write(v[i].codigo, ' ');
	writeln;
	busquedaDicotomica(7, v, 1, dimL);
	writeln('COSTO TOTAL EXPENSAS: $', montoTotalExpensas(v, 1, dimL));
end.