program trece;

procedure siguientePatron(var patronActual : char);
begin
	if(patronActual = 'A') then
		patronActual := 'B'
	else
		patronActual := 'A';
end;

function esA(caracter : char) : boolean;
begin
	esA := NOT(caracter = '$');
end;

procedure procesarPatronA(entrada : char; var patron : char; var patronCorrecto : boolean; var cant : integer);
begin
	if(entrada = '%') then
		siguientePatron(patron)
	else if(NOT(esA(entrada))) then
		patronCorrecto := false
	else
		cant := cant + 1;
end;

procedure procesarPatronB(entrada : char; var patron : char; var patronCorrecto : boolean; var cantA, cantB, cantArrobas : integer);
begin
	if(entrada = '*') then
	begin
		if((cantA <> cantB) OR (cantArrobas > 3)) then
			patronCorrecto := false
		else
			siguientePatron(patron);

		cantA := 0;
		cantB := 0;
		cantArrobas := 0;
	end
	else
	begin
		cantB := cantB + 1;
		if(entrada = '@') then
			cantArrobas := cantArrobas + 1;
	end;
end;

var
	patron : char;
	cantA : integer;
	cantB : integer;
	cantArrobas : integer;

	patronCorrecto : boolean;
	entrada : char;
begin
	cantA := 0;
	cantB := 0;
	cantArrobas := 0;
	patron := 'A';
	repeat
		patronCorrecto := true;
		readln(entrada);
		if(patron = 'A') then
			procesarPatronA(entrada, patron, patronCorrecto, cantA)
		else
			procesarPatronB(entrada, patron, patronCorrecto, cantA, cantB, cantArrobas);
	until(patronCorrecto = false);
	writeln('Patron incorrecto: ', patron);
end.