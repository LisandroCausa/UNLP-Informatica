program trece;

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
end.