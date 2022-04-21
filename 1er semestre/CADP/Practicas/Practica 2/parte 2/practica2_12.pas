program doce;
function esVocal(letra : char) : boolean;
begin
	esVocal := ((letra = 'A') OR (letra = 'E') OR (letra = 'I') OR (letra = 'O') OR (letra = 'U'));
end;

function ingresarA(caracterDeCorte : char) : boolean;
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
		else if(NOT(esVocal(entrada))) then
		begin
			correcto := false;
			detenerLectura := true;
		end;
	until(detenerLectura);
	ingresarA := correcto;
end;

function esB(letra : char) : boolean;
var
	i : char;
	correcto : boolean;
begin
	correcto := false;
	if(esVocal(letra)) then
	begin
		correcto := false;
	end
	else
	begin
		for i:='B' to 'Z' do
		begin
			if(letra = i) then
				correcto := true;
		end;
	end;
	esB := correcto;
end;

function ingresarB(caracterDeCorte : char) : boolean;
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
		else if(NOT(esB(entrada))) then
		begin
			correcto := false;
			detenerLectura := true;
		end;
	until(detenerLectura);
	ingresarB := correcto;
end;

begin // INICIA PROGRAMA PRINCIPAL
	if(ingresarA('$')) then
	begin
		if(ingresarB('#')) then
			writeln('Todo correcto.')
		else
			writeln('Error en la secuencia B');
	end
	else
	begin
		writeln('Error en la secuencia A');
	end; 
end.