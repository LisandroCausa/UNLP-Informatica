program cinco;
function numBEsElDoble(numA, numB : integer) : boolean;
begin
	numBEsElDoble := (numA*2 = numB);
end;
var
	a, b : integer;
	cantPares		: integer;
	cantCondiciones	: integer;
begin
	cantPares := 0;
	cantCondiciones := 0;
	read(a);
	read(b);
	while((a <> 0) and (b <> 0)) do
	begin
		cantPares := cantPares + 1;
		if(numBEsElDoble(a, b)) then
			cantCondiciones := cantCondiciones + 1;
		read(a);
		read(b);
	end;
	writeln('Pares: ', cantPares);
	writeln('Condiciones: ', cantCondiciones);
end.