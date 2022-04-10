program dos;
var
	numero : real;
begin
	readln(numero);
	if(numero < 0) then
		numero := -numero;
	writeln('Valor absoluto: ', numero);
end.