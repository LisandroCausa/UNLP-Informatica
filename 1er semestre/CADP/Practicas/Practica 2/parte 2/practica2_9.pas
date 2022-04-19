program nueve;
procedure sumarDigitos(numero : integer; var cantDigitos : integer; var suma : integer);
begin
	cantDigitos := 0;
	suma := 0;
	while(numero <> 0) do
	begin
		cantDigitos := cantDigitos + 1;
		suma := suma +  (numero MOD 10);
		numero := numero DIV 10;
	end;
end;

var
	entrada : integer;
	cantDigitos : integer;
	cantDigitosTotal : integer;
	sumaDigitos : integer;
begin
	cantDigitosTotal := 0;
	repeat
		readln(entrada);
		sumarDigitos(entrada, cantDigitos, sumaDigitos);
		cantDigitosTotal := cantDigitosTotal + cantDigitos;
	until(sumaDigitos = 10);
	writeln('Total de digitos leidos: ', cantDigitosTotal);
end.