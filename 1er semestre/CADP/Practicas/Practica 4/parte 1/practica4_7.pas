program siete;
type
	t_ocurrencias = array[0..9] of integer;

procedure sacarDigito(var num : integer; var digito : integer);
begin
	digito := num MOD 10;
	num := num DIV 10;
end;

procedure procesarNumero(var ocurrencias : t_ocurrencias; numero : integer);
var
	digito : integer;
begin
	repeat
		sacarDigito(numero, digito);
		ocurrencias[digito] := ocurrencias[digito] + 1;
	until(numero = 0);
end;

var
	ocurrencias : t_ocurrencias;
	entrada : integer;
	maxOcurrencias : integer;
	indiceMax : integer;
	i : integer;
begin
	maxOcurrencias := 0;
	indiceMax := -1;
	for i:=0 to 9 do
		ocurrencias[i] := 0;

	readln(entrada);
	while(entrada <> -1) do
	begin
		procesarNumero(ocurrencias, entrada);
		readln(entrada);
	end;

	for i:=0 to 9 do
	begin
		if(ocurrencias[i] > 0) then
		begin
			writeln('Numero ', i, ': ', ocurrencias[i], ' veces');
			if(ocurrencias[i] > maxOcurrencias) then
			begin
				maxOcurrencias := ocurrencias[i];
				indiceMax := i;
			end;
		end;
	end;
	if(indiceMax <> -1) then
		writeln('El digito mas leido fue el ', indiceMax);
	
	write('Los digitos que no tuvieron ocurrencias son: ');
	for i:=0 to 9 do
	begin
		if(ocurrencias[i] = 0) then
			write(i, ', ');
	end;
end.