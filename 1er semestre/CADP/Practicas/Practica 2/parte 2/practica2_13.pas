program trece;

<<<<<<< HEAD
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
=======
function esA(letra : char) : boolean;
begin
	esA := (letra <> '$');
end;

procedure ingresarA(caracterDeCorte : char; var cantA : integer; var resultado : boolean);
var
	entrada : char;
	detenerLectura : boolean;
	correcto : boolean;
begin
	detenerLectura := false;
	repeat
		readln(entrada);
		if(entrada = caracterDeCorte) then
		begin
			correcto := true;
			detenerLectura := true;
		end
		else if(esA(entrada)) then
		begin
			cantA := cantA + 1;
		end
		else
		begin
			correcto := false;
			detenerLectura := true;
		end;
	until(detenerLectura);
	resultado := correcto;
end;

function ingresarB(caracterDeCorte : char; cantA : integer) : boolean;
var
	entrada : char;
	detenerLectura : boolean;
	correcto : boolean;
	cantB : integer;
	cantArrobas : integer;
begin
	cantB := 0;
	cantArrobas := 0;
	detenerLectura := false;
	repeat
		readln(entrada);
		if(entrada = caracterDeCorte) then
		begin
			correcto := true;
			detenerLectura := true;
		end
		else
		begin
			cantB := cantB + 1;
			if(entrada = '@') then
				cantArrobas := cantArrobas + 1;
			if((cantB > cantA) OR (cantArrobas > 3)) then
			begin
				correcto := false;
				detenerLectura := true;
			end;
		end;
	until(detenerLectura);
	if(cantB <> cantA) then
		correcto := false;
	ingresarB := correcto;
end;

var
	cantA : integer;
	resultadoA : boolean;
begin
	cantA := 0;
	ingresarA('%', cantA, resultadoA);
	if(resultadoA) then
	begin
		if(ingresarB('*', cantA)) then
			writeln('Todo correcto.')
		else
			writeln('Error en la secuencia B');
	end
	else
	begin
		writeln('Error en la secuencia A');
	end;
>>>>>>> origin
end.