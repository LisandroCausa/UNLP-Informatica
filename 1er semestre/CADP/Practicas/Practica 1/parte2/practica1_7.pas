program siete;
var
	piloto	: string;
	tiempo	: real;
	i		: integer;

	pilotoPrimerPuesto	: string;
	tiempoPrimerPuesto	: real;

	pilotoSegundoPuesto	: string;
	tiempoSegundoPuesto	: real;

	pilotoAnteultimoPuesto	: string;
	tiempoAnteultimoPuesto	: real;

	pilotoUltimoPuesto	: string;
	tiempoUltimoPuesto	: real;
begin
	tiempoPrimerPuesto := 9999;
	tiempoSegundoPuesto := 9999;
	tiempoUltimoPuesto := -9999;
	tiempoAnteultimoPuesto := -9999;
	for i:=1 to 100 do
	begin
		write('Piloto: ');
		readln(piloto);
		write('Tiempo: ');
		readln(tiempo);
		writeln('---------------------');
		if(tiempo < tiempoPrimerPuesto) then
		begin
			pilotoSegundoPuesto := pilotoPrimerPuesto;
			pilotoPrimerPuesto := piloto;

			tiempoSegundoPuesto := tiempoPrimerPuesto;
			tiempoPrimerPuesto := tiempo;
		end
		else if(tiempo < tiempoSegundoPuesto) then
		begin
			pilotoSegundoPuesto := piloto;
			tiempoSegundoPuesto := tiempo;
		end;

		if(tiempo > tiempoUltimoPuesto) then
		begin
			pilotoAnteultimoPuesto := pilotoUltimoPuesto;
			pilotoUltimoPuesto := piloto;

			tiempoAnteultimoPuesto := tiempoUltimoPuesto;
			tiempoUltimoPuesto := tiempo;
		end
		else if(tiempo > tiempoAnteultimoPuesto) then
		begin
			pilotoAnteultimoPuesto := piloto;
			tiempoAnteultimoPuesto := tiempo;
		end;
	end;
	writeln('Primer puesto: ', pilotoPrimerPuesto);
	writeln('Segundo puesto: ', pilotoSegundoPuesto);
	writeln('Anteultimo puesto: ', pilotoAnteultimoPuesto);
	writeln('Ultimo puesto: ', pilotoUltimoPuesto);
end.