program diez;
function esPar(numero : integer) : boolean;
begin
	esPar := (numero MOD 2 = 0);
end;

procedure procesarNumero(numero : longInt; var sumaPares, cantImpares : integer);
var
	digito : integer;
begin
	sumaPares := 0;
	cantImpares := 0;
	while(numero <> 0) do
	begin
		digito := numero MOD 10;
		if(esPar(digito)) then
			sumaPares := sumaPares + digito
		else
			cantImpares := cantImpares + 1;
		numero := numero DIV 10;
	end;
end;

var
	entrada : longInt;
	sumaDigPares : integer;
	cantDigImpares : integer;
begin
	readln(entrada);
	while(entrada <> 123456) do
	begin
		procesarNumero(entrada, sumaDigPares, cantDigImpares);
		writeln('Suma digitos pares: ', sumaDigPares);
		writeln('Cantidad de digitos impares: ', cantDigImpares);
		readln(entrada);
	end;
end.