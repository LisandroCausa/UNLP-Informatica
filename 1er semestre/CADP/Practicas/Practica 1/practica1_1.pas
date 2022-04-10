program uno;
var
	numero1 : integer;
	numero2 : integer;
begin
	readln(numero1);
	readln(numero2);
	if(numero1 > numero2) then
		writeln('El primer numero es mayor.')
	else if(numero2 > numero1) then
		writeln('El segundo numero es mayor.')
	else
		writeln('Ambos son iguales.');
end.