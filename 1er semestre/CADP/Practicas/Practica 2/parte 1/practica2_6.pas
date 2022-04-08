program seis;
procedure parMasAlto;
var
	max		: integer;
	entrada	: integer;
begin
	max := 0;
	readln(entrada);
	while(entrada >= 0) do
	begin
		if((entrada MOD 2 = 0) and (entrada > max)) then
			max := entrada;
		readln(entrada);
	end;
	writeln('El numero par mas alto fue: ', max);
end;
begin
	writeln('-INICIO DEL PROGRAMA-');
	parMasAlto;
	writeln('-FIN DEL PROGRAMA-');
end.
